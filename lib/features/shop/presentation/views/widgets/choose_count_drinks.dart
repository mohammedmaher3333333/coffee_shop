import 'package:coffee_shop/core/coffee_cubit/coffee_cubit.dart';
import 'package:coffee_shop/core/utils/styles.dart';
import 'package:coffee_shop/features/home/data/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseCountDrinks extends StatelessWidget {
  final CoffeeModel cartItem;
  final Function(CoffeeModel) increment;
  final Function(CoffeeModel) decrement;

  const ChooseCountDrinks({
    super.key,
    required this.cartItem,
    required this.increment,
    required this.decrement,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            decrement(cartItem); // قلل الكمية
          },
        ),
        BlocBuilder<CoffeeCubit, CoffeeState>(
          builder: (context, state) {
            return Text(
              '${cartItem.quantity}', // عرض الكمية
              style: Styles.textStyle24,
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            increment(cartItem); // زد الكمية
          },
        ),
      ],
    );
  }
}
