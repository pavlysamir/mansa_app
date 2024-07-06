import 'package:flutter/material.dart';

class CustomAddPhotoButton extends StatelessWidget {
  const CustomAddPhotoButton({super.key, required this.function});
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: function,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: const Icon(
            Icons.add_a_photo_outlined,
            color: Colors.grey,
            size: 60,
          ),
        ),
      ),
    );
  }
}
