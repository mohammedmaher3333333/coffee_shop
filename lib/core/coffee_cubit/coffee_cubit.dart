import 'package:coffee_shop/core/utils/assets.dart';
import 'package:coffee_shop/features/home/data/models/request_drink_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/models/coffee_model.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit() : super(CoffeeInitial());

  // coffee for sale list
  final List<CoffeeModel> _shop = [
    // black coffee
    CoffeeModel(
      name: 'black Coffee',
      price: '4.10',
      imagePath: AssetsData.blackCoffee,
    ),
    // latte
    CoffeeModel(
      name: 'latte',
      price: '6.20',
      imagePath: AssetsData.icedLatte,
    ),
    // espresso
    CoffeeModel(
      name: 'espresso',
      price: '3.40',
      imagePath: AssetsData.espresso,
    ),
    // Hot Chocolate
    CoffeeModel(
      name: 'hot Chocolate',
      price: '7.10',
      imagePath: AssetsData.hotChocolate,
    ),
  ];

  //user cart
  final List<CoffeeModel> _userCart = [];

  //get coffee list
  List<CoffeeModel> get coffeeShop => _shop;

  //get user cart
  List<CoffeeModel> get userCurt => _userCart;

  // add item to cart
  void addItemToCart(CoffeeModel coffeeModel) {
    _userCart.add(coffeeModel); // add item
    emit(CoffeeAddItem()); // تحديث الحالة
  }

  // remove item from cart
  void removeItemFromCart(CoffeeModel coffeeModel) {
    _userCart.remove(coffeeModel);
    emit(CoffeeRemoveItem());
  }

  // count Request drinks
  int countDrinks = 1;

  void incrementCount() {
    if (countDrinks < 10) {
      countDrinks += 1;
      emit(CoffeeIncrementCountDrinks());
    }
  }

  void decrementCount() {
    if (countDrinks > 1) {
      countDrinks -= 1;
      emit(CoffeeDecrementCountDrinks());
    }
  }

  // Chose size drink

  bool isSelected = true;
  String selectedSize = '';

  void changeSelectedSize({required String newSelected}) {
    selectedSize = newSelected;
    emit(CoffeeChangeSelectedSize());
  }

  // request Drinks Cart
  final List<RequestDrinkModel> _requestDrinksCart = [];

  void addItemToCart1(RequestDrinkModel requestDrinkModel) {
    _requestDrinksCart.add(requestDrinkModel);
    emit(CoffeeAddItem());
  }

  // remove item from cart
  void removeItemFromCart1(RequestDrinkModel requestDrinkModel) {
    _requestDrinksCart.remove(requestDrinkModel);
    emit(CoffeeRemoveItem());
  }

  //get requestDrinks cart
  List<RequestDrinkModel> get requestDrinksCart => _requestDrinksCart;
}
