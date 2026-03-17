import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class ViewerScreen extends StatefulWidget {
  final List<AssetEntity> images;
  final int initialIndex;

  const ViewerScreen({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<ViewerScreen> createState() => _ViewerScreenState();
}

class _ViewerScreenState extends State<ViewerScreen> {
  late PageController _pageController;
  late int currentIndex; 
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex; 
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
                title: Text(
          "${currentIndex + 1} / ${widget.images.length}",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.images.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return InteractiveViewer(
            minScale: 1.0,
            maxScale: 4.0,
            clipBehavior: Clip.none,
            child: AssetEntityImage(
              widget.images[index],
              isOriginal: true,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}