import 'package:stacked/stacked.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CourseContentDetailScreenViewModel extends BaseViewModel {
  YoutubePlayerController _controller;
  YoutubePlayerController get controller => _controller;

  setYoutubePlayerController(String videoId) {
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        autoPlay: false,
      ),
    );
  }
}
