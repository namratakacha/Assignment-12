class NewModel {
  final String img;
  final String? name;

  NewModel({required this.img, this.name});
}

List myPlant = [
  {
    "img": "assets/rose.jpg",
    "name": "Maniplant",
  },
];

List<NewModel> getlist() {
  return myPlant
      .map(
        (e) => NewModel(
          img: e["img"],
          name: e["name"],
        ),
      )
      .toList();
}
