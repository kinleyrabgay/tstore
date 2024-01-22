import 'package:tstore/utils/formatters/formatter.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
  });

  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  // Helper
  String get fullName => '$firstName $lastName';
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  // Split fullname
  static List<String> namePorts(fullName) => fullName.split(' ');

  static String generateUsername(fullName) {
    List<String> namePorts = fullName.split(' ');
    String firstName = namePorts[0].toLowerCase();
    String lastName = namePorts.length > 1 ? namePorts[1].toLowerCase() : '';

    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = 'cwt_$camelCaseUsername';

    return usernameWithPrefix;
  }

  // Empty user model
  static UserModel empty() => UserModel(
        id: '',
        username: '',
        email: '',
        firstName: '',
        lastName: '',
        phoneNumber: '',
        profilePicture: '',
      );

  // Convert model to Json structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // Factory method to create UserModel from Firebase document snapshot
  // factory UserModel.fromSnapShot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;

  //     return UserModel(
  //       id: document.id,
  //       username: data['FirstName'] ?? '',
  //       email: data['Email'] ?? '',
  //       firstName: data['FirstName'] ?? '',
  //       lastName: data['LastName'] ?? '',
  //       phoneNumber: data['PhoneNumber'] ?? '',
  //       profilePicture: data['ProfilePicture'] ?? '',
  //     );
  //   } else {
  //     return document.data();
  //   }
  // }
}
