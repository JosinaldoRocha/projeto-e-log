class IndicationsModel {
  String name;
  String image;
  String day;
  int id;
  bool successIndications;

  IndicationsModel({
    required this.name,
    required this.image,
    required this.day,
    required this.id,
    required this.successIndications,
  });

  void changeSuccessIndications() {}
}
