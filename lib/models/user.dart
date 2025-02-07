class User {
  final String username;
  final String email;
  final String password;
  final double primaryCard;
  final double secondaryCard;

  User({
    required this.username,
    required this.email,
    required this.password,
    this.primaryCard = 0.0,
    this.secondaryCard = 0.0,
  });

  double get totalBalance {
    return primaryCard + secondaryCard;
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
];
