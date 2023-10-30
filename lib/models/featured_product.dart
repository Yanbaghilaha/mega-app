class Product {
  final String nameProduct;
  final double price, review, rating;
  final bool sale;
  final String image;

  Product(
      {required this.nameProduct,
      this.sale = false,
      required this.price,
      required this.image,
      required this.review,
      required this.rating});
}
