import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class YoutubeDefaultWidget extends StatefulWidget {
  final String video;

  YoutubeDefaultWidget(this.video);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<YoutubeDefaultWidget>
    implements YouTubePlayerListener {
  double _currentVideoSecond = 0.0;
  String _playerState = "";
  FlutterYoutubeViewController _controller;

  @override
  void onCurrentSecond(double second) {
    print("onCurrentSecond second = $second");
    _currentVideoSecond = second;
  }

  @override
  void onError(String error) {
    print("onError error = $error");
  }

  @override
  void onReady() {
    print("onReady");
  }

  @override
  void onStateChange(String state) {
    print("onStateChange state = $state");
    setState(() {
      _playerState = state;
    });
  }

  @override
  void onVideoDuration(double duration) {
    print("onVideoDuration duration = $duration");
  }

  void _onYoutubeCreated(FlutterYoutubeViewController controller) {
    this._controller = controller;
  }

  void _loadOrCueVideo() {
    _controller.loadOrCueVideo('gcj2RUWQZ60', _currentVideoSecond);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 30,
      width: SizeConfig.blockSizeHorizontal * 90,
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 3),
      child: FlutterYoutubeView(
        onViewCreated: _onYoutubeCreated,
        listener: this,
        params: YoutubeParam(
          videoId: widget.video,
          showUI: true,
          startSeconds: 0.0,
          showYoutube: false,
          showFullScreen: false,
        ),
      ),
    );
  }
}
