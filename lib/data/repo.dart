class Repo{
  Future<User> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return User(username: "ALI", password: "123456");
  }
}



class User{
  final String username;
  final String password;

  User({required this.username, required this.password});
 factory User.fromJson(Map<String, dynamic> json){
    return User(username: json['username'], password: json['password']);
  }
}