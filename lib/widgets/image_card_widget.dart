import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  final String? imgUrl;
  final BorderRadius? borderRadius;
  ImageCardWidget(this.imgUrl, {this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return buildImgCard(context);
  }

  Container buildImgCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: borderRadius ?? BorderRadius.zero,
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
          ),
        ],
      ),
      child: imgUrl == null
      ? Center(child: CircularProgressIndicator())
      :
      ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Image.network(
          imgUrl!,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
