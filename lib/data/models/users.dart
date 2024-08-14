import 'dart:convert';

import 'package:flutter_ics_homescreen/data/models/user.dart';
import 'package:flutter_ics_homescreen/export.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

@immutable
class Users {
  final List<User> users;
  final User selectedUser;
  const Users({
    required this.users,
    required this.selectedUser,
  });
  Users.initial()
      //: users = <User>[],
      : users = [],
        selectedUser = const User(id: '0', name: '');

  Users copyWith({
    List<User>? users,
    User? selectedUser,
  }) {
    return Users(
      users: users ?? this.users,
      selectedUser: selectedUser ?? this.selectedUser,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'users': users.map((x) => x.toMap()).toList(),
      'selectedUser': selectedUser.toMap(),
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      users: List<User>.from(map['users']?.map((x) => User.fromMap(x))),
      selectedUser: User.fromMap(map['selectedUser']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));

  @override
  String toString() => 'Users(users: $users, selectedUser: $selectedUser)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Users &&
        listEquals(other.users, users) &&
        other.selectedUser == selectedUser;
  }

  @override
  int get hashCode => users.hashCode ^ selectedUser.hashCode;
}
