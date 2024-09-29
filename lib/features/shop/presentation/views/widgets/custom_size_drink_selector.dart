import 'package:coffee_shop/core/coffee_cubit/coffee_cubit.dart';
import 'package:coffee_shop/features/shop/presentation/views/widgets/custom_size_drink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSizeDrinkSelector extends StatelessWidget {
  const CustomSizeDrinkSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeCubit, CoffeeState>(
      builder: (context, state) {
        var coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSizeDrink(
              text: 'S',
              isSelected: coffeeCubit.selectedSize == 'S',
              onTap: () {
                coffeeCubit.changeSelectedSize(newSelected: 'S');
              },
            ),
            const SizedBox(width: 10),
            CustomSizeDrink(
              text: 'M',
              isSelected: coffeeCubit.selectedSize == 'M',
              onTap: () {
                coffeeCubit.changeSelectedSize(newSelected: 'M');
              },
            ),
            const SizedBox(width: 10),
            CustomSizeDrink(
              text: 'L',
              isSelected: coffeeCubit.selectedSize == 'L',
              onTap: () {
                coffeeCubit.changeSelectedSize(newSelected: 'L');
              },
            ),
          ],
        );
      },
    );
  }
}
