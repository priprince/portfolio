import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:pravin_portfolio/core/constants/strings.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class Navbar extends StatelessWidget {
  final Function(GlobalKey) scrollToSection;

  final GlobalKey heroKey;
  final GlobalKey aboutKey;
  final GlobalKey skillsKey;
  final GlobalKey projectsKey;
  final GlobalKey experienceKey;
  final GlobalKey educationKey;
  final GlobalKey contactKey;

  const Navbar({
    super.key,
    required this.scrollToSection,
    required this.heroKey,
    required this.aboutKey,
    required this.skillsKey,
    required this.projectsKey,
    required this.experienceKey,
    required this.educationKey,
    required this.contactKey,
  });

  void _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: AppColors.bgDark.withValues(alpha: 0.95),
        border: Border(bottom: BorderSide(color: AppColors.bgLight, width: 1)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.05),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => AppColors.premiumGradient.createShader(
              Offset.zero & bounds.size,
            ),
            child: Text(
              "PRAVIN",
              style: AppTextStyles.headingSmall.copyWith(letterSpacing: 2),
            ),
          ),
          Spacer(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavItem(title: "Home", onTap: () => scrollToSection(heroKey)),
                  NavItem(
                    title: "About",
                    onTap: () => scrollToSection(aboutKey),
                  ),
                  NavItem(
                    title: "Skills",
                    onTap: () => scrollToSection(skillsKey),
                  ),
                  NavItem(
                    title: "Projects",
                    onTap: () => scrollToSection(projectsKey),
                  ),
                  NavItem(
                    title: "Experience",
                    onTap: () => scrollToSection(experienceKey),
                  ),
                  NavItem(
                    title: "Education",
                    onTap: () => scrollToSection(educationKey),
                  ),
                  NavItem(
                    title: "Contact",
                    onTap: () => scrollToSection(contactKey),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              // TextButton(
              //   onPressed: () => _openUrl("https://github.com/priprince"),
              //   child: Text(
              //     "GitHub",
              //     style: AppTextStyles.labelLarge.copyWith(
              //       color: AppColors.textSecondary,
              //     ),
              //   ),
              // ),
              // const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  // html.window.open(MyString.pravinResume, '_blank');
                  final url = Uri.base
                      .resolve(MyString.pravinResume)
                      .toString();
                  html.window.open(url, '_blank');
                },
                child: Text(
                  "Resume",
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.bgDark,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const NavItem({super.key, required this.title, required this.onTap});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: AppTextStyles.labelLarge.copyWith(
                  color: _isHovered
                      ? AppColors.primary
                      : AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 4),
              if (_isHovered)
                Container(
                  height: 2,
                  width: 20,
                  decoration: BoxDecoration(
                    gradient: AppColors.premiumGradient,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
