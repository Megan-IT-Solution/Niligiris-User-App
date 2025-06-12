import 'package:flutter/material.dart';

import '../../../../constants/app_text_styles.dart';

Widget orderSummaryWidget(String label, String value, {bool isBold = false}) {
  final textStyle = isBold ? AppTextStyles.h1 : AppTextStyles.h2;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [Text(label, style: textStyle), Text(value, style: textStyle)],
  );
}
