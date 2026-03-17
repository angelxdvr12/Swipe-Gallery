import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'viewer_screen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<AssetEntity> images = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAssets();
  }

  _fetchAssets() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    
    if (ps.isAuth || ps.hasAccess) {
      final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
        type: RequestType.image,
      );
      
      if (paths.isNotEmpty) {
        final List<AssetEntity> entities = await paths[0].getAssetListRange(
          start: 0,
          end: 50,
        );
        
        setState(() {
          images = entities;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Permiso denegado para ver fotos")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Galería")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) 
          : images.isEmpty
              ? const Center(child: Text("No se encontraron fotos en el dispositivo"))
              : GridView.builder( 
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewerScreen(
                              images: images,
                              initialIndex: index,
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                       borderRadius: BorderRadius.circular(10), 
                       child: AssetEntityImage(
                         images[index],
                         isOriginal: false,
                         thumbnailSize: const ThumbnailSize.square(200),
                         fit: BoxFit.cover,
                       ),
                     ),
                   );
                 },
                ),
    );
  }
}