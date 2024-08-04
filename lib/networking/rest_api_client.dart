import 'dart:io';
import 'package:joistic_test/networking/apis.dart';
import 'package:joistic_test/networking/app_interceptor.dart';
import 'package:joistic_test/networking/models/company_list_response/company_list_response.dart';
import 'package:joistic_test/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'rest_api_client.g.dart';

@RestApi(baseUrl: "${Constants.BASE_URL}")
abstract class RestApiClient {

  factory RestApiClient() {
    Dio dio = Dio(BaseOptions(contentType: "application/json"));
    dio.options = BaseOptions(
        headers: {},
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60));
    dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return _RestApiClient(dio);
  }





  @GET(Apis.companyList)
  Future<List<CompanyListResponse>> getCompanyList();


}