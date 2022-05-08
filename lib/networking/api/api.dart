import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:graduate_work/models/about_company_info.dart';
import 'package:graduate_work/models/card.dart';
import 'package:graduate_work/models/menu_item.dart';
import 'package:graduate_work/models/promotion_item.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "http://localhost:8000/api/v1/")
abstract class RestClient {
  static RestClient? _shared;
  static RestClient get shared => _shared!;

  static Future<void> setShared() async {
    final jsonConfig = await rootBundle.loadString("assets/config.json");
    final mapConfig = json.decode(jsonConfig);
    final dio = Dio(
      BaseOptions(
        baseUrl: mapConfig['baseUrl'] as String,
        headers: {
          'Project-Id': mapConfig['projectId'] as String,
          'Secret-Key': mapConfig['secretKey'] as String,
        },
      ),
    );
    _shared = RestClient(dio);
  }

  // Generated
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // Requests
  @GET('/menu_items/')
  Future<List<MenuItem>> fetchMenuItems();

  @GET('/promotions/')
  Future<List<PromotionItem>> fetchPromotions();

  @GET('/food_projects/')
  Future<AboutCompanyInfo> fetchAboutCompanyInfo();

  @POST('/card/order/')
  Future<void> postCardOrder(
    @Body() CardOrderModel cardOrderModel,
  );
}
