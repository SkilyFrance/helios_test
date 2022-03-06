import 'package:dio/dio.dart' as dio;
import 'package:helios_test/model/ramdom_user_model.dart';

class RamdomUserApi {
  //
  ///
  static int itemNumbers = 20;
  static String endpoint = 'https://randomuser.me/api/?results=$itemNumbers';
  //
  ///Method allows us to get list of random users
  Future<List<RamdomUser>> getListOfRamdomUsers() async {
    final List<RamdomUser> users = <RamdomUser>[];
    try {
      //
      // Get request
      final dio.Response<dynamic> response = await dio.Dio().get(endpoint,
          options: dio.Options(responseType: dio.ResponseType.json));
      //
      //
      for (final dynamic data in response.data['results']) {
        users.add(RamdomUser.fromMap(data));
      }
    } on dio.DioError catch (error) {
      Future<dynamic>.error(error);
    }
    return users;
  }
}
