class Endpoints {
  static String baseUrl = 'https://api.unsplash.com/';

  static String token = 'Client-ID klMeLuvFR1zMevDjTISl4Z4bxrpxq1RbmeL1xMtxIx8';
  static String apiKey = '17d94b92-754f-46eb-99a0-65be65b5d18f';

  static String getPhotos = '${baseUrl}photos?page=1&per_page=40&order_by=ASC';

  static String getCarAlbum = '${baseUrl}collections/3326482/photos';
  static String getLifeStyleAlbum = '${baseUrl}collections/8788025/photos';
  static String getNightAlbum = '${baseUrl}collections/8240068/photos';
  static String getUserInfo = '${baseUrl}users/faxridd1n';
  static String searchPhotos = '${baseUrl}search/photos';
}
