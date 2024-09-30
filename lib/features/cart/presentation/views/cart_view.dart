import 'package:coffee_shop/core/coffee_cubit/coffee_cubit.dart';
import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/features/cart/presentation/views/widgets/custom_cart_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_coffee_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CustomCoffeeAppBar(
                  text: 'Your Cart',
                ),
                BlocBuilder<CoffeeCubit, CoffeeState>(
                  builder: (context, state) {
                    var coffeeCubit = BlocProvider.of<CoffeeCubit>(context);

                    print('total price =  ${coffeeCubit.totalPrice}');
                    return Text(
                      'Total: \$${coffeeCubit.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const CustomCartListView(),
            const CustomButton(text: 'Pay Now'),
          ],
        ),
      ),
    );
  }
}
