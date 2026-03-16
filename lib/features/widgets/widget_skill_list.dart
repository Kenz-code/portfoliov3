import 'package:flutter/material.dart';
import 'package:portfoliov3/features/widgets/widget_skill.dart';
import 'package:visibility_detector/visibility_detector.dart';

class WidgetSkillList extends StatefulWidget {
  const WidgetSkillList({super.key});

  @override
  State<WidgetSkillList> createState() => _WidgetSkillListState();
}

class _WidgetSkillListState extends State<WidgetSkillList>
    with TickerProviderStateMixin {

  static const _skills = [
    (title: "Flutter",  subtitle: "UI toolkit",            asset: "assets/flutter.svg",  url: "https://flutter.dev/"),
    (title: "Dart",     subtitle: "Programming language",  asset: "assets/dart.svg",     url: "https://dart.dev/"),
    (title: "Firebase", subtitle: "Backend platform",      asset: "assets/firebase.svg", url: "https://firebase.google.com/"),
    (title: "Github",   subtitle: "Version Control",       asset: "assets/github.svg",   url: "https://github.com/"),
    (title: "Python",   subtitle: "Programming language",  asset: "assets/python.svg",   url: "https://www.python.org/"),
  ];

  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _animations;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      _skills.length,
          (i) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
      ),
    );

    _animations = _controllers.map((c) =>
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: c, curve: Curves.easeOutCirc),
        ),
    ).toList();
  }

  @override
  void dispose() {
    for (final c in _controllers) c.dispose();
    super.dispose();
  }

  Future<void> _runStagger() async {
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].forward();
      await Future.delayed(const Duration(milliseconds: 120));
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.2 && !_hasAnimated) {
      _hasAnimated = true;
      _runStagger();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('widget-skill-list'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8,
        spacing: 8,
        children: List.generate(_skills.length, (i) {
          final s = _skills[i];
          return ScaleTransition(
            scale: _animations[i],
            child: WidgetSkill(
              title: s.title,
              subtitle: s.subtitle,
              assetName: s.asset,
              website: s.url,
            ),
          );
        }),
      ),
    );
  }
}