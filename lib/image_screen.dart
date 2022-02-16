import 'package:flutter/material.dart';

class ImageDisplayScreen extends StatelessWidget {
  const ImageDisplayScreen({Key? key, @required this.imageUrl})
      : super(key: key);

  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: NetworkImage(imageUrl!)),
    );
  }
}
