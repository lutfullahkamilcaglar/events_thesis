class WaitingUser {
  final String uid;
  final String email;

  const WaitingUser({
    required this.uid,
    required this.email,
  });

  factory WaitingUser.fromJson(Map<String, dynamic> json) {
    return WaitingUser(
        uid: json['uid'],
        email: json['email']
    );
  }
}