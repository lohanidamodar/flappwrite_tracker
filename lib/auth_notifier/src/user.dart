class User {
  final String id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['\$id'].toString(),
      name: map['name'].toString(),
      email: map['email'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "\$id": id,
      "name": name,
      "email": email,
    };
  }
}
