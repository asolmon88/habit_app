import 'package:flutter/material.dart';

const button = Color(0xFF9A85FC);
const background = Color(0xFF353D48);
const card = Color(0xFF86B7B8);
const text = Color(0xFFFFFFFF);


CustomColors lightCustomColors = const CustomColors(
  sourceButton: Color(0xFF9A85FC),
  button: Color(0xFF614BBE),
  onButton: Color(0xFFFFFFFF),
  buttonContainer: Color(0xFFE6DEFF),
  onButtonContainer: Color(0xFF1C0062),
  sourceBackground: Color(0xFF353D48),
  background: Color(0xFF0561A4),
  onBackground: Color(0xFFFFFFFF),
  backgroundContainer: Color(0xFFD1E4FF),
  onBackgroundContainer: Color(0xFF001D36),
  sourceCard: Color(0xFF86B7B8),
  card: Color(0xFF00696C),
  onCard: Color(0xFFFFFFFF),
  cardContainer: Color(0xFF6FF6FA),
  onCardContainer: Color(0xFF002021),
  sourceText: Color(0xFFFFFFFF),
  text: Color(0xFF006874),
  onText: Color(0xFFFFFFFF),
  textContainer: Color(0xFF97F0FF),
  onTextContainer: Color(0xFF001F24),
);

CustomColors darkCustomColors = const CustomColors(
  sourceButton: Color(0xFF9A85FC),
  button: Color(0xFFCABEFF),
  onButton: Color(0xFF826EDA),
  buttonContainer: Color(0xFF4930A5),
  onButtonContainer: Color(0xFFE6DEFF),
  sourceBackground: Color(0xFF353D48),
  background: Color(0xFF9FCAFF),
  onBackground: Color(0xFF003259),
  backgroundContainer: Color(0xFF00497D),
  onBackgroundContainer: Color(0xFFD1E4FF),
  sourceCard: Color(0xFF86B7B8),
  card: Color(0xFF4CDADD),
  onCard: Color(0xFF003738),
  cardContainer: Color(0xFF004F51),
  onCardContainer: Color(0xFF6FF6FA),
  sourceText: Color(0xFFFFFFFF),
  text: Color(0xFF4FD8EB),
  onText: Color(0xFF00363D),
  textContainer: Color(0xFF004F58),
  onTextContainer: Color(0xFF97F0FF),
);



/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceButton,
    required this.button,
    required this.onButton,
    required this.buttonContainer,
    required this.onButtonContainer,
    required this.sourceBackground,
    required this.background,
    required this.onBackground,
    required this.backgroundContainer,
    required this.onBackgroundContainer,
    required this.sourceCard,
    required this.card,
    required this.onCard,
    required this.cardContainer,
    required this.onCardContainer,
    required this.sourceText,
    required this.text,
    required this.onText,
    required this.textContainer,
    required this.onTextContainer,
  });

  final Color? sourceButton;
  final Color? button;
  final Color? onButton;
  final Color? buttonContainer;
  final Color? onButtonContainer;
  final Color? sourceBackground;
  final Color? background;
  final Color? onBackground;
  final Color? backgroundContainer;
  final Color? onBackgroundContainer;
  final Color? sourceCard;
  final Color? card;
  final Color? onCard;
  final Color? cardContainer;
  final Color? onCardContainer;
  final Color? sourceText;
  final Color? text;
  final Color? onText;
  final Color? textContainer;
  final Color? onTextContainer;

  @override
  CustomColors copyWith({
    Color? sourceButton,
    Color? button,
    Color? onButton,
    Color? buttonContainer,
    Color? onButtonContainer,
    Color? sourceBackground,
    Color? background,
    Color? onBackground,
    Color? backgroundContainer,
    Color? onBackgroundContainer,
    Color? sourceCard,
    Color? card,
    Color? onCard,
    Color? cardContainer,
    Color? onCardContainer,
    Color? sourceText,
    Color? text,
    Color? onText,
    Color? textContainer,
    Color? onTextContainer,
  }) {
    return CustomColors(
      sourceButton: sourceButton ?? this.sourceButton,
      button: button ?? this.button,
      onButton: onButton ?? this.onButton,
      buttonContainer: buttonContainer ?? this.buttonContainer,
      onButtonContainer: onButtonContainer ?? this.onButtonContainer,
      sourceBackground: sourceBackground ?? this.sourceBackground,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      backgroundContainer: backgroundContainer ?? this.backgroundContainer,
      onBackgroundContainer: onBackgroundContainer ?? this.onBackgroundContainer,
      sourceCard: sourceCard ?? this.sourceCard,
      card: card ?? this.card,
      onCard: onCard ?? this.onCard,
      cardContainer: cardContainer ?? this.cardContainer,
      onCardContainer: onCardContainer ?? this.onCardContainer,
      sourceText: sourceText ?? this.sourceText,
      text: text ?? this.text,
      onText: onText ?? this.onText,
      textContainer: textContainer ?? this.textContainer,
      onTextContainer: onTextContainer ?? this.onTextContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceButton: Color.lerp(sourceButton, other.sourceButton, t),
      button: Color.lerp(button, other.button, t),
      onButton: Color.lerp(onButton, other.onButton, t),
      buttonContainer: Color.lerp(buttonContainer, other.buttonContainer, t),
      onButtonContainer: Color.lerp(onButtonContainer, other.onButtonContainer, t),
      sourceBackground: Color.lerp(sourceBackground, other.sourceBackground, t),
      background: Color.lerp(background, other.background, t),
      onBackground: Color.lerp(onBackground, other.onBackground, t),
      backgroundContainer: Color.lerp(backgroundContainer, other.backgroundContainer, t),
      onBackgroundContainer: Color.lerp(onBackgroundContainer, other.onBackgroundContainer, t),
      sourceCard: Color.lerp(sourceCard, other.sourceCard, t),
      card: Color.lerp(card, other.card, t),
      onCard: Color.lerp(onCard, other.onCard, t),
      cardContainer: Color.lerp(cardContainer, other.cardContainer, t),
      onCardContainer: Color.lerp(onCardContainer, other.onCardContainer, t),
      sourceText: Color.lerp(sourceText, other.sourceText, t),
      text: Color.lerp(text, other.text, t),
      onText: Color.lerp(onText, other.onText, t),
      textContainer: Color.lerp(textContainer, other.textContainer, t),
      onTextContainer: Color.lerp(onTextContainer, other.onTextContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
    );
  }
}