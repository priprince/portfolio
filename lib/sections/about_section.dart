import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 90),
      decoration: BoxDecoration(gradient: AppColors.bgGradient),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              /// HEADER
              Text("About Me", style: AppTextStyles.headingXLarge),
              const SizedBox(height: 12),
              Container(
                width: 80,
                height: 4,
                decoration: BoxDecoration(
                  gradient: AppColors.premiumGradient,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 60),

              /// MAIN CONTENT ROW
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// LEFT SIDE — About Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Senior Flutter Developer & Tech Lead",
                          style: AppTextStyles.headingLarge.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Senior Flutter Developer with 5+ years of IT experience building scalable mobile applications across healthcare, fintech, crypto trading platforms, and AI-powered apps. Core competencies include state management, custom animations, and full‑stack integration with Node.js/GraphQL backends.",
                          style: AppTextStyles.bodyXLarge.copyWith(
                            height: 1.8,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "I specialize in Flutter architecture, performance optimization, and secure mobile development. I have delivered 15+ production apps and led teams of developers building complex systems. My academic foundation is in Computer Science (B.Tech), and I hold certifications in AWS and Google Flutter development.",
                          style: AppTextStyles.bodyXLarge.copyWith(
                            height: 1.8,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 32),

                        /// HIGHLIGHTED SKILLS
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _SkillHighlight(
                              icon: FontAwesomeIcons.mobile,
                              label: "Mobile Dev",
                              color: AppColors.secondary,
                            ),
                            _SkillHighlight(
                              icon: FontAwesomeIcons.cog,
                              label: "Architecture",
                              color: AppColors.secondary,
                            ),
                            _SkillHighlight(
                              icon: FontAwesomeIcons.users,
                              label: "Team Lead",
                              color: AppColors.secondary,
                            ),
                            _SkillHighlight(
                              icon: FontAwesomeIcons.zap,
                              label: "Performance",
                              color: AppColors.secondary,
                            ),
                            _SkillHighlight(
                              icon: FontAwesomeIcons.lock,
                              label: "Security",
                              color: AppColors.secondary,
                            ),
                            _SkillHighlight(
                              icon: FontAwesomeIcons.database,
                              label: "Databases",
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 80),

                  /// RIGHT SIDE — Stats with Icons
                  Expanded(
                    child: Column(
                      children: [
                        // Row 1: First box (left) and second box (right)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: _EnhancedStatCard(
                                icon: FontAwesomeIcons.briefcase,
                                number: "5+",
                                label: "Years Experience",
                                color: AppColors.secondary,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _EnhancedStatCard(
                                icon: FontAwesomeIcons.mobileScreen,
                                number: "15+",
                                label: "Production Apps",
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Row 2: Third box (right with offset) and fourth box (left with offset)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: _EnhancedStatCard(
                                icon: FontAwesomeIcons.award,
                                number: "3",
                                label: "Certifications",
                                color: AppColors.secondary,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _EnhancedStatCard(
                                icon: FontAwesomeIcons.users,
                                number: "6",
                                label: "Developers Led",
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

class _EnhancedStatCard extends StatefulWidget {
  final IconData icon;
  final String number;
  final String label;
  final Color color;

  const _EnhancedStatCard({
    required this.icon,
    required this.number,
    required this.label,
    required this.color,
  });

  @override
  State<_EnhancedStatCard> createState() => _EnhancedStatCardState();
}

class _EnhancedStatCardState extends State<_EnhancedStatCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.08 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.bgMedium : AppColors.bgMedium,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered ? widget.color : AppColors.bgLight,
              width: _isHovered ? 2 : 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? widget.color.withOpacity(0.25)
                    : AppColors.primary.withOpacity(0.08),
                blurRadius: _isHovered ? 20 : 8,
                spreadRadius: _isHovered ? 2 : 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: widget.color.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: FaIcon(widget.icon, size: 28, color: widget.color),
                ),
              ),
              const SizedBox(height: 16),
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [widget.color, widget.color.withOpacity(0.7)],
                ).createShader(Offset.zero & bounds.size),
                child: Text(
                  widget.number,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headingLarge.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.label,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillHighlight extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _SkillHighlight({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  State<_SkillHighlight> createState() => _SkillHighlightState();
}

class _SkillHighlightState extends State<_SkillHighlight> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: _isHovered
              ? widget.color.withOpacity(0.2)
              : widget.color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.color.withOpacity(_isHovered ? 0.6 : 0.3),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(widget.icon, size: 16, color: widget.color),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: AppTextStyles.labelMedium.copyWith(
                color: widget.color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String number;
  final String label;

  const StatCard({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 160,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.bgMedium,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.bgLight, width: 1.5),
          boxShadow: [
            BoxShadow(color: AppColors.primary.withOpacity(0.1), blurRadius: 8),
          ],
        ),
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => AppColors.premiumGradient
                  .createShader(Offset.zero & bounds.size),
              child: Text(number, style: AppTextStyles.headingLarge),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
