class Product {
  String product_id, productTitle, description, productImage, category,
  created_at, created_by, updated_at, updated_by, created_by_name, updated_by_name;

  double price;

  Product({
    this.product_id = '',
    this.productTitle = '',
    this.description = '',
    this.productImage = '',
    this.category = '',
    this.created_at = '',
    this.created_by = '',
    this.updated_at = '',
    this.updated_by = '',
    this.created_by_name = '',
    this.updated_by_name = '',
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
      updated_at: json['updated_at'].toString(),
      created_by: json['created_by'].toString(),
      updated_by: json['updated_by'].toString(),
      created_by_name: json['created_by_name'].toString(),
      updated_by_name: json['updated_by_name'].toString(),
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
      updated_at: json['updated_at'].toString(),
      created_by: json['created_by'].toString(),
      updated_by: json['updated_by'].toString(),
      created_by_name: json['created_by_name'].toString(),
      updated_by_name: json['updated_by_name'].toString(),
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
        "created_by": created_by,
        "updated_at": updated_at,
        "created_at": created_at,
        "created_by_name": created_by_name,
        "updated_by_name": updated_by_name,

      };
}