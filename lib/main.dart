import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/domain/repositories/video_posts_repositories.dart';
import 'package:toktik/infrasctructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrasctructure/repositories/video_post_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostReposity = VideoPostsRepositoryImp(
      videosDatasource: LocalVideoDatasource() as VideoPostRepository,
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videoPostReposity: videoPostReposity)
            ..loadNextPage(),
        )
      ],
      child: MaterialApp(
        title: 'Tok Tik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
