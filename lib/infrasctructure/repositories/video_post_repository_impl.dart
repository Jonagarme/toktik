import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repositories.dart';

class VideoPostsRepositoryImp implements VideoPostRepository {
  final VideoPostRepository videosDatasource;

  VideoPostsRepositoryImp({
    required this.videosDatasource,
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }
}
