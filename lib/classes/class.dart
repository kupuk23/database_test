class User {
  final String first;
  final String last;
  final int born;

  User({required this.first, required this.last, required this.born});

  Map<String, dynamic> toJson() => {'first': first, 'last': last, 'born': born};

  static User fromJson(Map<String, dynamic> json) =>
      User(first: json['first'], last: json['last'], born: json['born']);
}
