import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repositories.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostReposity;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoPostReposity,
  });

  Future<void> loadNextPage() async {
    //await Future.delayed(const Duration(seconds: 2));

    /* final List newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList(); */

    final newVideos = await videoPostReposity.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
