class PlantModel {
  final String plant;
  final String? title;

  PlantModel({required this.plant, this.title});
}

List data = [
  {
    "plant": "assets/rose.jpg",
    "title": "Rose",
  },
  {
    "plant": "assets/bonsai.jpg",
    "title": "Bonsai",
  },
  {
    "plant": "assets/mint.jpg",
    "title": "Mint",
  },
  {
    "plant": "assets/money plant.jpg",
    "title": "Money plant",
  },
  {
    "plant": "assets/bamboo.jpg",
    "title": "Bamboo",
  },
  {
    "plant": "assets/tulsi.jpg",
    "title": "Tulsi",
  },
];

List<PlantModel> getPlantList() {
  return data
      .map(
        (item) => PlantModel(
          plant: item["plant"],
          title: item["title"],
        ),
      )
      .toList();
}
