class Product {
  String product_id, productTitle, description, productImage, category,
  created_at;
  double price;

  Product({
    this.product_id = '',
    this.productTitle = '',
    this.description = '',
    this.productImage = '',
    this.category = '',
    this.created_at = '',
    this.price = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      product_id: json['product_id'].toString(),
      productTitle: json['productTitle'].toString(),
      description: json['description'].toString(),
      productImage: json['productImage'].toString(),
      category: json['category'].toString(),
      created_at: json['created_at'].toString(),
      price: double.parse(json['price']),
    );
  }

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      product_id: json['product_id'].toString(),
      productTitle: json['productTitle'].toString(),
      description: json['description'].toString(),
      productImage: json['productImage'].toString(),
      category: json['category'].toString(),
      created_at: json['created_at'].toString(),
      price: double.parse(json['price']),
    );
  }

  Map<String, dynamic> toMap() =>
      {
        "product_id": product_id,
        "productTitle": productTitle,
        "description": description,
        "productImage": productImage,
        "category": category,
        "price": price,
        "created_at": created_at,

      };
}