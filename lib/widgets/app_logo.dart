import 'package:flutter/material.dart';

import '../core/constants/app_images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width = 48});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      width: width,
      fit: BoxFit.contain,
      semanticLabel: 'Venuze',
    );
  }
}
