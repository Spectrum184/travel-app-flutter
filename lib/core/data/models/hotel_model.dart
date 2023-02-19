class HotelModel {
  HotelModel(
      {required this.hotelImage,
      required this.awayKilometer,
      required this.hotelName,
      required this.location,
      required this.numberOfView,
      required this.price,
      required this.star});

  final String hotelImage;
  final String hotelName;
  final String location;
  final String awayKilometer;
  final double star;
  final int numberOfView;
  final int price;
}
