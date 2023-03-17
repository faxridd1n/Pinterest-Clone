// To parse this JSON data, do
//
//     final photosModel = photosModelFromJson(jsonString);

import 'dart:convert';

List<PhotosModel> photosModelFromJson(String str) => List<PhotosModel>.from(json.decode(str).map((x) => PhotosModel.fromJson(x)));

String photosModelToJson(List<PhotosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosModel {
    PhotosModel({
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
        required this.user,
    });

    String id;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime? promotedAt;
    int width;
    int height;
    String color;
    String blurHash;
    String? description;
    String? altDescription;
    Urls urls;
    PhotosModelLinks links;
    int likes;
    bool likedByUser;
    List<dynamic> currentUserCollections;
    Sponsorship? sponsorship;
    TopicSubmissions topicSubmissions;
    User user;

    factory PhotosModel.fromJson(Map<String, dynamic> json) => PhotosModel(
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
        links: PhotosModelLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"] == null ? null : Sponsorship.fromJson(json["sponsorship"]),
        topicSubmissions: TopicSubmissions.fromJson(json["topic_submissions"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "urls": urls.toJson(),
        "links": links.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship?.toJson(),
        "topic_submissions": topicSubmissions.toJson(),
        "user": user.toJson(),
    };
}

class PhotosModelLinks {
    PhotosModelLinks({
        required this.self,
        required this.html,
        required this.download,
        required this.downloadLocation,
    });

    String self;
    String html;
    String download;
    String downloadLocation;

    factory PhotosModelLinks.fromJson(Map<String, dynamic> json) => PhotosModelLinks(
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

class Sponsorship {
    Sponsorship({
        required this.impressionUrls,
        required this.tagline,
        required this.taglineUrl,
        required this.sponsor,
    });

    List<String> impressionUrls;
    String tagline;
    String taglineUrl;
    User sponsor;

    factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
        impressionUrls: List<String>.from(json["impression_urls"].map((x) => x)),
        tagline: json["tagline"],
        taglineUrl: json["tagline_url"],
        sponsor: User.fromJson(json["sponsor"]),
    );

    Map<String, dynamic> toJson() => {
        "impression_urls": List<dynamic>.from(impressionUrls.map((x) => x)),
        "tagline": tagline,
        "tagline_url": taglineUrl,
        "sponsor": sponsor.toJson(),
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
    DateTime updatedAt;
    String username;
    String name;
    String firstName;
    String? lastName;
    String? twitterUsername;
    String? portfolioUrl;
    String? bio;
    String? location;
    UserLinks links;
    ProfileImage profileImage;
    String? instagramUsername;
    int totalCollections;
    int totalLikes;
    int totalPhotos;
    bool acceptedTos;
    bool forHire;
    Social social;

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
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social.toJson(),
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

    String self;
    String html;
    String photos;
    String likes;
    String portfolio;
    String following;
    String followers;

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

    String small;
    String medium;
    String large;

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

class TopicSubmissions {
    TopicSubmissions({
        this.foodDrink,
        this.wallpapers,
        this.texturesPatterns,
        this.the3DRenders,
        this.architectureInterior,
    });

    The3DRenders? foodDrink;
    TexturesPatterns? wallpapers;
    TexturesPatterns? texturesPatterns;
    The3DRenders? the3DRenders;
    The3DRenders? architectureInterior;

    factory TopicSubmissions.fromJson(Map<String, dynamic> json) => TopicSubmissions(
        foodDrink: json["food-drink"] == null ? null : The3DRenders.fromJson(json["food-drink"]),
        wallpapers: json["wallpapers"] == null ? null : TexturesPatterns.fromJson(json["wallpapers"]),
        texturesPatterns: json["textures-patterns"] == null ? null : TexturesPatterns.fromJson(json["textures-patterns"]),
        the3DRenders: json["3d-renders"] == null ? null : The3DRenders.fromJson(json["3d-renders"]),
        architectureInterior: json["architecture-interior"] == null ? null : The3DRenders.fromJson(json["architecture-interior"]),
    );

    Map<String, dynamic> toJson() => {
        "food-drink": foodDrink?.toJson(),
        "wallpapers": wallpapers?.toJson(),
        "textures-patterns": texturesPatterns?.toJson(),
        "3d-renders": the3DRenders?.toJson(),
        "architecture-interior": architectureInterior?.toJson(),
    };
}

class The3DRenders {
    The3DRenders({
        required this.status,
    });

    String status;

    factory The3DRenders.fromJson(Map<String, dynamic> json) => The3DRenders(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}

class TexturesPatterns {
    TexturesPatterns({
        required this.status,
        this.approvedOn,
    });

    String status;
    DateTime? approvedOn;

    factory TexturesPatterns.fromJson(Map<String, dynamic> json) => TexturesPatterns(
        status: json["status"],
        approvedOn: json["approved_on"] == null ? null : DateTime.parse(json["approved_on"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "approved_on": approvedOn?.toIso8601String(),
    };
}

class Urls {
    Urls({
        required this.raw,
        required this.full,
        required this.regular,
        required this.small,
        required this.thumb,
        required this.smallS3,
    });

    String raw;
    String full;
    String regular;
    String small;
    String thumb;
    String smallS3;

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
