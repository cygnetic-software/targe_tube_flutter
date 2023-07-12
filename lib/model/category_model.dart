class Category {
  final String categoryName;
  final String categoryIconUrl;
  final List<dynamic> subcategories;
  Category(
      {required this.categoryIconUrl,
      required this.categoryName,
      required this.subcategories});
  factory Category.fromJson(json) {
    return Category(
        categoryIconUrl: json["categoryIconUrl"],
        categoryName: json["categoryName"],
        subcategories:
            json["subcategories"].map((data) => data.toString()).toList());
  }
}
