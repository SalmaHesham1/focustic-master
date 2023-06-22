import 'package:flutter/material.dart';

mainTextButton({
  required BuildContext context,
  required var child,
  var backgroundColor,
  required var onPressed,
  var borderColor,
  double? radius,
}) {
  return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        backgroundColor: backgroundColor ?? Colors.white,
      ),
      child: child);
}
