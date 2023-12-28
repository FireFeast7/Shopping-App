class Item {
  final int id;
  final String title;
  final int price;
  final String description;
  final List<String> imageURLS;
  final Map<dynamic, dynamic> category;

  Item(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.imageURLS,
      required this.category});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        imageURLS: json['imageURLS'],
        category: json['category']);
  }
}
