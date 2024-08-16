class User {
  final int userId;
  final String name;
  final String email;
  final String image;
  final String gender;
  final String dateOfBirth;
  final String address;
  final String mobileNo;
  final String board;
  final String classLevel;
  final String state;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.image,
    required this.gender,
    required this.dateOfBirth,
    required this.address,
    required this.mobileNo,
    required this.board,
    required this.classLevel,
    required this.state,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      gender: json['gender'],
      dateOfBirth: json['date_of_birth'],
      address: json['address'],
      mobileNo: json['mobile_no'],
      board: json['board'],
      classLevel: json['class'],
      state: json['state'],
    );
  }
}
