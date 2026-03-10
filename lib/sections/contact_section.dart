import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  void _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
      decoration: BoxDecoration(gradient: AppColors.bgGradient),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Get In Touch",
                style: AppTextStyles.headingXLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                "I'm always open to discussing new projects, innovative ideas, or opportunities to be part of your vision.",
                style: AppTextStyles.bodyXLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.bgDark,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 8,
                      shadowColor: AppColors.primary.withOpacity(0.5),
                    ),
                    onPressed: () {
                      _openUrl("mailto:pravinflutterboy@gmail.com");
                    },
                    child: Text(
                      "Send Email",
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.bgDark,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.secondary,
                        width: 2,
                      ),
                      foregroundColor: AppColors.secondary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      _openUrl("https://linkedin.com/in/pravin");
                    },
                    child: Text(
                      "Connect on LinkedIn",
                      style: AppTextStyles.labelLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ContactIconButton(
                    icon: FontAwesomeIcons.github,
                    label: "GitHub",
                    onPressed: () => _openUrl("https://github.com/priprince"),
                  ),
                  const SizedBox(width: 40),
                  _ContactIconButton(
                    icon: FontAwesomeIcons.linkedin,
                    label: "LinkedIn",
                    onPressed: () => _openUrl("https://linkedin.com/in/pravin"),
                  ),
                  const SizedBox(width: 40),
                  _ContactIconButton(
                    icon: FontAwesomeIcons.envelope,
                    label: "Email",
                    onPressed: () =>
                        _openUrl("mailto:pravinflutterboy@gmail.com"),
                  ),
                  const SizedBox(width: 40),
                  _ContactIconButton(
                    icon: FontAwesomeIcons.twitter,
                    label: "Twitter",
                    onPressed: () =>
                        _openUrl("https://twitter.com/pravinflutter"),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Divider(color: AppColors.bgLight, height: 1),
              const SizedBox(height: 40),
              Text(
                "© 2024 Pravin D. All rights reserved.",
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactIconButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _ContactIconButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  State<_ContactIconButton> createState() => _ContactIconButtonState();
}

class _ContactIconButtonState extends State<_ContactIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isHovered
                    ? AppColors.primary.withOpacity(0.2)
                    : Colors.transparent,
                border: Border.all(
                  color: _isHovered ? AppColors.primary : AppColors.bgLight,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 12,
                        ),
                      ]
                    : [],
              ),
              child: FaIcon(
                widget.icon,
                color: _isHovered ? AppColors.primary : AppColors.textSecondary,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.label,
              style: AppTextStyles.bodySmall.copyWith(
                color: _isHovered ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
