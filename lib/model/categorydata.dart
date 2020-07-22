class Category {
  final String category;
  bool isFavorite;

  Category({this.category, this.isFavorite = false});

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
