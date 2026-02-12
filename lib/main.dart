// lib/main.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posts_project/features/posts/presentation/pages/posts_page.dart';
import 'package:provider/provider.dart';
import 'core/dependency_injection.dart' as di;
import 'features/posts/presentation/controller/posts_provider.dart'; // ✅ Import as 'di'

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Required for async main
  await di.init(); // ✅ Initialize GetIt BEFORE runApp

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.sl<PostsProvider>()..fetchPosts(),
        ),
      ],
      child: const MyAPP(),
    ),
  );
}

class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => PostsPage())
  ],
);