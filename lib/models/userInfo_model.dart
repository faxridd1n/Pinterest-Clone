// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) => UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
    UserInfoModel({
        required this.id,
        required this.updatedAt,
        required this.username,
        required this.name,
        required this.firstName,
        required this.lastName,
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
        required this.followedByUser,
        required this.photos,
        this.badge,
        required this.tags,
        required this.followersCount,
        required this.followingCount,
        required this.allowMessages,
        required this.numericId,
        required this.downloads,
        required this.meta,
    });

    String id;
    DateTime updatedAt;
    String username;
    String name;
    String firstName;
    String lastName;
    dynamic twitterUsername;
    dynamic portfolioUrl;
    dynamic bio;
    dynamic location;
    Links links;
    ProfileImage profileImage;
    dynamic instagramUsername;
    int totalCollections;
    int totalLikes;
    int totalPhotos;
    bool acceptedTos;
    bool forHire;
    Social social;
    bool followedByUser;
    List<dynamic> photos;
    dynamic badge;
    Tags tags;
    int followersCount;
    int followingCount;
    bool allowMessages;
    int numericId;
    int downloads;
    Meta meta;

    factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
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
        links: Links.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: Social.fromJson(json["social"]),
        followedByUser: json["followed_by_user"],
        photos: List<dynamic>.from(json["photos"].map((x) => x)),
        badge: json["badge"],
        tags: Tags.fromJson(json["tags"]),
        followersCount: json["followers_count"],
        followingCount: json["following_count"],
        allowMessages: json["allow_messages"],
        numericId: json["numeric_id"],
        downloads: json["downloads"],
        meta: Meta.fromJson(json["meta"]),
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
        "followed_by_user": followedByUser,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "badge": badge,
        "tags": tags.toJson(),
        "followers_count": followersCount,
        "following_count": followingCount,
        "allow_messages": allowMessages,
        "numeric_id": numericId,
        "downloads": downloads,
        "meta": meta.toJson(),
    };
}

class Links {
    Links({
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

    factory Links.fromJson(Map<String, dynamic> json) => Links(
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

class Meta {
    Meta({
        required this.index,
    });

    bool index;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        index: json["index"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
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

    dynamic instagramUsername;
    dynamic portfolioUrl;
    dynamic twitterUsername;
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

class Tags {
    Tags({
        required this.custom,
        required this.aggregated,
    });

    List<dynamic> custom;
    List<dynamic> aggregated;

    factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        custom: List<dynamic>.from(json["custom"].map((x) => x)),
        aggregated: List<dynamic>.from(json["aggregated"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "custom": List<dynamic>.from(custom.map((x) => x)),
        "aggregated": List<dynamic>.from(aggregated.map((x) => x)),
    };
}
