import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';

class MedicineVector extends StatelessWidget {
  const MedicineVector({
    required this.vector,
    this.dimension,
    super.key,
  });

  final String vector;
  final double? dimension;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimension ?? context.width * 0.6,
        child: SvgPicture.asset(vector),
      ),
    );
  }
}
