import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoadingIndicator extends StatelessWidget {
  const HomeLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 1300 ? (width < 1000 ? 1 : 2) : 3;

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.0,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade100,
          highlightColor: Colors.grey.shade200,
          child: Container(
              decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10.0),
          )),
        );
      },
      itemCount: 6,
    );
  }
}
