// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: file_names
class Category {
  int _id;
  String _name;
  String _image;
  Category(
    this._id,
    this._name,
    this._image,
  );
  String get name {
    return _name;
  }

  set name(String newName) {
    _name = newName;
  }

  String get image {
    return _image;
  }

  set image(String newImage) {
    _image = newImage;
  }
  // same java
  // late String _name;
  // late Stirng _image;

  // Category(String name, String image) {
  //   this._name = name;
  //   this._image = image;
  // }

  // Category(this._name, this._image);
}
