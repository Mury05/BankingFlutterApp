class User {
  final String username;
  final String email;
  final String password;
  final int id;
  static int _idCounter = 0;
  User({
    required this.username,
    required this.email,
    required this.password,
  }) : id = _generateId();
  static int _generateId() {
    _idCounter++;
    return _idCounter;
  }
}

final List<User> users = [
  User(
    username: "Bella Smithson ",
    email: "mury@gmail.com",
    password: '123',
  ),
  User(
    username: "James Anderson",
    email: "mury@gmail.com",
    password: '123',
  ),
  User(
    username: "Matthew Taylor",
    email: "mury@gmail.com",
    password: '123',
  ),
  User(
    username: "Mury Bright",
    email: "mury@gmail.com",
    password: '123',
  ),
  User(
    username: "Jonathan Menga",
    email: "john@gmail.com",
    password: '123',
  ),
];
