class User {
  String email;
  String id;
  String username;

  List posts;
  List blockedUsers;

  User(
      {required this.id,
      required this.username,
      required this.email,
      this.blockedUsers = const [],
      this.posts = const []});
}
