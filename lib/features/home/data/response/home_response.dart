class HomeResponse {
  List<HomeDataResponse>? data;
  bool? success;
  int? status;

  HomeResponse({this.data, this.success, this.status});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HomeDataResponse>[];
      json['data'].forEach((v) {
        data!.add(new HomeDataResponse.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}

class HomeDataResponse {
  int? id;
  String? name;
  List<String>? photos;
  String? thumbnailImage;
  double? basePrice;
  double? baseDiscountedPrice;
  int? todaysDeal;
  int? featured;
  String? unit;
  int? discount;
  String? discountType;
  int? rating;
  int? sales;
  HomeResponseLinks? links;

  HomeDataResponse(
      {this.id,
        this.name,
        this.photos,
        this.thumbnailImage,
        this.basePrice,
        this.baseDiscountedPrice,
        this.todaysDeal,
        this.featured,
        this.unit,
        this.discount,
        this.discountType,
        this.rating,
        this.sales,
        this.links});

  HomeDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photos = json['photos'].cast<String>();
    thumbnailImage = json['thumbnail_image'];
    basePrice = double.parse(json['base_price'].toString());
    baseDiscountedPrice = double.parse(json['base_discounted_price'].toString());
    todaysDeal = json['todays_deal'];
    featured = json['featured'];
    unit = json['unit'];
    discount = json['discount'];
    discountType = json['discount_type'];
    rating = json['rating'];
    sales = json['sales'];
    links = json['links'] != null ? new HomeResponseLinks.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photos'] = this.photos;
    data['thumbnail_image'] = this.thumbnailImage;
    data['base_price'] = this.basePrice;
    data['base_discounted_price'] = this.baseDiscountedPrice;
    data['todays_deal'] = this.todaysDeal;
    data['featured'] = this.featured;
    data['unit'] = this.unit;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['rating'] = this.rating;
    data['sales'] = this.sales;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    return data;
  }
}

class HomeResponseLinks {
  String? details;
  String? reviews;
  String? related;

  HomeResponseLinks({this.details, this.reviews, this.related});

  HomeResponseLinks.fromJson(Map<String, dynamic> json) {
    details = json['details'];
    reviews = json['reviews'];
    related = json['related'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['details'] = this.details;
    data['reviews'] = this.reviews;
    data['related'] = this.related;
    return data;
  }
}