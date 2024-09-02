class CharacterModel {

  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final String created;

  CharacterModel({
   
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
      created: json['created'],
    );
  }
}
