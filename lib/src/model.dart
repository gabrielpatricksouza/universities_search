class UniversitiesModel {
  final int id;
  final String fullName;
  final String name;
  final String ibge;
  final String city;
  final String uf;
  final String zipcode;
  final String street;
  final String number;
  final String neighborhood;
  final String phone;
  final String createdAt;
  final String updatedAt;

  UniversitiesModel({
    this.id = 0,
    this.fullName = "",
    this.name = "",
    this.ibge = "",
    this.city = "",
    this.uf = "",
    this.zipcode = "",
    this.street = "",
    this.number = "",
    this.neighborhood = "",
    this.phone = "",
    this.createdAt = "",
    this.updatedAt = "",
  });

  factory UniversitiesModel.fromMap(Map<String, dynamic> json) {
    return UniversitiesModel(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? "",
      name: json['name'] ?? "",
      ibge: json['ibge'] ?? "",
      city: json['city'] ?? "",
      uf: json['uf'] ?? "",
      zipcode: json['zipcode'] ?? "",
      street: json['street'] ?? "",
      number: json['number'] ?? "",
      neighborhood: json['neighborhood'] ?? "",
      phone: json['phone'] ?? "",
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
    );
  }

  Map<String, dynamic> toMap(UniversitiesModel university) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = university.id;
    data['full_name'] = university.fullName;
    data['name'] = university.name;
    data['ibge'] = university.ibge;
    data['city'] = university.city;
    data['uf'] = university.uf;
    data['zipcode'] = university.zipcode;
    data['street'] = university.street;
    data['number'] = university.number;
    data['neighborhood'] = university.neighborhood;
    data['phone'] = university.phone;
    data['created_at'] = university.createdAt;
    data['updated_at'] = university.updatedAt;
    return data;
  }
}
