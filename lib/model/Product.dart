// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  int _id;
  String _image;
  String _name;
  double _newPrice;
  double _oldPrice;
  double _discount;
  int _quantity;
  Product(
    this._id,
    this._image,
    this._name,
    this._newPrice,
    this._oldPrice,
    this._discount,
    this._quantity
  );

// Getter cho thuộc tính _id
  int get id => _id;

// Getter và setter cho thuộc tính _image
  String get image => _image;
  set image(String value) => _image = value;

  // Getter và setter cho thuộc tính _name
  String get name => _name;
  set name(String value) => _name = value;

  // Getter và setter cho thuộc tính _newPrice
  double get newPrice => _newPrice;
  set newPrice(double value) => _newPrice = value;

  // Getter và setter cho thuộc tính _oldPrice
  double get oldPrice => _oldPrice;
  set oldPrice(double value) => _oldPrice = value;

  // Getter và setter cho thuộc tính _discount
  double get discount => _discount;
  set discount(double value) => _discount = value;

  // Getter và setter cho thuộc tính _discount
  int get quantity=> _quantity;
  set quantity(int value) => _quantity = value;
}
