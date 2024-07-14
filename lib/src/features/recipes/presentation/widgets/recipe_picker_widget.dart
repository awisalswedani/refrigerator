import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// ignore: depend_on_referenced_packages, library_prefixes
import 'package:path/path.dart' as Path;

class RecipePickerWidget extends StatefulWidget {
  final void Function(String imageUrl)? onImageSelected;

  const RecipePickerWidget({super.key, this.onImageSelected});

  @override
  _RecipePickerWidgetState createState() => _RecipePickerWidgetState();
}

class _RecipePickerWidgetState extends State<RecipePickerWidget> {
  File? _selectedImage;
  String? _imageUrl;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });

      // Upload image to Firebase Storage
      await _uploadImageToFirebase();

      // Call onImageSelected callback with image URL
      widget.onImageSelected?.call(_imageUrl!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
    }
  }

  Future<void> _uploadImageToFirebase() async {
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images')
          .child(Path.basename(_selectedImage!.path));

      // Upload file to Firebase Storage
      await ref.putFile(_selectedImage!);

      // Get download URL
      _imageUrl = await ref.getDownloadURL();
    } catch (e) {
      print('Failed to upload image to Firebase Storage: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPicker(context),
      child: Stack(
        children: [
          Container(
            width: 240,
            height: 240,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: _selectedImage != null
                ? ClipOval(
                    child: Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  )
                : const Center(
                    child: Icon(Icons.add, size: 50, color: Colors.white),
                  ),
          ),
          Positioned(
            left: 180,
            top: 180,
            child: GestureDetector(
              onTap: () => _showPicker(context),
              child: const Icon(
                Icons.add_circle,
                size: 50,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
