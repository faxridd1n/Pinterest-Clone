import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pinterest_clone/core/dio.dart';
import 'package:pinterest_clone/utils/log_service/log_service.dart';

import '../core/api.dart';
import '../models/allAlbum.model.dart';

class NightAlbumService {
  static Future<Either<String, List<AllPhotoModel>>> getNightAlbum() async {
    try {
      Response response = await Dio().get(Endpoints.getNightAlbum,
          options: Options(headers: {
            'x-api-key': Endpoints.apiKey,
            'Authorization': 'Bearer ${Endpoints.token}'
          }));
      Log.w(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<AllPhotoModel> nightAlbumphotos = [];
        for (var e in (response.data as List)) {
          nightAlbumphotos.add(AllPhotoModel.fromJson(e));
        }
        return right(nightAlbumphotos);
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
}
