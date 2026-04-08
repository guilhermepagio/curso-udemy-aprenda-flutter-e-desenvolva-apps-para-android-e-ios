import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File) onImagePick;

  const UserImagePicker({super.key, required this.onImagePick});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final pickedFileImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (pickedFileImage != null) {
      setState(() {
        _pickedImage = File(pickedFileImage.path);
      });

      widget.onImagePick(_pickedImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _pickedImage != null
              ? FileImage(_pickedImage!)
              : null,
          child: _pickedImage == null
              ? const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sem Imagem',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : null,
        ),
        TextButton(
          onPressed: _pickImage,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.image),
              SizedBox(width: 8),
              Text(
                _pickedImage == null ? 'Adicionar Imagem' : 'Alterar Imagem',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
