import 'package:flutter/material.dart';
import 'gallery_screen.dart';

void main() => runApp(const GaleriaSwipeApp());

class GaleriaSwipeApp extends StatelessWidget {
  const GaleriaSwipeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GalleryScreen(),
    );
  }
}