import 'package:flutter/material.dart';
import 'package:podtimer/config/router/app_router.dart';
import 'package:podtimer/datasources/cache_sp_impl.dart';
import 'package:podtimer/presentation/widgets/shared/full_screen_loader.dart';

class SplashScreen extends StatefulWidget {
  static const name = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() async {
    super.initState();

    final String? userCode = await CacheSpImpl().getUserCode();
    if (userCode == null || userCode.isEmpty) {
      appRouter.go("/login");
    } else {
      appRouter.go("/home/1"); //TODO: fetch user data ¿?
    }
  }

  @override
  Widget build(BuildContext context) {
    return const FullScreenLoader();
  }
}
