import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pravin_portfolio/core/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/utils/responsive.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  void _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getPadding(context),
        vertical: isMobile ? 80 : 120,
      ),
      decoration: BoxDecoration(gradient: AppColors.bgGradient),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Responsive.getMaxWidth(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Education & Certifications",
                style: AppTextStyles.headingXLarge,
              ),
              SizedBox(height: isMobile ? 40 : 60),
              _DegreeCard(),
              SizedBox(height: isMobile ? 40 : 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Professional Certifications",
                    style: AppTextStyles.headingMedium,
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: isMobile ? 20 : 30,
                    runSpacing: isMobile ? 20 : 30,
                    children: [
                      // _CertificateCard(
                      //   title: "AWS Certified Developer",
                      //   subtitle: "Associate Level",
                      //   icon: FontAwesomeIcons.aws,
                      //   onTap: () {},
                      // ),
                      _CertificateCard(
                        title: "AI Engineer Bootcamp",
                        subtitle: "Udemy | October 2025",
                        icon: FontAwesomeIcons.brain,
                        link: MyString.aiEngineeringBootCamp,
                        onTap: () => _openUrl(MyString.aiEngineeringBootCamp),
                      ),
                      _CertificateCard(
                        title: "Dart & Flutter Mastery",
                        subtitle: "Udemy | November 2023",
                        icon: FontAwesomeIcons.flutter,
                        link: MyString.dartAndFlutterMastery,
                        onTap: () => _openUrl(MyString.dartAndFlutterMastery),
                      ),
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

class _DegreeCard extends StatefulWidget {
  @override
  State<_DegreeCard> createState() => _DegreeCardState();
}

class _DegreeCardState extends State<_DegreeCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(40),
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
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 16,
                  ),
                ]
              : [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    blurRadius: 8,
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: AppColors.premiumGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.graduationCap,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bachelor of Engineering",
                    style: AppTextStyles.headingMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Aeronautical Engineering",
                    style: AppTextStyles.bodyXLarge.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Aeronautical engineering focus on innovation, precision, and the future of flight, such as Shaping the Future of Aerospace.",
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CertificateCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String? link;
  final VoidCallback onTap;

  const _CertificateCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.link,
    required this.onTap,
  });

  @override
  State<_CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<_CertificateCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 320,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: AppColors.bgMedium,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered ? AppColors.secondary : AppColors.bgLight,
              width: _isHovered ? 2 : 1.5,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.secondary.withValues(alpha: 0.3),
                      blurRadius: 16,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      blurRadius: 8,
                    ),
                  ],
          ),
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: _isHovered
                      ? AppColors.secondary.withValues(alpha: 0.2)
                      : AppColors.secondary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: FaIcon(
                    widget.icon,
                    size: 36,
                    color: _isHovered
                        ? AppColors.secondary
                        : AppColors.secondary.withValues(alpha: 0.8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: AppTextStyles.headingSmall,
              ),
              const SizedBox(height: 8),
              Text(
                widget.subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              if (widget.link != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.externalLink,
                        size: 12,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "View Certificate",
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
