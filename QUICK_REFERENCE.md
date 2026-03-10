# 🚀 Quick Reference - Premium Tech Theme

## Color Palette at a Glance

```
Primary:    #00D9FF (Cyan)        ← Use for main CTAs, accents
Secondary:  #8B5CF6 (Purple)      ← Use for tech tags, alternative actions
Background: #0A0E27 (Dark Navy)   ← Base color
Surface:    #1A1F3A (Navy)        ← Cards, containers
Text:       #EBF2FF (Soft White)  ← Main text
Muted:      #9CA3AF (Gray)        ← Secondary text
```

## Text Styles Quick Access

```dart
// Large Headings
AppTextStyles.displayXLarge  // Hero name (72px)
AppTextStyles.headingXLarge  // Section titles (36px)

// Regular Text
AppTextStyles.bodyXLarge     // Descriptions (18px)
AppTextStyles.bodyLarge      // Content (16px)

// Small/Labels
AppTextStyles.labelLarge     // Button text (14px)
AppTextStyles.labelMedium    // Tags (12px)
```

## Component Imports

```dart
// Colors
import '../core/theme/app_colors.dart';

// Text Styles
import '../core/theme/app_text_styles.dart';

// Constants
import '../core/theme/app_constants.dart';
```

## Common Usage Patterns

### Gradient Text
```dart
ShaderMask(
  shaderCallback: (bounds) => AppColors.premiumGradient
      .createShader(Offset.zero & bounds.size),
  child: Text(
    "Your Text",
    style: AppTextStyles.displayLarge,
  ),
)
```

### Hover Effect Container
```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  decoration: BoxDecoration(
    color: AppColors.bgMedium,
    border: Border.all(
      color: isHovered ? AppColors.primary : AppColors.bgLight,
      width: isHovered ? 2 : 1.5,
    ),
    boxShadow: isHovered
        ? [BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 16,
          )]
        : [],
  ),
  child: YourWidget(),
)
```

### Premium Button
```dart
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
  onPressed: () {},
  child: Text(
    "Click Me",
    style: AppTextStyles.labelLarge.copyWith(
      color: AppColors.bgDark,
    ),
  ),
)
```

## Spacing Shortcuts

```dart
// Use constants from AppSpacing
SizedBox(height: AppSpacing.lg),        // 24px
SizedBox(height: AppSpacing.xl),        // 32px
EdgeInsets.symmetric(
  horizontal: AppSpacing.lg,            // 24px
  vertical: AppSpacing.xl,              // 32px
)
```

## Animation Timing

```dart
// Fast micro-interactions
duration: Duration(milliseconds: 100),

// Normal transitions
duration: Duration(milliseconds: 300),

// Slow page transitions
duration: Duration(milliseconds: 500),

// Very slow complex animations
duration: Duration(milliseconds: 1000),
```

## Widget Styling Checklist

- [ ] Use `AppColors` for all colors
- [ ] Use `AppTextStyles` for all text
- [ ] Add hover effects for interactive elements (300ms)
- [ ] Use border radius from `AppRadius`
- [ ] Add shadow glow on hover
- [ ] Maintain consistent spacing with `AppSpacing`
- [ ] Use `premiumGradient` for gradients
- [ ] Add proper animations with `flutter_animate`
- [ ] Test on different screen sizes
- [ ] Ensure proper color contrast (accessibility)

## File Organization

```
lib/
├── core/
│   └── theme/
│       ├── app_colors.dart          ← Color definitions
│       ├── app_text_styles.dart     ← Typography
│       ├── app_constants.dart       ← Spacing, radius, etc
│       └── app_theme.dart           ← Theme data
├── widgets/                         ← Reusable components
├── sections/                        ← Page sections
├── pages/                           ← Full pages
└── main.dart
```

## Common Issues & Solutions

**Issue**: Colors not updating?  
**Solution**: Rebuild hot reload (Ctrl+Shift+;) or full restart

**Issue**: Text looks different on different devices?  
**Solution**: Ensure using `AppTextStyles` consistently

**Issue**: Hover effects not smooth?  
**Solution**: Check `AnimatedContainer` duration is 300ms

**Issue**: Buttons not matching design?  
**Solution**: Verify using `ElevatedButton.styleFrom()` with correct colors

## Performance Tips

1. Use `const` constructors when possible
2. Avoid rebuilding entire sections on hover
3. Use `AnimatedContainer` instead of `setState` for animations
4. Cache gradient brushes for large lists
5. Use `RepaintBoundary` for complex animations

## Accessibility Notes

- Text contrast: ✅ All text meets WCAG AA standards
- Font sizes: ✅ Minimum 12px for readable text
- Touch targets: ✅ Minimum 48x48dp for interactive elements
- Color blind: ✅ Not relying solely on color for meaning

---

**Need help? Check THEME_DOCUMENTATION.md for detailed info!**
