import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pinterest_clone/core/dio.dart';
import 'package:pinterest_clone/models/photos_model.dart';
import 'package:pinterest_clone/utils/log_service/log_service.dart';

import '../core/api.dart';
import '../models/userInfo_model.dart';

class UserInfoService {
  static Future<Either<String, UserInfoModel>> getPhotos() async {
    try {
      Response response = await Dio().get(Endpoints.getUserInfo,
          options: Options(headers: {
            'x-api-key': Endpoints.apiKey,
            'Authorization': 'Bearer ${Endpoints.token}'
          }));
      Log.w(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        UserInfoModel info ;
          info=(UserInfoModel.fromJson(response.data));
        
        return right(info);
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
