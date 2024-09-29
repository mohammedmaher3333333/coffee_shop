import 'package:coffee_shop/core/utils/app_router.dart';
import 'package:coffee_shop/core/utils/assets.dart';
import 'package:coffee_shop/core/utils/styles.dart';
import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(
                  AssetsData.espresso,
                ),
                width: 225,
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Brew Day',
                style: Styles.textStyle30,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'How do you Like your coffee?',
                style: Styles.textStyle18,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Enter Shop',
                onTap: () {
                  GoRouter.of(context).pushReplacement(
                    AppRouter.kHomeView,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
