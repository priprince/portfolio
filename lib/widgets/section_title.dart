import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showGradient;

  const SectionTitle({
    Key? key,
    required this.title,
    this.subtitle,
    this.showGradient = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showGradient)
          ShaderMask(
            shaderCallback: (bounds) => AppColors.premiumGradient.createShader(
              Offset.zero & bounds.size,
            ),
            child: Text(title, style: AppTextStyles.headingXLarge),
          )
        else
          Text(title, style: AppTextStyles.headingXLarge),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(
            subtitle!,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }
}
