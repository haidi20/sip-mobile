import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class ProductCard extends StatefulWidget {
  final String imgUrl;
  final String name;

  const ProductCard({super.key, required this.imgUrl, this.name = ""});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _loadImage();
  }

  Future<void> _loadImage() async {
    await Future.delayed(
      const Duration(minutes: 1),
    ); // Simulate image loading delay

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 120,
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.imgUrl),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: const [0.3, 0.9],
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2)
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(
                widget.name,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
