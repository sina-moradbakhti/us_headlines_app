import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import '../theme/app_colors.dart';

class LoaderWidget extends StatelessWidget {
  final double? strokeWidth;
  final Color? color;

  const LoaderWidget({
    super.key,
    this.strokeWidth,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.loadingSize.width,
      height: AppSizes.loadingSize.height,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? AppSizes.loadingStrokeWidth,
        color: color ?? AppColors.primaryColor,
      ),
    );
  }
}
