class RequestDrinkModel {
  final String name;
  final String price;
  final String imagePath;

  final String drinkSize;
  final int countDrinkRequest;

  RequestDrinkModel({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.drinkSize,
    required this.countDrinkRequest,
  });
}
