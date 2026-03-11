import 'package:flutter/material.dart';
import 'package:pravin_portfolio/core/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/utils/responsive.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getPadding(context),
        vertical: Responsive.isMobile(context) ? 80 : 120,
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
              Text("Featured Projects", style: AppTextStyles.headingXLarge),
              SizedBox(height: Responsive.isMobile(context) ? 60 : 80),
              const ProjectCard(
                title: "Nudj Patient App",
                description:
                    "Healthcare SaaS application enabling patient monitoring, RPM device integration, and real-time health analytics for physicians and care teams.",
                tech: ["Flutter", "GraphQL", "AWS Cognito", "Hive", "BLoC"],
                link: MyString.nudjPatientApp,
              ),
              const SizedBox(height: 80),
              const ProjectCard(
                title: "Fpowrd Music",
                description:
                    "Multi-source music platform integrating Google Drive, Dropbox, and local audio with optimized playback using Rust audio tag processing.",
                tech: ["Flutter", "Riverpod", "Just Audio", "Rust", "Isolates"],
                link: "",
                reverse: true,
              ),
              const SizedBox(height: 80),
              const ProjectCard(
                title: "AI Calorie Recognition App",
                description:
                    "AI-powered food recognition system analyzing meal images using GPT Vision APIs and evaluating ML solutions including YOLOv8 and Gemma models.",
                tech: ["Flutter", "Gemini API", "GPT Vision", "YOLOv8"],
                link: "", // private
              ),
              const SizedBox(height: 80),
              const ProjectCard(
                title: "Dustman Customer App",
                description:
                    "On‑demand waste management application for customers with geofencing, secure storage, and real‑time tracking.",
                tech: ["Flutter", "Hive", "GetX"],
                link: MyString.dustmanCustomerApp,
              ),
              const SizedBox(height: 80),
              const ProjectCard(
                title: "Dustman Vendor App",
                description:
                    "Companion app for waste collectors featuring route optimization and offline support.",
                tech: ["Flutter", "Hive", "GetX"],
                link: MyString.dustmanVendorApp,
                reverse: true,
              ),
              const SizedBox(height: 80),
              const ProjectCard(
                title: "Weconnect",
                description:
                    "Effortlessly empower Local Cable Operators with the ability to efficiently oversee their clientele and active subscription services using this intuitive app.",
                tech: ["Flutter", "GetX", "Isar"],
                link: MyString.weConnect,
              ),
              const SizedBox(height: 80),
              const ProjectCard(
                title: "AmtechPe",
                description:
                    "Unlock the potential for extra income on your terms,with the tools, supports & flexibility you need to achieve your financial goals..",
                tech: ["Flutter", "GetX"],
                link: MyString.amtechpe,
                reverse: true,
              ),
              const SizedBox(height: 80),
              const ProjectCard(
                title: "Gio Exchange",
                description:
                    "Cryptocurrency trading companion featuring WebSocket feeds and secure preferences.Our custom trading engine was designed to be scalable and to ensure that orders are executed in real-time.",
                tech: ["Flutter", "WebSockets", "Shared Preferences"],
                link: MyString.gioExchange,
              ),
              // const SizedBox(height: 80),
              // const ProjectCard(
              //   title: "Crypto Trading Dashboard",
              //   description:
              //       "Real-time crypto tracking and trading interface with integrated WebSockets feeds and custom charting, built as part of a trading platform prototype.",
              //   tech: ["Flutter", "WebSockets", "REST APIs", "GraphQL"],
              //   reverse: true,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tech;
  final String? link; // external URL for play store or repo
  final bool reverse;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.tech,
    this.link,
    this.reverse = false,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  void _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: const EdgeInsets.only(bottom: 0),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _projectImage(),
                  const SizedBox(height: 20),
                  _projectDetails(context),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: widget.reverse
                    ? [
                        Expanded(flex: 1, child: _projectDetails(context)),
                        SizedBox(width: isMobile ? 0 : 60),
                        _projectImage(),
                      ]
                    : [
                        _projectImage(),
                        SizedBox(width: isMobile ? 0 : 60),
                        Expanded(flex: 1, child: _projectDetails(context)),
                      ],
              ),
      ),
    );
  }

  Widget _projectImage() {
    final hasLink = widget.link != null && widget.link!.isNotEmpty;
    return SizedBox(
      width: 220,
      height: 220,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: AppColors.bgMedium,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered ? AppColors.primary : AppColors.bgLight,
            width: _isHovered ? 2 : 1.5,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 12,
                  ),
                ]
              : [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.08),
                    blurRadius: 6,
                  ),
                ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                hasLink
                    ? FontAwesomeIcons.googlePlay
                    : FontAwesomeIcons.mobileScreen,
                size: 44,
                color: AppColors.primary.withOpacity(0.7),
              ),
              const SizedBox(height: 14),
              Text(
                hasLink ? "Play Store" : "Private",
                textAlign: TextAlign.center,
                style: AppTextStyles.labelMedium.copyWith(
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

  Widget _projectDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(widget.title, style: AppTextStyles.headingLarge),
        const SizedBox(height: 16),
        Text(widget.description, style: AppTextStyles.bodyXLarge),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: widget.tech
              .map(
                (t) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColors.secondary.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    t,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            if (widget.link != null && widget.link!.isNotEmpty)
              ElevatedButton.icon(
                onPressed: () => _openUrl(widget.link!),
                icon: const FaIcon(FontAwesomeIcons.googlePlay, size: 16),
                label: Text(
                  "View on Store",
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.bgDark,
                  ),
                ),
              )
            else
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Private Project",
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.bgDark,
                  ),
                ),
              ),
            // OutlinedButton(
            //   onPressed: () {},
            //   child: Text("GitHub", style: AppTextStyles.labelLarge),
            // ),
          ],
        ),
      ],
    );
  }
}
