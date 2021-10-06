class PlantModel {
  final String plant;
  final String? title;
  final String? description;
  final String? price;

  PlantModel({required this.plant, this.title, this.description, this.price});
}

List data = [
  {
    "plant": "assets/rose.jpg",
    "title": "Rose",
    "description":
        "Roses are valued for their rich and varied colors, profusion of bloom, velvety petal texture and, in many cultivars, a rich sweet scent.",
    "price": "Rs.300"
  },
  {
    "plant": "assets/bonsai.jpg",
    "title": "Bonsai",
    "description":
        "A Bonsai tree is a replication of nature, in the form of a miniature tree, without displaying the human intervention too clearly. ",
    "price": "Rs.1200"
  },
  {
    "plant": "assets/mint.jpg",
    "title": "Mint",
    "description":
        "Mint leaves are anti-inflammatory in nature which helps in reducing any inflammation in your stomach ",
    "price": "Rs.150"
  },
  {
    "plant": "assets/money plant.jpg",
    "title": "Money plant",
    "description":
        "The very important benefit of money plant is that it attracts wealth, hence the name money plant.",
    "price": "Rs.200"
  },
  {
    "plant": "assets/bamboo.jpg",
    "title": "Bamboo",
    "description":
        "Bamboo helps to keep the environment clean as it is a natural air purifier.The plant is known for bringing good luck and good fortune to the household.",
    "price": "Rs.250"
  },
  {
    "plant": "assets/tulsi.jpg",
    "title": "Tulsi",
    "description":
        "Tulsi leaves are rich in adaptogens which help in reducing the stress levels in your body.",
    "price": "Rs.150"
  },
];

List<PlantModel> getPlantList() {
  return data
      .map(
        (item) => PlantModel(
            plant: item["plant"],
            title: item["title"],
            description: item["description"],
            price: item["price"]),
      )
      .toList();
}
