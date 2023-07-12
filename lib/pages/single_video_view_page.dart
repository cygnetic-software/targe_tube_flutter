import 'package:aneen/model/video_model.dart';
import 'package:flutter/material.dart';
import 'package:aneen/widgets/SingleVideoViewPage/video_description.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class SingleVideoViewPage extends StatefulWidget {
  final VideoModel video;
  const SingleVideoViewPage({required this.video});

  @override
  _SingleVideoViewPageState createState() => _SingleVideoViewPageState();
}

class _SingleVideoViewPageState extends State<SingleVideoViewPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.video.url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      looping: false,
      autoPlay: false,
      errorBuilder: (context, errorMessage) {
        return Center(
            child: Text(errorMessage, style: TextStyle(color: Colors.white)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.video.title)),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Chewie(
                  controller: _chewieController!,
                ),
              ),
              SizedBox(height: 18),
              VideoDescription(
                video: widget.video,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
