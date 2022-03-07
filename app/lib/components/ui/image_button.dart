import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final ImageProvider image;
  final void Function() onTap;
  final Size size;

  const ImageButton(
      {required this.image, required this.onTap, required this.size, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: GestureDetector(
        onTap: onTap,
        child: Image(image: image, fit: BoxFit.cover),
      ),
    );
  }
}
