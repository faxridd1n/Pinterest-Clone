import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pinterest_clone/core/dio.dart';
import 'package:pinterest_clone/models/photos_model.dart';
import 'package:pinterest_clone/utils/log_service/log_service.dart';

import '../core/api.dart';
import '../models/SearchModel.dart';
import '../models/allAlbum.model.dart';

class PhotoService {
  static Future<Either<String, List<AllPhotoModel>>> getPhotos() async {
    try {
      Response response = await Dio().get(Endpoints.getPhotos,
          options: Options(headers: {
            'x-api-key': Endpoints.apiKey,
            'Authorization': 'Bearer ${Endpoints.token}'
          }));
      Log.w(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<AllPhotoModel> photos = [];
        for (var e in (response.data as List)) {
          photos.add(AllPhotoModel.fromJson(e));
        }
        return right(photos);
      } else {
        Log.e(DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if (DioExceptions.fromDioError(e).toString() == 'Unauthorized') {
        return left('Token xato');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e(m.toString());
      return left(m.toString());
    }
  }



 static  Future<Either<String,List<Result>>> searchPhotos(
      {String? search, int? page}) async{
    try{
      Response response = await Dio().get(
          '${Endpoints.searchPhotos}?query=$search&page=$page&per_page=50&order_by=ASC',
          options: Options(headers: {
            'x-api-key': Endpoints.apiKey,
            'Authorization': 'Bearer ${Endpoints.token}'
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        List<Result> photos = [];
        for (var e in (response.data['results'] as List)) {
          photos.add(Result.fromJson(e));
        }
        return right(photos);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }
}
