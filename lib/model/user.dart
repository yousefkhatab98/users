class User {
  int id;
  String name;
  String username;
  String email;
  String phone;
  String website;
  Address address;
  Company company;
  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.website,
      this.address,
      this.company});
  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson['id'],
      name: parsedJson['name'],
      username: parsedJson['username'],
      email: parsedJson['email'],
      phone: parsedJson['phone'],
      website: parsedJson['website'],
      address: Address.fromJson(parsedJson['address']),
      company: Company.fromJson(parsedJson['company']),
    );
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;
  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }
}

class Geo {
  String lat;
  String lng;
  Geo({this.lat, this.lng});
  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class Company {
  String name;
  String catchPhrase;
  String bs;
  Company({this.name, this.catchPhrase, this.bs});
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}
