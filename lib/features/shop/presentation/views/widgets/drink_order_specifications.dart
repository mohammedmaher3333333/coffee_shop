import 'package:coffee_shop/constant.dart';
import 'package:coffee_shop/core/coffee_cubit/coffee_cubit.dart';
import 'package:coffee_shop/core/utils/styles.dart';
import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/features/shop/presentation/views/widgets/choose_count_drinks.dart';
import 'package:coffee_shop/features/shop/presentation/views/widgets/custom_size_drink_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_show_snack_bar.dart';

class DrinkOrderSpecifications extends StatelessWidget {
  const DrinkOrderSpecifications({super.key});

  @override
  Widget build(BuildContext context) {
    final int index = GoRouterState.of(context).extra as int;
    final coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
    final cartItem = coffeeCubit.coffeeShop[index];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              width: 150,
              image: AssetImage(cartItem.imagePath),
            ),
            const SizedBox(height: 50),
            const Text('QUANTITY', style: Styles.textStyle22),
            const SizedBox(height: 10),
            ChooseCountDrinks(
              cartItem: cartItem,
              increment: (item) => coffeeCubit.incrementItemQuantity(),
              decrement: (item) => coffeeCubit.decrementItemQuantity(),
            ),
            const SizedBox(height: 30),
            const Text('SIZE', style: Styles.textStyle22),
            const SizedBox(height: 10),
            const CustomSizeDrinkSelector(),
            const SizedBox(height: 60),
            CustomButton(
              text: 'Add To cart',
              onTap: () {
                coffeeCubit.addItemToCart(cartItem);
                CustomShowSnackBar.show(context, 'Successfully added to cart');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
