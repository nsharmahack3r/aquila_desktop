import 'dart:convert';

class Recruiter {
  final String id;
  final String name;
  final String email;
  final String location;
  Recruiter({
    required this.id,
    required this.name,
    required this.email,
    required this.location,
  });

  factory Recruiter.empty() {
    return Recruiter(
      id: '',
      name: '',
      email: '',
      location: '',
    );
  }

  Recruiter copyWith({
    String? id,
    String? name,
    String? email,
    String? location,
  }) {
    return Recruiter(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'location': location,
    };
  }

  factory Recruiter.fromMap(Map<String, dynamic> map) {
    return Recruiter(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      location: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Recruiter.fromJson(String source) =>
      Recruiter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Recruiter(id: $id, name: $name, email: $email, location: $location)';
  }

  @override
  bool operator ==(covariant Recruiter other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ location.hashCode;
  }
}
