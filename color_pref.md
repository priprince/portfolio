# 🎨 Portfolio Theme System (Flutter Web)

**Project:** Personal Developer Portfolio
**Framework:** Flutter Web
**Version:** 2.0
**Last Updated:** March 2026
**Status:** Final ✅

---

# Design Philosophy

The portfolio follows a **minimal modern dark theme** commonly used in high-end developer portfolios and SaaS dashboards.

Goals:

* Minimal color system
* Strong contrast
* Tech-focused aesthetic
* Easy maintainability
* Consistent UI hierarchy

Instead of using many colors, this theme uses **only 6 core colors**.

This improves:

* visual clarity
* design consistency
* development speed
* long-term maintainability

---

# 🎨 Core Color Palette

## Primary Accent (Brand Color)

**Color:** Soft Cyan / Slate Blue
**Hex:** `#3DD9F3`

Usage:

* Primary buttons
* Links
* Icons
* Interactive elements
* Hover states
* Important highlights

Flutter:

```dart
const Color primaryColor = Color(0xFF3DD9F3);
```

---

## Secondary Accent

**Color:** Soft Indigo
**Hex:** `#7C5DFA`

Usage:

* Tech badges
* Secondary highlights
* Gradient effects
* Visual accents

Flutter:

```dart
const Color secondaryColor = Color(0xFF7C5DFA);
```

---

# 🌑 Background System

## Main Background

**Hex:** `#0B0F1A`

Usage:

* Whole application background
* Scaffold background
* Main layout containers

Flutter:

```dart
const Color backgroundColor = Color(0xFF0B0F1A);
```

---

## Surface / Card Background

**Hex:** `#151B2E`

Usage:

* Skill cards
* Project cards
* Experience containers
* Elevated sections

Flutter:

```dart
const Color surfaceColor = Color(0xFF151B2E);
```

---

# 📝 Text Colors

## Primary Text

**Hex:** `#E6EDF7`

Usage:

* Headings
* Section titles
* Important content

Flutter:

```dart
const Color textPrimary = Color(0xFFE6EDF7);
```

---

## Secondary Text

**Hex:** `#94A3B8`

Usage:

* Descriptions
* Paragraph text
* Subtitles
* Metadata

Flutter:

```dart
const Color textSecondary = Color(0xFF94A3B8);
```

---

# 🌈 Gradient System

Only **one main gradient** should be used across the portfolio to maintain visual consistency.

## Primary Gradient (Cyan → Purple)

Usage:

* Hero name text
* Important stats
* Highlight elements

Flutter:

```dart
const LinearGradient primaryGradient = LinearGradient(
  colors: [
    Color(0xFF3DD9F3),
    Color(0xFF7C5DFA),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
```

---

# 💡 Glow Effects (Premium UI)

Used sparingly for modern tech feel.

Example usage:

* Button hover
* Card hover
* Tech badge hover

Flutter:

```dart
BoxShadow cyanGlow = BoxShadow(
  color: Color(0xFF00E5FF).withOpacity(0.25),
  blurRadius: 25,
  spreadRadius: 1,
);
```

---

# 🧱 Flutter Theme Implementation

Recommended central theme file.

`theme/app_theme.dart`

```dart
import 'package:flutter/material.dart';

class AppTheme {

  static const Color primaryColor = Color(0xFF3DD9F3);
  static const Color secondaryColor = Color(0xFF7C5DFA);

  static const Color backgroundColor = Color(0xFF0B0F1A);
  static const Color surfaceColor = Color(0xFF151B2E);

  static const Color textPrimary = Color(0xFFE6EDF7);
  static const Color textSecondary = Color(0xFF94A3B8);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundColor,

    primaryColor: primaryColor,

    cardColor: surfaceColor,

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: textPrimary,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: textPrimary,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: textSecondary,
      ),
      bodyMedium: TextStyle(
        color: textSecondary,
      ),
    ),
  );
}
```

---

# 🧩 Component Usage Guidelines

## Navbar

Background:

```
backgroundColor
```

Nav Item:

```
textSecondary
```

Nav Hover:

```
primaryColor
```

---

## Hero Section

Name:

```
primaryGradient
```

Subtitle:

```
textSecondary
```

Primary Button:

```
primaryColor
```

Outline Button:

```
border: primaryColor
```

---

## Skill Cards

Background:

```
surfaceColor
```

Text:

```
textPrimary
```

Badge:

```
primaryColor with opacity
```

---

## Project Cards

Background:

```
surfaceColor
```

Tech Badge:

```
secondaryColor
```

Buttons:

```
primaryColor
```

---

## Experience Section

Company Name:

```
primaryColor
```

Duration Badge:

```
primaryColor.withOpacity(0.15)
```

Description:

```
textSecondary
```

---

# ♿ Accessibility

Contrast compliance:

| Element                      | Contrast | Status |
| ---------------------------- | -------- | ------ |
| Primary text on background   | 18:1     | AAA    |
| Secondary text on background | 7:1      | AA     |
| Primary color on background  | 8:1      | AA     |

This ensures strong readability across devices.

---

# 📦 Final Theme Summary

| Role           | Color     |
| -------------- | --------- |
| Primary        | `#3DD9F3` |
| Secondary      | `#7C5DFA` |
| Background     | `#0B0F1A` |
| Surface        | `#151B2E` |
| Primary Text   | `#E6EDF7` |
| Secondary Text | `#94A3B8` |

Gradient:

```
Soft Cyan → Soft Indigo
```

---

# 🚀 Future Enhancements (Optional)

Possible additions:

* animated gradient text
* hover elevation for cards
* soft neon glows
* micro-interactions

These should be used carefully to keep the portfolio **clean and professional**.

---

# Final Notes

This theme system is optimized for:

* Flutter Web
* developer portfolios
* dark UI design
* minimal modern aesthetic

By restricting the palette to **six colors**, the UI remains:

* visually consistent
* easier to maintain
* faster to scale

---

**Theme Version:** 2.0
**Maintained By:** Pravin Dev
**Framework:** Flutter Web
