import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

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
              Text("Work Experience", style: AppTextStyles.headingXLarge),
              const SizedBox(height: 60),
              const ExperienceCard(
                position: "Senior Flutter Engineer",
                company: "Honerise Digital",
                duration: "2022 ‑ Present",
                description:
                    "Architecting cross‑platform mobile solutions with Flutter 3+ and leading a distributed team. Collaborate closely with backend and ML engineers to integrate GraphQL APIs, AWS Lambda, and AI features while mentoring junior developers and enforcing code quality standards.",
              ),
              const SizedBox(height: 40),
              const ExperienceCard(
                position: "Lead Mobile Developer",
                company: "Fire Bee Techno Services",
                duration: "2022 ‑ 2022",
                description:
                    "Spearheaded the redevelopment of a flagship fintech app using Flutter, implementing secure authentication with Cognito, real‑time data using WebSockets, and a modular architecture that served 100K+ users.",
              ),
              const SizedBox(height: 40),
              const ExperienceCard(
                position: "Flutter Developer",
                company: "Cviac",
                duration: "2020 ‑ 2021",
                description:
                    "Developed HIPAA‑compliant healthcare apps featuring RPM device support and complex data visualizations, optimized for performance on low‑end devices and integrated with third‑party analytics.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExperienceCard extends StatefulWidget {
  final String position;
  final String company;
  final String duration;
  final String description;

  const ExperienceCard({
    required this.position,
    required this.company,
    required this.duration,
    required this.description,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColors.bgMedium,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? AppColors.primary : AppColors.bgLight,
            width: _isHovered ? 2 : 1.5,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 16,
                  ),
                ]
              : [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 8,
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 8,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.position, style: AppTextStyles.headingSmall),
                    const SizedBox(height: 4),
                    Text(
                      widget.company,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.5),
                    ),
                  ),
                  child: Text(
                    widget.duration,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(widget.description, style: AppTextStyles.bodyLarge),
          ],
        ),
      ),
    );
  }
}
