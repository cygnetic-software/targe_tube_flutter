import 'package:aneen/controllers/auth_controller.dart';
import 'package:aneen/global/user.dart';
import 'package:aneen/home.dart';
import 'package:aneen/model/video_model.dart';
import 'package:aneen/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:aneen/widgets/SingleVideoViewPage/video_description.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
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
    final controller = Get.find<AuthController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.video.title),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text("User Actions"),
                        contentPadding: EdgeInsets.all(13),
                        children: [
                          ListTile(
                            onTap: widget.video.uploaderId == user.value.id
                                ? null
                                : () {
                                    controller
                                        .blockUser(widget.video.uploaderId);
                                  },
                            leading: Icon(Icons.report),
                            title: Text("Report"),
                          ),
                          ListTile(
                            textColor: Colors.red,
                            iconColor: Colors.red,
                            onTap: widget.video.uploaderId == user.value.id
                                ? null
                                : () {
                                    controller
                                        .blockUser(widget.video.uploaderId);
                                    Get.offAll(() => Home());
                                  },
                            leading: Icon(Icons.block),
                            title: Text("Block"),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.more_horiz))
          ],
        ),
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
