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
    username: "Mury",
    email: "mury@gmail.com",
    password: '123',
  ),
  User(
    username: "John Doe",
    email: "john@gmail.com",
    password: '123',
  ),
  User(
    username: "Mury",
    email: "mury@gmail.com",
    password: '123',
  ),
  User(
    username: "John Doe",
    email: "john@gmail.com",
    password: '123',
  ),
  User(
    username: "Mury",
    email: "mury@gmail.com",
    password: '123',
  ),
  User(
    username: "John Doe",
    email: "john@gmail.com",
    password: '123',
  ),
  User(
    username: "Mury",
    email: "mury@gmail.com",
    password: '123',
  ),
  User(
    username: "John Doe",
    email: "john@gmail.com",
    password: '123',
  ),
];
