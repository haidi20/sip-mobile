import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.imgUrl,
    this.name = "",
    this.price = "",
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Adjust the border radius as needed
          side: const BorderSide(color: Colors.black, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.imgUrl, // Ganti dengan URL gambar Anda
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 15,
                right: 15,
                bottom: 10,
              ),
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
