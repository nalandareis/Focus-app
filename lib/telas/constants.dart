import 'package:flutter/material.dart';

// Estilos fixos do app focus 
const Color kPrimaryColor = Color(0xFFD9E8F8);
const Color kSecondaryColor = Color(0xFFE9EEF5);
const Color kButtonColor = Color(0xFF5A9DEE);
const Color kCorConcluida = Color(0xFFC8E6C9);


// Cores adicionadas baseadas no seu código de Login
const Color kLoginBackground = Color(0xFF8AB9EF); 
const Color kLoginTextColor = Color(0xFF3C7ECD); 

const TextStyle kFocusTitleStyle = TextStyle(
  fontSize: 48,
  fontWeight: FontWeight.bold,
  color: kButtonColor,
  shadows: [
    Shadow(
      blurRadius: 10.0,
      color: Colors.black26,
      offset: Offset(4, 4),
    ),
  ],
);

const TextStyle kPageTitleStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: kButtonColor,
);

const TextStyle kSubtitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: Colors.black54,
);
