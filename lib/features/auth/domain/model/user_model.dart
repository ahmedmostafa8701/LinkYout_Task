class UserModel {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? accessToken;
  String? refreshToken;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.gender,
      this.image,
      this.accessToken,
      this.refreshToken});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      image: json['image'],
      accessToken: json['access'],
      refreshToken: json['refresh']
    );
  }
  Map<String, dynamic> toJson() {
    return{
      'id':id,
      'username':username,
      'email':email,
      'firstName':firstName,
      'lastName':lastName,
      'gender':gender,
      'image':image,
      'accessToken':accessToken,
      'refreshToken':refreshToken
    };
  }
}
