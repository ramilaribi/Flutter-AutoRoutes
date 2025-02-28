class ProductDataModel {
  final int id;
  final String name;
  final String description;
  final String category;
  final double price;
  final String imageUrl;

  ProductDataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.imageUrl,
  });

  // Factory constructor to map the data from Map to ProductDataModel
  factory ProductDataModel.fromMap(Map<String, dynamic> map) {
    return ProductDataModel(
      id: map['id'], // Convert the id to a string
      name: map['name'],
      description: map['description'],
      category: map['category'],
      price: map['price'].toDouble(),
      imageUrl: map['image'],
    );
  }
}
