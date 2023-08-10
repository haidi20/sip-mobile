import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 120,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
