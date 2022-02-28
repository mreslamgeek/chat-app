import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceDialog extends StatelessWidget {
  final VoidCallback onSelectGallery;
  final VoidCallback onSelectCamera;

  ImageSourceDialog(
    this.onSelectGallery,
    this.onSelectCamera,
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: onSelectGallery,
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 32,
                          color: Theme.of(context).accentColor,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: onSelectCamera,
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera,
                          size: 32,
                          color: Theme.of(context).accentColor,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
