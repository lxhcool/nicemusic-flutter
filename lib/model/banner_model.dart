class BannerModel {
  final List<BannerItemModel> list;

  BannerModel({
    this.list
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    var bannerListJson = json["banners"] as List;
    List<BannerItemModel> bannerList = bannerListJson.map((i) => BannerItemModel.fromJson(i)).toList();
    return BannerModel(
      list: bannerList
    );
  }
}

class BannerItemModel {
  final String imageUrl;
  final String typeTitle;

  BannerItemModel({
    this.imageUrl, 
    this.typeTitle
  });

  factory BannerItemModel.fromJson(Map<String, dynamic> json) {
    return BannerItemModel(
      imageUrl: json["imageUrl"],
      typeTitle: json["typeTitle"]
    );
  }
}