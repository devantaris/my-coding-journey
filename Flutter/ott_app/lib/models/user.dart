class User {
  final int? id;
  final String username;
  final String fullname;
  final String password;

  User({this.id, required this.username, required this.fullname, required this.password});

  Map<String, dynamic> toMap() => {
    'id': id,
    'username': username,
    'fullname': fullname,
    'password': password,
  };

  factory User.fromMap(Map<String, dynamic> map) => User(
    id: map['id'],
    username: map['username'],
    fullname: map['fullname'],
    password: map['password'],
  );
}