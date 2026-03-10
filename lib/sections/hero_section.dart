import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class HeroSection extends StatelessWidget {
  const HeroSection(this.anotherKey, this.fun, {super.key});

  final GlobalKey anotherKey;
  final void Function(GlobalKey key) fun;

  void _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(gradient: AppColors.bgGradient),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Greeting
                  Text(
                    "Hi, I'm",
                    style: AppTextStyles.bodyXLarge.copyWith(
                      color: AppColors.primary,
                    ),
                  ).animate().fadeIn(duration: 600.ms),

                  const SizedBox(height: 10),

                  /// Name - Gradient Text
                  ShaderMask(
                    shaderCallback: (bounds) => AppColors.premiumGradient
                        .createShader(Offset.zero & bounds.size),
                    child: Text("Pravin D", style: AppTextStyles.displayXLarge),
                  ).animate().fadeIn(delay: 200.ms),
                  const SizedBox(height: 16),

                  /// Title
                  Text(
                    "Senior Flutter Developer • Full-Stack Mobile Engineer",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.displayMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ).animate().fadeIn(delay: 400.ms),

                  const SizedBox(height: 20),

                  /// Tagline
                  Text(
                    "Building scalable cross-platform mobile apps across healthcare, fintech, crypto and AI platforms.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyXLarge.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ).animate().fadeIn(delay: 600.ms),

                  const SizedBox(height: 40),

                  /// Buttons
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
                          shadowColor: AppColors.primary.withValues(alpha: 0.5),
                        ),
                        onPressed: () {
                          fun(anotherKey);
                        },
                        child: Text(
                          "View Projects",
                          style: AppTextStyles.labelLarge.copyWith(
                            color: AppColors.bgDark,
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: AppColors.primary,
                            width: 2,
                          ),
                          foregroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          _openUrl("https://github.com/priprince");
                        },
                        child: Text("GitHub", style: AppTextStyles.labelLarge),
                      ),
                    ],
                  ).animate().fadeIn(delay: 800.ms),

                  const SizedBox(height: 40),

                  /// Social Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _SocialIconButton(
                        icon: FontAwesomeIcons.github,
                        onPressed: () =>
                            _openUrl("https://github.com/priprince"),
                      ).animate().fadeIn(delay: 900.ms),
                      _SocialIconButton(
                        icon: FontAwesomeIcons.linkedin,
                        onPressed: () => _openUrl(
                          "https://www.linkedin.com/in/pravin-prince-a2826b254/",
                        ),
                      ).animate().fadeIn(delay: 1000.ms),
                      _SocialIconButton(
                        icon: FontAwesomeIcons.envelope,
                        onPressed: () =>
                            _openUrl("mailto:pravinflutterboy@gmail.com"),
                      ).animate().fadeIn(delay: 1100.ms),
                    ],
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Text(
                "Scroll",
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 6),
              Icon(
                    Icons.keyboard_arrow_down,
                    size: 28,
                    color: AppColors.primary,
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .moveY(begin: 0, end: 10, duration: 800.ms)
                  .then()
                  .moveY(begin: 10, end: 0, duration: 800.ms),
            ],
          ),
        ),
      ],
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialIconButton({required this.icon, required this.onPressed});

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.all(12),
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
            size: 20,
          ),
        ),
      ),
    );
  }
}
