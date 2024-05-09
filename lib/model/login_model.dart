class Registermodel {
  String? email;

  String? password;
 
 

  Registermodel(
      {this.email, this.password});

  Registermodel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];

    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
