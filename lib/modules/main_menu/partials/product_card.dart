import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // final String title;

  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://images.unsplash.com/photo-1587334207407-deb137a955ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80";

    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 10),
      child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(3, 1))
              ]),
          child: Image.network(
            imageUrl,
            width: 100, // specify the width
            height: 150, // specify the height
            fit: BoxFit.cover, // how to scale the image
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              );
            },
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return const Text('Some errors occurred!');
            },
          )),
    );
  }
}
