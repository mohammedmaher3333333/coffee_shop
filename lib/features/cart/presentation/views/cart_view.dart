import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/features/cart/presentation/views/widgets/custom_cart_list_view.dart';
import 'package:coffee_shop/features/cart/presentation/views/widgets/custom_total_price.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_coffee_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomCoffeeAppBar(
                  text: 'Your Cart',
                ),
                CustomTotalPrice(),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            CustomCartListView(),
            CustomButton(text: 'Pay Now'),
          ],
        ),
      ),
    );
  }
}
