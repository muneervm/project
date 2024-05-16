class Description {
  String? mobileSectionName;
  String? text;
  String? shortText;

  Description({this.mobileSectionName, this.text, this.shortText});

  Description.fromJson(Map<String, dynamic> json) {
    mobileSectionName = json['mobileSectionName'];
    text = json['text'];
    shortText = json['shortText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mobileSectionName'] = mobileSectionName;
    data['text'] = text;
    data['shortText'] = shortText;
    return data;
  }
}

class VideoUrls {
  String? ios;
  String? android;

  VideoUrls({this.ios, this.android});

  VideoUrls.fromJson(Map<String, dynamic> json) {
    ios = json['ios'];
    android = json['android'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ios'] = ios;
    data['android'] = android;
    return data;
  }
}

class MoreContent {
  String? mobileSectionName;

  MoreContent({this.mobileSectionName});

  MoreContent.fromJson(Map<String, dynamic> json) {
    mobileSectionName = json['mobileSectionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mobileSectionName'] = mobileSectionName;
    return data;
  }
}

class Details {
  String? name;
  List<Images>? images;
  String? directionsUrl;
  List<IngredientLines>? ingredientLines;
  String? totalTime;
  Reviews? reviews;
  MoreContent? relatedContent;

  Details({
    this.name,
    this.images,
    this.directionsUrl,
    this.ingredientLines,
    this.totalTime,
    this.reviews,
    this.relatedContent,
  });

  Details.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    directionsUrl = json['directionsUrl'];
    if (json['ingredientLines'] != null) {
      ingredientLines = <IngredientLines>[];
      json['ingredientLines'].forEach((v) {
        ingredientLines!.add(IngredientLines.fromJson(v));
      });
    }
    totalTime = json['totalTime'];
    reviews = json['reviews'] != null ? Reviews.fromJson(json['reviews']) : null;
    relatedContent = json['relatedContent'] != null ? MoreContent.fromJson(json['relatedContent']) : null;
  }

  get description => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['directionsUrl'] = directionsUrl;
    if (ingredientLines != null) {
      data['ingredientLines'] = ingredientLines!.map((v) => v.toJson()).toList();
    }
    data['totalTime'] = totalTime;
    if (reviews != null) {
      data['reviews'] = reviews!.toJson();
    }
    if (relatedContent != null) {
      data['relatedContent'] = relatedContent!.toJson();
    }
    return data;
  }
}

class Images {
  String? hostedLargeUrl;

  Images({this.hostedLargeUrl});

  Images.fromJson(Map<String, dynamic> json) {
    hostedLargeUrl = json['hostedLargeUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['hostedLargeUrl'] = hostedLargeUrl;
    return data;
  }
}

class IngredientLines {
  String? category;
  
  String? unit;
  String? ingredientId;
  String? categoryId;
  String? ingredient;
  String? id;
  String? remainder;
  double? quantity;
  String? wholeLine;

  IngredientLines({
    this.category,
   
    this.unit,
    this.ingredientId,
    this.categoryId,
    this.ingredient,
    this.id,
    this.remainder,
    this.quantity,
    this.wholeLine,
  });

  IngredientLines.fromJson(Map<String, dynamic> json) {
    category = json['category'];
   
    unit = json['unit'];
    ingredientId = json['ingredientId'];
    categoryId = json['categoryId'];
    ingredient = json['ingredient'];
    id = json['id'];
    remainder = json['remainder'];
    quantity = json['quantity'];
    wholeLine = json['wholeLine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['category'] = category;
    
    data['unit'] = unit;
    data['ingredientId'] = ingredientId;
    data['categoryId'] = categoryId;
    data['ingredient'] = ingredient;
    data['id'] = id;
    data['remainder'] = remainder;
    data['quantity'] = quantity;
    data['wholeLine'] = wholeLine;
    return data;
  }
}


class Reviews {
  String? mobileSectionName;
  int? totalReviewCount;
  double? averageRating;

  Reviews({this.mobileSectionName, this.totalReviewCount, this.averageRating});

  Reviews.fromJson(Map<String, dynamic> json) {
    mobileSectionName = json['mobileSectionName'];
    totalReviewCount = json['totalReviewCount'];
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mobileSectionName'] = mobileSectionName;
    data['totalReviewCount'] = totalReviewCount;
    data['averageRating'] = averageRating;
    return data;
  }
}

class Video {
  String? snapshotUrl;
  VideoUrls? videoUrls;
  String? videoTypeCode;
  bool? hasAudio;
  String? originalVideoUrl;
  String? createTime;

  Video({
    this.snapshotUrl,
    this.videoUrls,
    this.videoTypeCode,
    this.hasAudio,
    this.originalVideoUrl,
    this.createTime,
  });

  Video.fromJson(Map<String, dynamic> json) {
    snapshotUrl = json['snapshotUrl'];
    videoUrls = json['videoUrls'] != null ? VideoUrls.fromJson(json['videoUrls']) : null;
    videoTypeCode = json['videoTypeCode'];
    hasAudio = json['hasAudio'];
    originalVideoUrl = json['originalVideoUrl'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['snapshotUrl'] = snapshotUrl;
    if (videoUrls != null) {
      data['videoUrls'] = videoUrls!.toJson();
    }
    data['videoTypeCode'] = videoTypeCode;
    data['hasAudio'] = hasAudio;
    data['originalVideoUrl'] = originalVideoUrl;
    data['createTime'] = createTime;
    return data;
  }
}
