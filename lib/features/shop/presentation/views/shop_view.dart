import 'package:coffee_shop/core/widgets/custom_coffee_app_bar.dart';
import 'package:coffee_shop/features/shop/presentation/views/widgets/custom_coffee_list_view.dart';
import 'package:flutter/material.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.0, right: 24, top: 12),
          child: Column(
            children: [
              CustomCoffeeAppBar(
                text: 'How would you like your coffee?',
              ),
              SizedBox(
                height: 24,
              ),
              CustomCoffeeListView(),
            ],
          ),
        ),
    );
  }
}
