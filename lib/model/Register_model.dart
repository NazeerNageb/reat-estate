class Registermodel {
  String? email;
  String? imageUrl;
  String? password;
  String? phone;
 

  Registermodel(
      {this.email, this.imageUrl, this.password, this.phone});

  Registermodel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    imageUrl = json['image_url'];
    password = json['password'];
    phone = json['phone'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['image_url'] = this.imageUrl;
    data['password'] = this.password;
    data['phone'] = this.phone;
    
    return data;
  }
}
