class UserInfoModel {
  String username;
  bool stripeExists;

  UserInfoModel({required this.username, required this.stripeExists});

  Map<String, dynamic> toJson() =>
      {'username': username, 'stripeExists': stripeExists};

  factory UserInfoModel.initial() {
    return UserInfoModel(username: '', stripeExists: false);
  }

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
        username: json['username'], stripeExists: json['stripeExists']);
  }

  @override
  String toString() {
    return 'UserInfoModel{username: $username, stripeExists: $stripeExists}';
  }
}
