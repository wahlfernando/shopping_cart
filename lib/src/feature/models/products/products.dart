import 'dart:convert';


class Product {
  String? name;
  String? detail;
  String? price;
  String? info;
  String? image;
  
  Product({
    this.name,
    this.detail,
    this.price,
    this.info,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'detail': detail,
      'price': price,
      'info': info,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      detail: map['detail'],
      price: map['price'],
      info: map['info'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}

