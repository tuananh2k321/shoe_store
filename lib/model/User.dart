// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int _id;
  String _name;
  String _avatar;
  String _comment;
  String _datetime;
  int _rating;
  List<String> _photo;

  User(
    this._id,
    this._name,
     this._avatar,
     this._comment,
     this._datetime,
     this._rating,
     this._photo
  );
  
  // Getter cho thuộc tính _id
  int get id => _id;

  // Setter cho thuộc tính _name
  set id(int id) {
    _id = id;
  }

  // Getter cho thuộc tính _name
  String get name => _name;

  // Setter cho thuộc tính _name
  set name(String name) {
    _name = name;
  }

  // Getter cho thuộc tính _avatar
  String get avatar => _avatar;

  // Setter cho thuộc tính _avatar
  set avatar(String avatar) {
    _avatar = avatar;
  }

  // Getter cho thuộc tính _comment
  String get comment => _comment;

  // Setter cho thuộc tính _comment
  set comment(String comment) {
    _comment = comment;
  }

  // Getter cho thuộc tính _datetime
  String get datetime => _datetime;

  // Setter cho thuộc tính _datetime
  set datetime(String datetime) {
    _datetime = datetime;
  }

  // Getter cho thuộc tính _rating
  int get rating => _rating;

  // Setter cho thuộc tính _rating
  set rating(int rating) {
    _rating = rating;
  }

  // Getter cho thuộc tính _photo
  List<String> get photo => _photo;

  // Setter cho thuộc tính _photo
  set photo(List<String> photo) {
    _photo = photo;
  }
}

