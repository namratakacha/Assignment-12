class PlantList {
  final String plant;
  final String? string;

  PlantList({required this.plant, this.string});
}

List data = [
  {
    "plant": "assets/rose.jpg",
    "string": "Rose",
  },
  {
    "plant": "assets/bonsai.jpg",
    "string": "Bonsai",
  },
  {
    "plant": "assets/mint.jpg",
    "string": "Mint",
  },
  {
    "plant": "assets/money plant.jpg",
    "string": "Money plant",
  },
  {
    "plant": "assets/bamboo.jpg",
    "string": "Bamboo",
  },
  {
    "plant": "assets/tulsi.jpg",
    "string": "Tulsi",
  },
];

List<PlantList> getPlantList() {
  return data
      .map(
        (item) => PlantList(
          plant: item["plant"],
          string: item["string"],
        ),
      )
      .toList();
}
