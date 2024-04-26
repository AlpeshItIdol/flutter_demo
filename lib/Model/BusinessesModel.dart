// To parse this JSON data, do
//
//     final businessesModel = businessesModelFromJson(jsonString);

import 'dart:convert';

BusinessesModel businessesModelFromJson(String str) => BusinessesModel.fromJson(json.decode(str));

String businessesModelToJson(BusinessesModel data) => json.encode(data.toJson());

class BusinessesModel {
  List<Business>? businesses;
  int? total;
  Region? region;

  BusinessesModel({
    this.businesses,
    this.total,
    this.region,
  });

  factory BusinessesModel.fromJson(Map<String, dynamic> json) => BusinessesModel(
    businesses: json["businesses"] == null ? [] : List<Business>.from(json["businesses"]!.map((x) => Business.fromJson(x))),
    total: json["total"],
    region: json["region"] == null ? null : Region.fromJson(json["region"]),
  );

  Map<String, dynamic> toJson() => {
    "businesses": businesses == null ? [] : List<dynamic>.from(businesses!.map((x) => x.toJson())),
    "total": total,
    "region": region?.toJson(),
  };
}

class Business {
  String? id;
  String? alias;
  String? name;
  String? imageUrl;
  bool? isClosed;
  String? url;
  int? reviewCount;
  List<Category>? categories;
  double? rating;
  Center? coordinates;
  List<String>? transactions;
  String? price;
  Location? location;
  String? phone;
  String? displayPhone;
  double? distance;

  Business({
    this.id,
    this.alias,
    this.name,
    this.imageUrl,
    this.isClosed,
    this.url,
    this.reviewCount,
    this.categories,
    this.rating,
    this.coordinates,
    this.transactions,
    this.price,
    this.location,
    this.phone,
    this.displayPhone,
    this.distance,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    id: json["id"],
    alias: json["alias"],
    name: json["name"],
    imageUrl: json["image_url"],
    isClosed: json["is_closed"],
    url: json["url"],
    reviewCount: json["review_count"],
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    rating: json["rating"]?.toDouble(),
    coordinates: json["coordinates"] == null ? null : Center.fromJson(json["coordinates"]),
    transactions: json["transactions"] == null ? [] : List<String>.from(json["transactions"]!.map((x) => x)),
    price: json["price"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    phone: json["phone"],
    displayPhone: json["display_phone"],
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "alias": alias,
    "name": name,
    "image_url": imageUrl,
    "is_closed": isClosed,
    "url": url,
    "review_count": reviewCount,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "rating": rating,
    "coordinates": coordinates?.toJson(),
    "transactions": transactions == null ? [] : List<dynamic>.from(transactions!.map((x) => x)),
    "price": price,
    "location": location?.toJson(),
    "phone": phone,
    "display_phone": displayPhone,
    "distance": distance,
  };
}

class Category {
  String? alias;
  String? title;

  Category({
    this.alias,
    this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    alias: json["alias"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "alias": alias,
    "title": title,
  };
}

class Center {
  double? latitude;
  double? longitude;

  Center({
    this.latitude,
    this.longitude,
  });

  factory Center.fromJson(Map<String, dynamic> json) => Center(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Location {
  String? address1;
  String? address2;
  String? address3;
  String? city;
  String? zipCode;
  String? country;
  String? state;
  List<String>? displayAddress;

  Location({
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.zipCode,
    this.country,
    this.state,
    this.displayAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address1: json["address1"],
    address2: json["address2"],
    address3: json["address3"],
    city: json["city"],
    zipCode: json["zip_code"],
    country: json["country"],
    state: json["state"],
    displayAddress: json["display_address"] == null ? [] : List<String>.from(json["display_address"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "address1": address1,
    "address2": address2, // Convert enum to string
    "address3": address3,
    "city": city,
    "zip_code": zipCode,
    "country": country,
    "state": state,
    "display_address": displayAddress == null ? [] : List<dynamic>.from(displayAddress!.map((x) => x)),
  };
}




class Region {
  Center? center;

  Region({
    this.center,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    center: json["center"] == null ? null : Center.fromJson(json["center"]),
  );

  Map<String, dynamic> toJson() => {
    "center": center?.toJson(),
  };
}
