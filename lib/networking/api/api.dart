import 'package:dio/dio.dart';
import 'package:graduate_work/models/menu_item.dart';
import 'package:graduate_work/models/promotion_item.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "http://localhost:8000/api/v1/")
abstract class RestClient {
  // Singleton
  static final shared = () {
    final dio = Dio(BaseOptions(headers: _headers));
    return RestClient(dio);
  }();

  static const _headers = {
    'Project-Id': '45cac181-7198-46f4-a3c9-e676275f66b2',
  };

  // Generated
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // Requests
  @GET('/menu_items/')
  Future<List<MenuItem>> fetchMenuItems();

  @GET('/promotions/')
  Future<List<PromotionItem>> fetchPromotions();
}
