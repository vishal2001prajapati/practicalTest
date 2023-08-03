import 'package:json_annotation/json_annotation.dart';

part 'firebase_user.g.dart';

@JsonSerializable(explicitToJson: true)
class FirebaseUser {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'password')
  final String? password;

  const FirebaseUser({this.name, required this.email, required this.password});

  factory FirebaseUser.fromJson(Map<String, dynamic> json) =>
      _$FirebaseUserFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseUserToJson(this);
}
