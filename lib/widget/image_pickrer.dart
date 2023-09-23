import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagerPicker extends StatefulWidget {
  const UserImagerPicker({super.key, required this.onPickedImage});

  final void Function(File image) onPickedImage;

  @override
  State<UserImagerPicker> createState() => _UserImagerPickerState();
}

class _UserImagerPickerState extends State<UserImagerPicker> {
  File? _pickImageFile;
  _pickImage() async {
    final pickImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (pickImage == null) {
      return;
    }
    setState(() {
      _pickImageFile = File(pickImage.path);
    });
    widget.onPickedImage(_pickImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey,
          foregroundImage:
              _pickImageFile != null ? FileImage(_pickImageFile!) : null,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.camera_alt_outlined),
          label: Text(
            'Add Image',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        )
      ],
    );
  }
}
