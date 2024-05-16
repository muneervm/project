
import 'package:project/models/recipedetails_copy.dart';

class Content {
  Description? description;
  List<String>? preparationSteps;
  Video? videos;
  MoreContent? moreContent;
  Details? details;
  MoreContent? relatedContent;
  List<IngredientLines>? ingredientLines;
  String? unitSystem;
  Reviews? reviews;
  MoreContent? relatedProducts;
  int? preparationStepCount;

  Content({
    this.description,
    this.preparationSteps,
    this.videos,
    this.moreContent,
    this.details,
    this.relatedContent,
    this.ingredientLines,
    this.unitSystem,
    this.reviews,
    this.relatedProducts,
    this.preparationStepCount,
  });

  Content.fromJson(Map<String, dynamic> json) {
    description = json['description'] != null ? Description.fromJson(json['description']) : null;
    preparationSteps = (json['preparationSteps'] as List<dynamic>?)?.cast<String>();
    videos = json['videos'] != null ? Video.fromJson(json['videos']) : null;
    moreContent = json['moreContent'] != null ? MoreContent.fromJson(json['moreContent']) : null;
    details = json['details'] != null ? Details.fromJson(json['details']) : null;
    relatedContent = json['relatedContent'] != null ? MoreContent.fromJson(json['relatedContent']) : null;
    if (json['ingredientLines'] != null) {
      ingredientLines = <IngredientLines>[];
      json['ingredientLines'].forEach((v) {
        ingredientLines!.add(IngredientLines.fromJson(v));
      });
    }
    unitSystem = json['unitSystem'];
    reviews = json['reviews'] != null ? Reviews.fromJson(json['reviews']) : null;
    relatedProducts = json['relatedProducts'] != null ? MoreContent.fromJson(json['relatedProducts']) : null;
    preparationStepCount = json['preparationStepCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['preparationSteps'] = preparationSteps;
    if (videos != null) {
      data['videos'] = videos!.toJson();
    }
    if (moreContent != null) {
      data['moreContent'] = moreContent!.toJson();
    }
    if (details != null) {
      data['details'] = details!.toJson();
    }
    if (relatedContent != null) {
      data['relatedContent'] = relatedContent!.toJson();
    }
    if (ingredientLines != null) {
      data['ingredientLines'] = ingredientLines!.map((v) => v.toJson()).toList();
    }
    data['unitSystem'] = unitSystem;
    if (reviews != null) {
      data['reviews'] = reviews!.toJson();
    }
    if (relatedProducts != null) {
      data['relatedProducts'] = relatedProducts!.toJson();
    }
    data['preparationStepCount'] = preparationStepCount;
    return data;
  }
}
