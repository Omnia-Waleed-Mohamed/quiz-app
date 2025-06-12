import 'package:quiz_app/models/questions.dart';

List<QuestionsModel> questionsList = [
  QuestionsModel(
      "What is Flutter primarily used for?",
      [
        "Web scraping",
        "Game development",
        "Mobile app development",
        "Desktop OS"
      ],
      "Mobile app development"),
  QuestionsModel("What language is used to write Flutter apps?",
      ["Java", "Kotlin", "Dart", "Swift"], "Dart"),
  QuestionsModel("Who develops Flutter?",
      ["Facebook", "Apple", "Google", "Microsoft"], "Google"),
  QuestionsModel(
      "What is a widget in Flutter?",
      [
        "A layout tool",
        "A button only",
        "A class to build UI",
        "Just animation"
      ],
      "A class to build UI"),
  QuestionsModel("Which widget is used for layout in a column?",
      ["Row", "Stack", "ListView", "Column"], "Column"),
  QuestionsModel(
      "How do you update UI in Flutter?",
      ["Call setState", "Use Navigator", "Use dispose", "Use Future"],
      "Call setState"),
  QuestionsModel(
      "What is hot reload?",
      [
        "App restarts",
        "UI preview",
        "Code suggestion",
        "UI updates without full restart"
      ],
      "UI updates without full restart"),
  QuestionsModel("Which file starts a Flutter app?",
      ["main.dart", "app.dart", "home.dart", "start.dart"], "main.dart"),
  QuestionsModel(
      "What does MaterialApp provide?",
      ["Theme and routing", "State management", "Database", "Animations"],
      "Theme and routing"),
  QuestionsModel("Which widget shows a scrollable list?",
      ["Container", "Text", "ListView", "AppBar"], "ListView"),
];
