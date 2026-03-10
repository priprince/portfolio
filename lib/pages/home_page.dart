import 'package:flutter/material.dart';
import 'package:pravin_portfolio/widgets/navbar.dart';
import '../core/theme/app_colors.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/projects_section.dart';
import '../sections/experience_section.dart';
import '../sections/education_section.dart';
import '../sections/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.bgGradient),
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(projectsKey, scrollToSection, key: heroKey),
                  const SizedBox(height: 90),
                  Divider(color: AppColors.bgLight, height: 1),
                  AboutSection(key: aboutKey),
                  const SizedBox(height: 90),
                  Divider(color: AppColors.bgLight, height: 1),
                  SkillsSection(key: skillsKey),
                  const SizedBox(height: 90),
                  Divider(color: AppColors.bgLight, height: 1),
                  ProjectsSection(key: projectsKey),
                  const SizedBox(height: 90),
                  Divider(color: AppColors.bgLight, height: 1),
                  ExperienceSection(key: experienceKey),
                  const SizedBox(height: 90),
                  Divider(color: AppColors.bgLight, height: 1),
                  EducationSection(key: educationKey),
                  const SizedBox(height: 90),
                  Divider(color: AppColors.bgLight, height: 1),
                  ContactSection(key: contactKey),
                ],
              ),
            ),
            Navbar(
              scrollToSection: scrollToSection,
              heroKey: heroKey,
              aboutKey: aboutKey,
              skillsKey: skillsKey,
              projectsKey: projectsKey,
              experienceKey: experienceKey,
              educationKey: educationKey,
              contactKey: contactKey,
            ),
          ],
        ),
      ),
    );
  }
}
