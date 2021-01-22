class RecycleBin {
  final String latitude;
  final String longitude;
  final String address;
  final String borough;
  final String siteType;

  RecycleBin(
      {this.latitude,
      this.address,
      this.borough,
      this.longitude,
      this.siteType});

  factory RecycleBin.fromJson(Map<String, dynamic> json) {
    return new RecycleBin(
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      borough: json['borough'],
      siteType: json['site_type'],
    );
  }
}
