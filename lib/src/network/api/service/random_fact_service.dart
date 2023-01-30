import 'package:dio/dio.dart';
import '../../../data/random_fact.dart';
import '../../common/api_response.dart';
import '../../common/common_config.dart' as config;

class RandomFactService {
  final Dio _dio = Dio();

  Future<ApiResponse<RandomFact>> fetchRandomFact() async {
    try {
      Response factResponse = await _dio.get(config.randomFactBaseUrl);
      return ApiResponse(
          success: true, data: RandomFact.fromJson(factResponse.data));
    } catch (error, stacktrace) {
      //ignore print in production
      print("RandomFactService - fetchRandomFact - stacktrace:\n $stacktrace");
      print("RandomFactService - fetchRandomFact - error:\n $error");
      return ApiResponse(
          success: false, error: config.commonErrorMessage);
    }
  }
}
