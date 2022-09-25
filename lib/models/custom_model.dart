class CustomModel{
  int? id;
  Brand? brand;
  Charge?charge;

  CustomModel({this.id, this.brand, this.charge});

  factory CustomModel.fromJson(Map<String,dynamic> json)=> CustomModel(
    id: json['id'],
    brand: Brand.fromJson(json['brand']),
    charge: Charge.fromJson(json['charge'])
  );
}
class Brand{
  String?name;

  Brand({this.name});

  factory Brand.fromJson(Map<String,dynamic>json)=> Brand(
    name: json['name']
  );
}
class Charge{
  double?booking_price;
  double?current_charge;

  Charge({this.booking_price, this.current_charge});

  factory Charge.fromJson(Map<String,dynamic> json)=> Charge(
    booking_price: json['booking_price'],
    current_charge: json['current_charge']
  );

}