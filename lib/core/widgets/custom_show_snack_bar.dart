import 'package:flutter/material.dart';

class CustomShowSnackBar {
  static void show(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Padding(
        padding: const EdgeInsets.all(12.0), // زيادة التباعد
        child: Text(
          message,
          style: const TextStyle(fontSize: 12), // تغيير حجم الخط
        ),
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2), // زيادة حواف الزاوية
      ),
      padding: EdgeInsets.zero, // تعيين padding الافتراضي للصفر لأننا نستخدم Padding في المحتوى
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
