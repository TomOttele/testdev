class User {
  final String clubname;
  final String team;

  final String function;

  const User(
      {required this.clubname, required this.team, required this.function});

  User copy({String? clubname, String? team, String? function}) => User(
        clubname: clubname ?? this.clubname,
        team: team ?? this.team,
        function: function ?? this.function,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          clubname == other.clubname &&
          team == other.team &&
          function == other.function;

  @override
  int get hashCode => clubname.hashCode ^ team.hashCode ^ function.hashCode;
}
