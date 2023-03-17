// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allAlbum.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllPhotoModelAdapter extends TypeAdapter<AllPhotoModel> {
  @override
  final int typeId = 1;

  @override
  AllPhotoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllPhotoModel(
      id: fields[1] as String?,
      createdAt: fields[2] as DateTime?,
      updatedAt: fields[3] as DateTime?,
      promotedAt: fields[4] as DateTime?,
      width: fields[5] as int?,
      height: fields[6] as int?,
      color: fields[7] as String?,
      blurHash: fields[8] as String?,
      description: fields[9] as String?,
      altDescription: fields[10] as String?,
      urls: fields[11] as Urls?,
      links: fields[12] as AllPhotoModelLinks?,
      likes: fields[13] as int?,
      likedByUser: fields[14] as bool?,
      currentUserCollections: (fields[15] as List?)?.cast<dynamic>(),
      sponsorship: fields[16] as dynamic,
      topicSubmissions: fields[17] as TopicSubmissions?,
      user: fields[18] as User?,
    );
  }

  @override
  void write(BinaryWriter writer, AllPhotoModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.updatedAt)
      ..writeByte(4)
      ..write(obj.promotedAt)
      ..writeByte(5)
      ..write(obj.width)
      ..writeByte(6)
      ..write(obj.height)
      ..writeByte(7)
      ..write(obj.color)
      ..writeByte(8)
      ..write(obj.blurHash)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.altDescription)
      ..writeByte(11)
      ..write(obj.urls)
      ..writeByte(12)
      ..write(obj.links)
      ..writeByte(13)
      ..write(obj.likes)
      ..writeByte(14)
      ..write(obj.likedByUser)
      ..writeByte(15)
      ..write(obj.currentUserCollections)
      ..writeByte(16)
      ..write(obj.sponsorship)
      ..writeByte(17)
      ..write(obj.topicSubmissions)
      ..writeByte(18)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllPhotoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AllPhotoModelLinksAdapter extends TypeAdapter<AllPhotoModelLinks> {
  @override
  final int typeId = 2;

  @override
  AllPhotoModelLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllPhotoModelLinks(
      self: fields[1] as String?,
      html: fields[2] as String?,
      download: fields[3] as String?,
      downloadLocation: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AllPhotoModelLinks obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.self)
      ..writeByte(2)
      ..write(obj.html)
      ..writeByte(3)
      ..write(obj.download)
      ..writeByte(4)
      ..write(obj.downloadLocation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllPhotoModelLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TopicSubmissionsAdapter extends TypeAdapter<TopicSubmissions> {
  @override
  final int typeId = 3;

  @override
  TopicSubmissions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TopicSubmissions(
      artsCulture: fields[1] as ArtsCulture?,
      nature: fields[2] as Film?,
      film: fields[3] as Film?,
      streetPhotography: fields[4] as Film?,
    );
  }

  @override
  void write(BinaryWriter writer, TopicSubmissions obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.artsCulture)
      ..writeByte(2)
      ..write(obj.nature)
      ..writeByte(3)
      ..write(obj.film)
      ..writeByte(4)
      ..write(obj.streetPhotography);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopicSubmissionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ArtsCultureAdapter extends TypeAdapter<ArtsCulture> {
  @override
  final int typeId = 4;

  @override
  ArtsCulture read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArtsCulture(
      status: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ArtsCulture obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArtsCultureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FilmAdapter extends TypeAdapter<Film> {
  @override
  final int typeId = 5;

  @override
  Film read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Film(
      status: fields[1] as String?,
      approvedOn: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Film obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.approvedOn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UrlsAdapter extends TypeAdapter<Urls> {
  @override
  final int typeId = 6;

  @override
  Urls read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Urls(
      raw: fields[1] as String?,
      full: fields[2] as String?,
      regular: fields[3] as String?,
      small: fields[4] as String?,
      thumb: fields[5] as String?,
      smallS3: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Urls obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.raw)
      ..writeByte(2)
      ..write(obj.full)
      ..writeByte(3)
      ..write(obj.regular)
      ..writeByte(4)
      ..write(obj.small)
      ..writeByte(5)
      ..write(obj.thumb)
      ..writeByte(6)
      ..write(obj.smallS3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UrlsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 7;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[1] as String?,
      updatedAt: fields[2] as DateTime?,
      username: fields[3] as String?,
      name: fields[4] as String?,
      firstName: fields[5] as String?,
      lastName: fields[6] as String?,
      twitterUsername: fields[7] as String?,
      portfolioUrl: fields[8] as String?,
      bio: fields[9] as String?,
      location: fields[10] as String?,
      links: fields[11] as UserLinks?,
      profileImage: fields[12] as ProfileImage?,
      instagramUsername: fields[13] as String?,
      totalCollections: fields[14] as int?,
      totalLikes: fields[15] as int?,
      totalPhotos: fields[16] as int?,
      acceptedTos: fields[17] as bool?,
      forHire: fields[18] as bool?,
      social: fields[19] as Social?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(19)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.firstName)
      ..writeByte(6)
      ..write(obj.lastName)
      ..writeByte(7)
      ..write(obj.twitterUsername)
      ..writeByte(8)
      ..write(obj.portfolioUrl)
      ..writeByte(9)
      ..write(obj.bio)
      ..writeByte(10)
      ..write(obj.location)
      ..writeByte(11)
      ..write(obj.links)
      ..writeByte(12)
      ..write(obj.profileImage)
      ..writeByte(13)
      ..write(obj.instagramUsername)
      ..writeByte(14)
      ..write(obj.totalCollections)
      ..writeByte(15)
      ..write(obj.totalLikes)
      ..writeByte(16)
      ..write(obj.totalPhotos)
      ..writeByte(17)
      ..write(obj.acceptedTos)
      ..writeByte(18)
      ..write(obj.forHire)
      ..writeByte(19)
      ..write(obj.social);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserLinksAdapter extends TypeAdapter<UserLinks> {
  @override
  final int typeId = 8;

  @override
  UserLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLinks(
      self: fields[1] as String?,
      html: fields[2] as String?,
      photos: fields[3] as String?,
      likes: fields[4] as String?,
      portfolio: fields[5] as String?,
      following: fields[6] as String?,
      followers: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserLinks obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.self)
      ..writeByte(2)
      ..write(obj.html)
      ..writeByte(3)
      ..write(obj.photos)
      ..writeByte(4)
      ..write(obj.likes)
      ..writeByte(5)
      ..write(obj.portfolio)
      ..writeByte(6)
      ..write(obj.following)
      ..writeByte(7)
      ..write(obj.followers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProfileImageAdapter extends TypeAdapter<ProfileImage> {
  @override
  final int typeId = 9;

  @override
  ProfileImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileImage(
      small: fields[1] as String?,
      medium: fields[2] as String?,
      large: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileImage obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.small)
      ..writeByte(2)
      ..write(obj.medium)
      ..writeByte(3)
      ..write(obj.large);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SocialAdapter extends TypeAdapter<Social> {
  @override
  final int typeId = 10;

  @override
  Social read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Social(
      instagramUsername: fields[1] as String?,
      portfolioUrl: fields[2] as String?,
      twitterUsername: fields[3] as String?,
      paypalEmail: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Social obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.instagramUsername)
      ..writeByte(2)
      ..write(obj.portfolioUrl)
      ..writeByte(3)
      ..write(obj.twitterUsername)
      ..writeByte(4)
      ..write(obj.paypalEmail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
