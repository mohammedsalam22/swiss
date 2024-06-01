// ignore_for_file: camel_case_types, non_constant_identifier_names

class MaterialInformations{
  int id;
  String scientific_name;
  String manufacturer;
  String date;
  String image;
  String productname;
  String price;
  int quantity;
  MaterialInformations({
    required this.id,
    required this.scientific_name,
    required this.manufacturer,
    required this.date,
    required this.image,
    required this.price,
    required this.productname,
    required this.quantity
  });
}