class ProjectUtils {
  final String image, title, subtitle;
  final String? link;
  final List<Language> languages;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.link,
    this.languages = const []
  });
}

class Language {
  final String icon, name;

  Language({
    required this.icon,
    required this.name,
  });
}

List<ProjectUtils> projectUtilsItems = [
  ProjectUtils(
      image: "assets/projects/meal_planner.png",
      title: "Meal Planner",
      link: "https://github.com/Kenz-code/meal_planner",
      subtitle: "A meal planner and grocery list app for families.",
      languages: <Language>[
        Language(icon: 'assets/flutter.svg', name: "Flutter"),
        Language(icon: "assets/dart.svg", name: "Dart"),
        Language(icon: "assets/firebase.svg", name: "Firebase"),
      ]
  ),
  ProjectUtils(
    image: "assets/projects/deep_sea_dive.png",
    title: "Deep Sea Dive",
    link: "https://github.com/Kenz-code/Deep-Sea-Dive",
    subtitle: "A game made for the Brackey's Game Jam 2023.2, which placed #18th place out of more then 850 games.",
    languages: <Language>[
      Language(icon: 'assets/godot.svg', name: "Godot"),
      Language(icon: 'assets/aseprite.svg', name: "Aseprite"),
    ],
  ),
  ProjectUtils(
    image: "assets/projects/tackle_time.png",
    title: "Tackle Time",
    link: "https://github.com/Kenz-code/Tackle-Time",
    subtitle: "A fishing calendar app to plan your perfect fishing trip!",
    languages: <Language>[
      Language(icon: 'assets/flutter.svg', name: "Flutter"),
      Language(icon: "assets/dart.svg", name: "Dart"),
    ],
  ),
  ProjectUtils(
    image: "assets/projects/boggle.png",
    title: "Boggle",
    link: "https://github.com/Kenz-code/boggle",
    subtitle: "A minimalistic mobile game based on the famous board game Boggle!",
    languages: <Language>[
      Language(icon: 'assets/flutter.svg', name: "Flutter"),
      Language(icon: "assets/dart.svg", name: "Dart"),
    ],
  ),
];