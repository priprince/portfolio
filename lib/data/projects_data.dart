import 'package:pravin_portfolio/models/project_model.dart';

final List<ProjectModel> projects = [
  ProjectModel(
    title: "Expense Tracker App",
    description:
        "A Flutter application to track daily expenses with charts and analytics.",
    image: "assets/projects/expense.png",
    tech: ["Flutter", "Firebase"],
    github: "https://github.com/yourusername/expense-tracker",
    live: "",
  ),
  ProjectModel(
    title: "Portfolio Website",
    description:
        "Personal developer portfolio built with Flutter Web and responsive design.",
    image: "assets/projects/portfolio.png",
    tech: ["Flutter Web"],
    github: "https://github.com/yourusername/portfolio",
    live: "",
  ),
];
