class Products {
  int?id;
  Brand?brand;
  String? image;
  Charge?charge;
  String?product_name;
  String?commission_type;
  String?description;
  int?maximum_order;
  int?stock;
  String?seller;

  Products({
      this.id,
      this.brand,
      this.image,
      this.charge,
      this.product_name,
      this.commission_type,
      this.description,
      this.maximum_order,
      this.stock,
      this.seller});

  factory Products.fromJson(Map<String,dynamic>json)=>Products(
    id: json['id'],
    brand: Brand.fromJson(json['brand']),
    image: json['image'],
    charge: Charge.fromJson(json['charge']),
    product_name: json['product_name'],
    commission_type: json['commission_type'],
    description: json['description'],
    maximum_order: json['maximum_order'],
    stock: json['stock'],
    seller: json['seller']
  );
}

class Brand{
  String?name;
  String ?image;

  Brand({this.name, this.image});

  factory Brand.fromJson(Map<String,dynamic> json)=> Brand(
    name: json['name'],
    image: json['image']
  );
}

class Charge{
  double?booking_price;
  double?current_charge;
  double?selling_price;
  double?profit;
  bool?is_event;

  Charge({this.booking_price, this.current_charge, this.selling_price,
      this.profit, this.is_event});

  factory Charge.fromJson(Map<String,dynamic> json)=> Charge(
    booking_price: json['booking_price'],
    current_charge: json['current_charge'],
    selling_price: json['selling_price'],
    profit: json['profit'],
    is_event: json['is_event'],
  );
}