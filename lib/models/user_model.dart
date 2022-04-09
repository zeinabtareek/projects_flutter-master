class UserModel {
  int? id;
  String? email;
  String? name;
  String? token;

  UserModel({this.id, this.email, this.name, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['token'] = this.token;
    return data;
  }
}