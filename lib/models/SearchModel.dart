// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  int total;
  int totalPages;
  List<Result> results;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    total: json["total"],
    totalPages: json["total_pages"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "total_pages": totalPages,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    this.description,
    required this.altDescription,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    this.sponsorship,
    required this.topicSubmissions,
    required this.user,
    required this.tags,
  });

  String id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  Urls? urls;
  ResultLinks? links;
  int? likes;
  bool? likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  ResultTopicSubmissions? topicSubmissions;
  User? user;
  List<Tag> tags;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    urls: Urls.fromJson(json["urls"]),
    links: ResultLinks.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: ResultTopicSubmissions.fromJson(json["topic_submissions"]),
    user: User.fromJson(json["user"]),
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "promoted_at": promotedAt?.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "urls": urls?.toJson(),
    "links": links?.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    "sponsorship": sponsorship,
    "topic_submissions": topicSubmissions?.toJson(),
    "user": user?.toJson(),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
  };
}

class ResultLinks {
  ResultLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  factory ResultLinks.fromJson(Map<String, dynamic> json) => ResultLinks(
    self: json["self"],
    html: json["html"],
    download: json["download"],
    downloadLocation: json["download_location"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "download": download,
    "download_location": downloadLocation,
  };
}

class Tag {
  Tag({
    required this.type,
    required this.title,
    this.source,
  });

  TypeEnum? type;
  String? title;
  Source? source;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    type: typeEnumValues.map[json["type"]]!,
    title: json["title"],
    source: json["source"] == null ? null : Source.fromJson(json["source"]),
  );

  Map<String, dynamic> toJson() => {
    "type": typeEnumValues.reverse[type],
    "title": title,
    "source": source?.toJson(),
  };
}

class Source {
  Source({
    required this.ancestry,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.metaTitle,
    required this.metaDescription,
    required this.coverPhoto,
  });

  Ancestry? ancestry;
  String? title;
  String? subtitle;
  String? description;
  String? metaTitle;
  String? metaDescription;
  CoverPhoto? coverPhoto;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    ancestry: Ancestry.fromJson(json["ancestry"]),
    title: json["title"],
    subtitle: json["subtitle"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    coverPhoto: CoverPhoto.fromJson(json["cover_photo"]),
  );

  Map<String, dynamic> toJson() => {
    "ancestry": ancestry?.toJson(),
    "title": title,
    "subtitle": subtitle,
    "description": description,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "cover_photo": coverPhoto?.toJson(),
  };
}

class Ancestry {
  Ancestry({
    required this.type,
    this.category,
    this.subcategory,
  });

  TypeClass? type;
  TypeClass? category;
  TypeClass? subcategory;

  factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
    type: TypeClass.fromJson(json["type"]),
    category: json["category"] == null ? null : TypeClass.fromJson(json["category"]),
    subcategory: json["subcategory"] == null ? null : TypeClass.fromJson(json["subcategory"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type?.toJson() ?? '',
    "category": category?.toJson(),
    "subcategory": subcategory?.toJson(),
  };
}

class TypeClass {
  TypeClass({
    required this.slug,
    required this.prettySlug,
  });

  String? slug;
  String? prettySlug;

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
    slug: json["slug"],
    prettySlug: json["pretty_slug"],
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "pretty_slug": prettySlug,
  };
}

class CoverPhoto {
  CoverPhoto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    this.description,
    this.altDescription,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    this.sponsorship,
    required this.topicSubmissions,
    required this.premium,
    required this.user,
  });

  String id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  Urls? urls;
  ResultLinks? links;
  int? likes;
  bool? likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  CoverPhotoTopicSubmissions? topicSubmissions;
  bool? premium;
  User? user;

  factory CoverPhoto.fromJson(Map<String, dynamic> json) => CoverPhoto(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    urls: Urls.fromJson(json["urls"]),
    links: ResultLinks.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: CoverPhotoTopicSubmissions.fromJson(json["topic_submissions"]),
    premium: json["premium"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "promoted_at": promotedAt?.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "urls": urls?.toJson(),
    "links": links?.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    "sponsorship": sponsorship,
    "topic_submissions": topicSubmissions?.toJson(),
    "premium": premium,
    "user": user?.toJson(),
  };
}

class CoverPhotoTopicSubmissions {
  CoverPhotoTopicSubmissions({
    this.architectureInterior,
    this.colorOfWater,
    this.wallpapers,
    this.texturesPatterns,
    this.spirituality,
    this.artsCulture,
    this.nature,
  });

  Experimental? architectureInterior;
  Experimental? colorOfWater;
  Experimental? wallpapers;
  Experimental? texturesPatterns;
  Experimental? spirituality;
  Experimental? artsCulture;
  Experimental? nature;

  factory CoverPhotoTopicSubmissions.fromJson(Map<String, dynamic> json) => CoverPhotoTopicSubmissions(
    architectureInterior: json["architecture-interior"] == null ? null : Experimental.fromJson(json["architecture-interior"]),
    colorOfWater: json["color-of-water"] == null ? null : Experimental.fromJson(json["color-of-water"]),
    wallpapers: json["wallpapers"] == null ? null : Experimental.fromJson(json["wallpapers"]),
    texturesPatterns: json["textures-patterns"] == null ? null : Experimental.fromJson(json["textures-patterns"]),
    spirituality: json["spirituality"] == null ? null : Experimental.fromJson(json["spirituality"]),
    artsCulture: json["arts-culture"] == null ? null : Experimental.fromJson(json["arts-culture"]),
    nature: json["nature"] == null ? null : Experimental.fromJson(json["nature"]),
  );

  Map<String, dynamic> toJson() => {
    "architecture-interior": architectureInterior?.toJson(),
    "color-of-water": colorOfWater?.toJson(),
    "wallpapers": wallpapers?.toJson(),
    "textures-patterns": texturesPatterns?.toJson(),
    "spirituality": spirituality?.toJson(),
    "arts-culture": artsCulture?.toJson(),
    "nature": nature?.toJson(),
  };
}

class Experimental {
  Experimental({
    required this.status,
    this.approvedOn,
  });

  Status? status;
  DateTime? approvedOn;

  factory Experimental.fromJson(Map<String, dynamic> json) => Experimental(
    status: statusValues.map[json["status"]]!,
    approvedOn: json["approved_on"] == null ? null : DateTime.parse(json["approved_on"]),
  );

  Map<String, dynamic> toJson() => {
    "status": statusValues.reverse[status],
    "approved_on": approvedOn?.toIso8601String(),
  };
}

enum Status { APPROVED, REJECTED }

final statusValues = EnumValues({
  "approved": Status.APPROVED,
  "rejected": Status.REJECTED
});

class Urls {
  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
    smallS3: json["small_s3"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
    "small_s3": smallS3,
  };
}

class User {
  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    required this.links,
    required this.profileImage,
    this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });

  String id;
  DateTime? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  UserLinks? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  bool? acceptedTos;
  bool? forHire;
  Social? social;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    twitterUsername: json["twitter_username"],
    portfolioUrl: json["portfolio_url"],
    bio: json["bio"],
    location: json["location"],
    links: UserLinks.fromJson(json["links"]),
    profileImage: ProfileImage.fromJson(json["profile_image"]),
    instagramUsername: json["instagram_username"],
    totalCollections: json["total_collections"],
    totalLikes: json["total_likes"],
    totalPhotos: json["total_photos"],
    acceptedTos: json["accepted_tos"],
    forHire: json["for_hire"],
    social: Social.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "updated_at": updatedAt?.toIso8601String(),
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "twitter_username": twitterUsername,
    "portfolio_url": portfolioUrl,
    "bio": bio,
    "location": location,
    "links": links?.toJson(),
    "profile_image": profileImage?.toJson(),
    "instagram_username": instagramUsername,
    "total_collections": totalCollections,
    "total_likes": totalLikes,
    "total_photos": totalPhotos,
    "accepted_tos": acceptedTos,
    "for_hire": forHire,
    "social": social?.toJson(),
  };
}

class UserLinks {
  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;
  String? following;
  String? followers;

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
    self: json["self"],
    html: json["html"],
    photos: json["photos"],
    likes: json["likes"],
    portfolio: json["portfolio"],
    following: json["following"],
    followers: json["followers"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "photos": photos,
    "likes": likes,
    "portfolio": portfolio,
    "following": following,
    "followers": followers,
  };
}

class ProfileImage {
  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  String? small;
  String? medium;
  String? large;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "medium": medium,
    "large": large,
  };
}

class Social {
  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  dynamic paypalEmail;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
    instagramUsername: json["instagram_username"],
    portfolioUrl: json["portfolio_url"],
    twitterUsername: json["twitter_username"],
    paypalEmail: json["paypal_email"],
  );

  Map<String, dynamic> toJson() => {
    "instagram_username": instagramUsername,
    "portfolio_url": portfolioUrl,
    "twitter_username": twitterUsername,
    "paypal_email": paypalEmail,
  };
}

enum TypeEnum { LANDING_PAGE, SEARCH }

final typeEnumValues = EnumValues({
  "landing_page": TypeEnum.LANDING_PAGE,
  "search": TypeEnum.SEARCH
});

class ResultTopicSubmissions {
  ResultTopicSubmissions({
    this.wallpapers,
    this.experimental,
  });

  Experimental? wallpapers;
  Experimental? experimental;

  factory ResultTopicSubmissions.fromJson(Map<String, dynamic> json) => ResultTopicSubmissions(
    wallpapers: json["wallpapers"] == null ? null : Experimental.fromJson(json["wallpapers"]),
    experimental: json["experimental"] == null ? null : Experimental.fromJson(json["experimental"]),
  );

  Map<String, dynamic> toJson() => {
    "wallpapers": wallpapers?.toJson(),
    "experimental": experimental?.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
