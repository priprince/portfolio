import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
      decoration: BoxDecoration(gradient: AppColors.bgGradient),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Technical Skills", style: AppTextStyles.headingXLarge),
              const SizedBox(height: 24),
              Text(
                "Expertise across full‑stack mobile development, backend architecture, and cloud infrastructure",
                style: AppTextStyles.bodyXLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 60),
              Wrap(
                spacing: 30,
                runSpacing: 30,
                children: const [
                  SkillCategoryCard(
                    title: "Mobile & Cross-Platform",
                    icon: FontAwesomeIcons.mobile,
                    color: AppColors.secondary,
                    skills: [
                      "Flutter",
                      "Dart",
                      "Android",
                      "iOS",
                      "Flutter Web",
                    ],
                  ),
                  SkillCategoryCard(
                    title: "State Management",
                    icon: FontAwesomeIcons.sitemap,
                    color: AppColors.secondary,
                    skills: [
                      "BLoC",
                      "Riverpod",
                      "GetX",
                      "Provider",
                      "ChangeNotifier",
                    ],
                  ),
                  SkillCategoryCard(
                    title: "Backend & APIs",
                    icon: FontAwesomeIcons.server,
                    color: AppColors.secondary,
                    skills: [
                      "Node.js",
                      "GraphQL",
                      "REST APIs",
                      "WebSockets",
                      "Apollo Server",
                    ],
                  ),
                  SkillCategoryCard(
                    title: "Databases & Storage",
                    icon: FontAwesomeIcons.database,
                    color: AppColors.secondary,
                    skills: [
                      "PostgreSQL",
                      "Hive",
                      "Isar",
                      "Secure Storage",
                      "Firebase Firestore",
                    ],
                  ),
                  SkillCategoryCard(
                    title: "Cloud & DevOps",
                    icon: FontAwesomeIcons.cloud,
                    color: AppColors.secondary,
                    skills: [
                      "AWS Lambda",
                      "Cognito",
                      "Amplify",
                      "S3/CloudFront",
                      "CodeMagic",
                      "Docker",
                      "Serverless",
                      "Supabase",
                    ],
                  ),
                  SkillCategoryCard(
                    title: "AI & ML Integration",
                    icon: FontAwesomeIcons.brain,
                    color: AppColors.secondary,
                    skills: [
                      "Gemini API",
                      "GPT-4 Vision",
                      "YOLOv8",
                      "Roboflow",
                    ],
                  ),
                  SkillCategoryCard(
                    title: "Languages & Tools",
                    icon: FontAwesomeIcons.code,
                    color: AppColors.secondary,
                    skills: [
                      "Java (Basic)",
                      "Kotlin (Basic)",
                      "SwiftUI (Basic)",
                      "Rust (Audio tags)",
                      "Knex.js",
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillCategoryCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> skills;

  const SkillCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.skills,
  });

  @override
  State<SkillCategoryCard> createState() => _SkillCategoryCardState();
}

class _SkillCategoryCardState extends State<SkillCategoryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 320,
        constraints: const BoxConstraints(minHeight: 280),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColors.bgMedium,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? widget.color.withValues(alpha: 0.6)
                : AppColors.bgLight,
            width: _isHovered ? 2 : 1.5,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.25),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Icon Header
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.color.withValues(alpha: 0.8),
                    widget.color.withValues(alpha: 0.4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: FaIcon(widget.icon, size: 28, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            /// Title
            Text(widget.title, style: AppTextStyles.headingSmall),
            const SizedBox(height: 20),

            /// Skills
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.skills
                  .map(
                    (skill) => _SkillBadge(label: skill, color: widget.color),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillBadge extends StatefulWidget {
  final String label;
  final Color color;

  const _SkillBadge({required this.label, required this.color});

  @override
  State<_SkillBadge> createState() => _SkillBadgeState();
}

class _SkillBadgeState extends State<_SkillBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _isHovered
              ? widget.color.withValues(alpha: 0.25)
              : widget.color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: widget.color.withValues(alpha: _isHovered ? 0.7 : 0.4),
            width: 1,
          ),
        ),
        child: Text(
          widget.label,
          style: AppTextStyles.labelMedium.copyWith(
            color: _isHovered
                ? widget.color
                : widget.color.withValues(alpha: 0.9),
            fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
