import 'package:coffee_shop/core/coffee_cubit/coffee_cubit.dart';
import 'package:coffee_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ChooseCountDrinks extends StatelessWidget {
  const ChooseCountDrinks({
    super.key,
    required this.coffeeCubit,
  });

  final CoffeeCubit coffeeCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            coffeeCubit.decrementCount();
          },
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
                child: Text(
                  '${coffeeCubit.countDrinks}',
                  style: Styles.textStyle30
                      .copyWith(color: Colors.black),
                )),
          ),
        ),
        IconButton(
          onPressed: () {
            coffeeCubit.incrementCount();
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
