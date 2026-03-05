class RestaurantModel {
  const RestaurantModel({required this.id, required this.name, required this.rating, required this.cuisineType, required this.imageUrl});

  final String id;
  final String name;
  final double rating;
  final String cuisineType;
  final String imageUrl;
}
