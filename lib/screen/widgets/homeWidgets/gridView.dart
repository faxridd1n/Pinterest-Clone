import 'package:flutter/material.dart';

photoUi(String imagePath) {
  return Image(
    image: NetworkImage(
      imagePath,
    ),
    fit: BoxFit.cover,
  );
}
