class Category {
  late final String title;
  late final String image;
  Category({required this.title, required this.image});
}

final List<Category> categories = [
  Category(title: "CCTV", image: "images/cctv2.jpg"),
  Category(title: "Technicial", image: "images/techserevice.png"),
  Category(title: "Medical", image: "images/medical.png"),
  Category(title: "Finace", image: "images/finace.png"),
  Category(title: "Claim", image: "images/claim2.png")
];
