import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfoliov3/core/theme/colors.dart';
import 'package:portfoliov3/core/theme/theme.dart';

class AppLoader extends StatefulWidget {
  final Widget child;
  const AppLoader({super.key, required this.child});

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeIn;
  bool _loaded = false;

  // List every asset you use
  static const _svgs = [
    'assets/flutter.svg',
    'assets/dart.svg',
    'assets/firebase.svg',
    'assets/github.svg',
    'assets/python.svg',
  ];

  // Add any raster images here if you have them
  static const _images = <String>[
    'assets/landing_screenshots.png',
    'assets/projects/meal_planner.png',
    'assets/projects/tackle_time.png',
    'assets/projects/boggle.png',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadAll();
    });
  }

  Future<void> _preloadAll() async {
    final svgFutures = _svgs.map((path) async {
      final loader = SvgAssetLoader(path);
      await svg.cache.putIfAbsent(
        loader.cacheKey(null),
            () => loader.loadBytes(null),
      );
    });

    final imgFutures = _images.map((path) =>
        precacheImage(AssetImage(path), context),
    );

    await Future.wait([...svgFutures, ...imgFutures]);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fadeIn,
      builder: (context, child) {
        if (_fadeIn.value == 0.0) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: darkColorScheme.onSurfaceVariant,
              ),
            ),
          );
        }
        return ColoredBox(
          color: Theme.of(context).colorScheme.surface,
          child: Opacity(opacity: _fadeIn.value, child: child),
        );
      },
      child: widget.child,
    );
  }
}