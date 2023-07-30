import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class ProductCard extends StatefulWidget {
  final String imgUrl;
  final String? name;

  const ProductCard({super.key, required this.imgUrl, this.name});

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
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(3, 1))
            ]),
        child: Stack(
          children: [
            Text(widget.name ?? "no name"),
            const SizedBox(height: 50), // Add spacing between name and image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ImageNetwork(
                image: widget.imgUrl,
                width: 100,
                height: 120,
                duration: 1500,
                curve: Curves.easeIn,
                onPointer: true,
                debugPrint: false,
                fullScreen: false,
                fitAndroidIos: BoxFit.cover,
                fitWeb: BoxFitWeb.cover,
                onLoading: const CircularProgressIndicator(
                  color: Colors.indigoAccent,
                ),
                onError: const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  debugPrint("click");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
