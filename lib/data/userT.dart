import 'package:flutter/cupertino.dart';

class User {
  final String clubname;
  final String team;
  final String name;
  final String transactionAmount;
  final String transactionDate;
  final String transactionReason;

  final String function;
  final String number;

  const User(
      {required this.clubname,
      required this.team,
      required this.function,
      required this.number,
      required this.name,
      required this.transactionDate,
      required this.transactionAmount,
      required this.transactionReason});

  User copy(
          {String? clubname, String? team, String? function, String? number}) =>
      User(
        clubname: clubname ?? this.clubname,
        team: team ?? this.team,
        function: function ?? this.function,
        number: number ?? this.number,
        name: name ?? this.name,
        transactionAmount: transactionAmount ?? this.transactionAmount,
        transactionReason: transactionReason ?? this.transactionReason,
        transactionDate: transactionDate ?? this.transactionDate,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          clubname == other.clubname &&
          team == other.team &&
          function == other.function &&
          name == other.name &&
          transactionAmount == other.transactionAmount &&
          transactionDate == other.transactionDate &&
          transactionReason == other.transactionReason &&
          number == other.number;

  @override
  int get hashCode => clubname.hashCode ^ team.hashCode ^ function.hashCode;
}
