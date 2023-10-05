class UserModel {
  String name;
  String surname;
  int age;
  String phoneNumber;
  UserModel({
    required this.name,
    required this.surname,
    required this.age,
    required this.phoneNumber,
  });

  UserModel copyWith({
    String? name,
    String? surname,
    int? age,
    String? phoneNumber,
  }) {
    return UserModel(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      age: age ?? this.age,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'age': age,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      surname: map['surname'] as String,
      age: map['age'] as int,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, surname: $surname, age: $age, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.surname == surname &&
        other.age == age &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        surname.hashCode ^
        age.hashCode ^
        phoneNumber.hashCode;
  }
}
