class CoffeeModel {
  final String name;
  final double price;
  final String imagePath;
  String size;
  int quantity;

  CoffeeModel({
    required this.name,
    required this.price,
    required this.imagePath,
    this.size='M',
    this.quantity=1,
  });
}
