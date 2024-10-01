import 'package:coffee_shop/core/coffee_cubit/coffee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_cart_list_tile.dart';

class CustomCartListView extends StatelessWidget {
  const CustomCartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeCubit, CoffeeState>(
      builder: (context, state) {
        var coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
        return Expanded(
          child: ListView.builder(
            itemCount: coffeeCubit.userCurt.length,
            itemBuilder: (context, index) {
              return CustomCartListTile(
                coffeeCubit: coffeeCubit,
                iconData: Icons.remove,
                index: index,
                onPressed: () {
                  coffeeCubit.removeItemFromCart(coffeeCubit.userCurt[index]);
                },
              );
            },
          ),
        );
      },
    );
  }
}
