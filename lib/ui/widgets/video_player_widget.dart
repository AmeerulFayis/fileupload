import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String fileUrl;

  const VideoPlayerWidget({Key? key, required this.fileUrl}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.fileUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ?AspectRatio(
      aspectRatio: 16 / 9, // Adjust the aspect ratio according to your video
      child: VideoPlayer(VideoPlayerController.network(widget.fileUrl)),
    ):CircularProgressIndicator();
  }
}