import 'package:coffee_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/models/coffee_model.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit() : super(CoffeeInitial());

  // قائمة المشروبات
  final List<CoffeeModel> _shop = [
    CoffeeModel(
      name: 'black Coffee',
      price: 10.0,
      imagePath: AssetsData.blackCoffee,
    ),
    CoffeeModel(
      name: 'cold Coffee',
      price: 8.0,
      imagePath: AssetsData.coldCoffee,
    ),
    CoffeeModel(
      name: 'latte',
      price: 15.0,
      imagePath: AssetsData.latte,
    ),
    CoffeeModel(
      name: 'iced latte',
      price: 20.0,
      imagePath: AssetsData.icedLatte,
    ),
    CoffeeModel(
      name: 'espresso',
      price: 30.0,
      imagePath: AssetsData.espresso,
    ),
    CoffeeModel(
      name: 'hot Chocolate',
      price: 70.0,
      imagePath: AssetsData.hotChocolate,
    ),
    CoffeeModel(
      name: 'orange coffee',
      price: 40.0,
      imagePath: AssetsData.orangeCoffee,
    ),
  ];

  // سلة المستخدم
  final List<CoffeeModel> _userCart = [];

  // الحصول على قائمة المشروبات
  List<CoffeeModel> get coffeeShop => _shop;

  // الحصول على سلة المستخدم
  List<CoffeeModel> get userCurt => _userCart;

// إضافة عنصر إلى السلة
  void addItemToCart(CoffeeModel cartItem) {
    _userCart.add(cartItem);
    calculateTotalPrice();
    emit(CoffeeAddItem());
  }

  // إزالة عنصر من السلة
  void removeItemFromCart(CoffeeModel cartItem) {
    _userCart.remove(cartItem);
    calculateTotalPrice();
    emit(CoffeeRemoveItem());
  }

  // // جلب العنصر من السلة باستخدام الفهرس
  // CoffeeModel? getCartItem(int index) {
  //   if (index >= 0 && index < _userCart.length) {
  //     return _userCart[index];
  //   }
  //   return null;
  // }

  void getItemQuantity(CoffeeModel cartItem) {
    final index = _shop.indexOf(cartItem);
     _shop[index].quantity;
    emit(CoffeeGetCountDrinks());
  }

  // زيادة كمية العنصر
  void incrementItemQuantity(CoffeeModel cartItem) {
    final index = _shop.indexOf(cartItem);
    if (index != -1 && _shop[index].quantity < 10) {
      _shop[index].quantity += 1;
      calculateTotalPrice();
      emit(CoffeeIncrementCountDrinks());
    }
  }

  // تقليل كمية العنصر
  void decrementItemQuantity(CoffeeModel cartItem) {
    final index = _shop.indexOf(cartItem);
    if (index != -1 && _shop[index].quantity > 1) {
      _shop[index].quantity -= 1;
      calculateTotalPrice();
      emit(CoffeeDecrementCountDrinks());
    }
  }

  // تغيير حجم المشروب
  String selectedSize = 'M';

  void changeSelectedSize({required String newSelected}) {
    selectedSize = newSelected;
    emit(CoffeeChangeSelectedSize());
  }

  // // حساب المجموع الكلي
  // double totalPrice = 0.0;
  //
  // void calculateTotalPrice() {
  //   totalPrice = 0.0;
  //   for (var item in _userCart) {
  //     totalPrice += item.price * item.quantity;
  //   }
  //   print(' total price ${totalPrice}');
  //   emit(CoffeeCalculateTotalSale());
  // }

  // حساب المجموع الكلي
  double totalPrice = 0.0;

  void calculateTotalPrice() {
    totalPrice = 0.0;
    for (var item in _userCart) {
      double itemPrice = item.price;

      // تعديل السعر بناءً على الحجم
      if (item.size == 'S') {
        itemPrice *= 0.90; // خصم 10%
      } else if (item.size == 'L') {
        itemPrice *= 1.10; // زيادة 10%
      }

      totalPrice += itemPrice * item.quantity;
    }

    print('Total price: $totalPrice');
    emit(CoffeeCalculateTotalSale());
  }
}
