class CityModel {
  final String name;
  final double lat;
  final double lng;
  final String? city;
  final String? country;
  final String? description;

  CityModel(this.name, this.lat, this.lng,
      {this.city, this.country, this.description});
}
