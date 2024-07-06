import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class CustomViewPhotoFromDevice extends StatelessWidget {
  const CustomViewPhotoFromDevice({
    super.key,
    required this.file,
    required this.function,
  });
  final dynamic file;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: _buildImageProvider()),
              border: Border.all(color: kPrimaryKey),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
          child: IconButton(
            onPressed: function,
            icon: const Icon(
              Icons.close,
              color: kPrimaryKey,
              size: 13,
            ),
          ),
        )
      ],
    );
  }

  ImageProvider _buildImageProvider() {
    if (file is File) {
      // If 'file' is a File, return FileImage
      return FileImage(file as File);
    } else if (file is String) {
      // If 'file' is a String (URL), return NetworkImage
      return NetworkImage(file as String);
    } else {
      // Handle other cases or throw an error
      throw ArgumentError('Invalid file type');
    }
  }
}