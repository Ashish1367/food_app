class User {
  final String username;
  final String email;
  final String uid;

  const User({
    required this.username,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> tojson() => {
        "username": username,
        "email": email,
        "uid": uid,
      };
}
