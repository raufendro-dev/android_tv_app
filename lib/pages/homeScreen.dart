import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> videoUrls = [
    // Add more URLs as needed
  ];
  cek() async {
    print("jalan");
    String url = "http://adsvideo.citraweb.co.id/api/iklan/";
    Map body = {
      "key": "c6cb45f6ac898a49cae6db1a48b254c9",
      "auth_office": "eb163727917cbba1eea208541a643e74",
      "auth_device": "86c034bb216ef4476a1a02a36bc0423d",
      "sn": "10000316031575",
      "mac": "B4E265C572C9"
    };
    var responseAPI = await http.post(Uri.parse(url), body: jsonEncode(body));
    print(body);
    Map<String, dynamic> hasil = jsonDecode(responseAPI.body);
    print(hasil);
    if (hasil['data'] != null) {
      print("data dapat");
      videoUrls.clear();
      for (var i = 0; i < hasil['data'].length; i++) {
        videoUrls.add(hasil['data'][i]['iklan_video_file_url']);
      }
      print(videoUrls);
    }
    final filePaths = await downloadVideos(videoUrls);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullscreenVideoPlayer(
          videoPaths: filePaths,
          initialIndex: 0,
        ),
      ),
    );
  }

  Future<void> _downloadAndPlayVideos(BuildContext context) async {
    final filePaths = await downloadVideos(videoUrls);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoListScreen(videoPaths: filePaths),
      ),
    );
  }

  var downloadedVideos = 0;

  Future<List<String>> downloadVideos(List<String> urls) async {
    List<String> filePaths = [];
    for (String url in urls) {
      final response =
          await http.Client().send(http.Request('GET', Uri.parse(url)));
      final directory = await getApplicationDocumentsDirectory();
      final fileName = url.split('/').last;
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      int totalBytes = response.contentLength ?? 0;
      int receivedBytes = 0;

      final sink = file.openWrite();
      setState(() {
        downloadedVideos = downloadedVideos + 1;
      });
      await for (var chunk in response.stream) {
        sink.add(chunk);
        receivedBytes += chunk.length;
        setState(() {
          _progress = receivedBytes / totalBytes;
        });
      }
      await sink.close();
      filePaths.add(filePath);
    }
    return filePaths;
  }

  double _progress = 0.0;
  @override
  void initState() {
    super.initState();
    cek();
  }

  //tes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Unduh video'),
            Text('Mengunduh ' +
                downloadedVideos.toString() +
                '/' +
                videoUrls.length.toString()),
            if (_progress > 0 && _progress < 1)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: LinearProgressIndicator(value: _progress),
              ),
          ],
        ),
      ),
    );
  }
}

class VideoListScreen extends StatelessWidget {
  final List<String> videoPaths;

  VideoListScreen({required this.videoPaths});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Downloaded Videos')),
      body: ListView.builder(
        itemCount: videoPaths.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Video ${index + 1}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullscreenVideoPlayer(
                    videoPaths: videoPaths,
                    initialIndex: index,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FullscreenVideoPlayer extends StatefulWidget {
  final List<String> videoPaths;
  final int initialIndex;

  FullscreenVideoPlayer({
    required this.videoPaths,
    required this.initialIndex,
  });

  @override
  _FullscreenVideoPlayerState createState() => _FullscreenVideoPlayerState();
}

class _FullscreenVideoPlayerState extends State<FullscreenVideoPlayer> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    if (_chewieController != null) {
      _chewieController!.dispose();
    }

    _controller =
        VideoPlayerController.file(File(widget.videoPaths[_currentIndex]))
          ..initialize().then((_) {
            setState(() {});
            _controller.play();
          });
    if (_controller != null) {
      _controller.dispose();
    }
    _controller.addListener(_videoListener);
    _chewieController = ChewieController(
        videoPlayerController: _controller,
        aspectRatio: 16 / 9,
        autoPlay: true,
        looping: false,
        allowFullScreen: true);
  }

  void _videoListener() {
    if (_controller.value.position >= _controller.value.duration) {
      _playNextVideo();
    }
  }

  // Future<void> _initializePlayer() async {
  //   _controller =
  //       VideoPlayerController.file(File(widget.videoPaths[_currentIndex]))
  //         ..initialize().then((_) {
  //           setState(() {});
  //           _controller.play();
  //         });
  //   _chewieController = ChewieController(
  //     videoPlayerController: _controller,
  //     aspectRatio: _controller.value.aspectRatio,
  //     autoPlay: true,
  //     looping: true,
  //   );
  // }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void _playNextVideo() {
    _currentIndex = (_currentIndex + 1) % widget.videoPaths.length;
    _initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Chewie(
          controller: _chewieController!,
        ),
      )),
    );
  }
}
