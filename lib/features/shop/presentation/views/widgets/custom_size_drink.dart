import 'package:coffee_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomSizeDrink extends StatelessWidget {
  const CustomSizeDrink({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 50,
        height: 40,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.brown : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? Colors.brown : Colors.grey,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: Styles.textStyle14.copyWith(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
