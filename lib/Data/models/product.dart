class Product {
  int? id;
  String? name;
  String? details;
  double? ratting;
  double? price;
  String? image;
  String? company;
  int? discount;
  List<String>? options;

  Product(
      {this.id,
        this.name,
        this.details,
        this.ratting,
        this.price,
        this.image,
        this.company,
        this.discount,
        this.options});

  Product.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    ratting = json['ratting'];
    price = json['price'];
    image = json['image'];
    company = json['company'];
    discount = json['discount'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['details'] = this.details;
    data['ratting'] = this.ratting;
    data['price'] = this.price;
    data['image'] = this.image;
    data['company'] = this.company;
    data['discount'] = this.discount;
    data['options'] = this.options;
    return data;
  }
}