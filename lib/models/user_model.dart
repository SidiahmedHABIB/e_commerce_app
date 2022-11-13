class UserModel {
  int? idUser;
  String? nameUser;
  String? phoneUser;
  String? emailUser;
  String? passwordUser;

  UserModel(
      {this.idUser,
      this.nameUser,
      this.phoneUser,
      this.emailUser,
      this.passwordUser});

  UserModel.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    nameUser = json['name_user'];
    phoneUser = json['phone_user'];
    emailUser = json['email_user'];
    passwordUser = json['password_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    data['name_user'] = this.nameUser;
    data['phone_user'] = this.phoneUser;
    data['email_user'] = this.emailUser;
    data['password_user'] = this.passwordUser;
    return data;
  }
}
