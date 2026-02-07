enum ProductCategory { watches, sneakers, headphones, bags }

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final ProductCategory category;
  final List<String> availableSizes;
  final List<int> availableColors; // Hex codes
  final double rating;
  final int reviewCount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.category,
    this.availableSizes = const [],
    this.availableColors = const [],
    this.rating = 4.5,
    this.reviewCount = 0,
  });
}
