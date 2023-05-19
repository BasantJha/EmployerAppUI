
import 'databasehelper.dart';

class User {
  int? id;
  String? email;
  String? name;
  String? address;
  int? contact;
  User(this.id,this.email, this.name,this.address, this.contact);

  User.fromMap(Map<String, dynamic> map,) {
    id = map['id'];
    email =map['email'];
    name = map['name'];
    address = map['address'];
    contact = map['contact'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnemail:email,
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnaddress: address,
      DatabaseHelper.columncontact: contact,
    };
  }
}

