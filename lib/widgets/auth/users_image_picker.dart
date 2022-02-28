import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import './image_source_dialog.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePinkFn;

  UserImagePicker(this.imagePinkFn);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImageFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (pickedImageFile != null) {
      setState(() {
        _pickedImage = File(pickedImageFile.path);
      });
      widget.imagePinkFn(_pickedImage);
    }
  }

  void _pickImageSourceDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (ctx) {
          return ImageSourceDialog(
            () async {
              await _pickImage(ImageSource.gallery);
              if (_pickedImage != null) Navigator.of(ctx).pop();
            },
            () async {
              await _pickImage(ImageSource.camera);
              if (_pickedImage != null) Navigator.of(ctx).pop();
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        FlatButton.icon(
          onPressed: () => _pickImageSourceDialog(context),
          icon: Icon(Icons.image),
          label: Text('Add Image'),
          textColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
