import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/test.dart'; // Import your provider

class ImagePickerWidget extends ConsumerStatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends ConsumerState<ImagePickerWidget> {
  XFile? imageFile;
  final ImagePicker _picker = ImagePicker();
  late FirebaseStorage _storage;

  @override
  void initState() {
    super.initState();
    _storage = FirebaseStorage.instance;
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile;
      });
      // Upload image to Firebase Storage
      await _uploadImageToFirebase(pickedFile, ref);
    }
  }

  Future<void> _uploadImageToFirebase(XFile pickedFile, WidgetRef ref) async {
    File file = File(pickedFile.path);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference refStorage = _storage.ref().child('images/$fileName');
    UploadTask uploadTask = refStorage.putFile(file);

    try {
      await uploadTask;
      String imageUrl = await refStorage.getDownloadURL();
      ref.read(formStateProvider.notifier).updateImageUrl(imageUrl);
      print('Image uploaded to Firebase Storage: $imageUrl');
    } catch (e) {
      print('Failed to upload image to Firebase Storage: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPicker(context),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey[200],
        backgroundImage:
            imageFile != null ? FileImage(File(imageFile!.path)) : null,
        child: imageFile == null
            ? const Icon(Icons.add, size: 50, color: Colors.black)
            : null,
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
