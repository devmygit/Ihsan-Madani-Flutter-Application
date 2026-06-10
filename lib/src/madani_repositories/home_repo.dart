part of 'index.dart';

class HomeRepo {
  static const String _bannersPath = '/banners';
  static const String _popularSearchesPath = '/popular-searches';
  static const String _infographicsPath = '/infographics';

  Future<Pagination<BannerModel>> getBanner({
    int page = 0,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'per_page': 20,
      };
      
      Dio dio = await HttpsConfig().getDio(
        visitorId: null, // Bypass visitor ID
        queries: queryParams,
      );

      final fullUrl = HttpsConfig.getFullUrl(_bannersPath, queryParams: queryParams);
      print('LOGAPP REPO: API CALL: GET $fullUrl');
      
      Response response = await dio.get(_bannersPath);
      
      List<BannerModel> banner = List<BannerModel>.from(
        response.data['data']['data'].map(
          (e) => BannerModel.fromJson(e),
        ),
      );

      print('LOGAPP REPO: Total banner dari API: ${banner.length}');
      print('LOGAPP REPO: Banner IDs dari API: ${banner.map((e) => e.id).toList()}');
      print('LOGAPP REPO: Response pagination - total: ${response.data['data']['total']}, per_page: ${response.data['data']['per_page']}, current_page: ${response.data['data']['current_page']}, from: ${response.data['data']['from']}, to: ${response.data['data']['to']}');
      
      final Pagination<BannerModel> bannerData =
          Pagination<BannerModel>.fromMap(response.data['data'], banner);

      return bannerData;
    } on HttpException catch (e){
      log(e.toString());
      rethrow;
    } catch (e, st) {
      log('Error getting banner $e');
      throw HttpException(message: e.toString(), data: st);
    }
  }

  Future<Pagination<InitiativeModel>> getPopularSearches({
    int page = 0,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'per_page': 20,
      };
      
      Dio dio = await HttpsConfig().getDio(
        visitorId: null, // Bypass visitor ID
        queries: queryParams,
      );

      final fullUrl = HttpsConfig.getFullUrl(_popularSearchesPath, queryParams: queryParams);
      print('LOGAPP REPO: API CALL: GET $fullUrl');
      
      Response response = await dio.get(_popularSearchesPath);

      List<InitiativeModel> popularSearches = List<InitiativeModel>.from(
        response.data['data']['data'].map(
          (e) {
            // Direct mapping from API response - no complex transformations
            return InitiativeModel.fromJson({
              'id': e['id']?.toString() ?? '',
              'uuid': e['uuid'] ?? e['id']?.toString() ?? '',
              'nid': e['nid']?.toString() ?? null,
              'cluster': e['category'] ?? e['button_name'] ?? '',
              'name': e['title'] ?? '',
              'description': e['description'] ?? '',
              'objectives': null,
              'requirements': null,
              'aids': null,
              'faqs': null,
              'url': e['url'] ?? null,
              'alternative_url': null,
              'enforce_date': e['publish_date'] ?? null,
              'is_published': e['is_published'] ?? true,
              'updated_at': e['created_at']?.toString() ?? DateTime.now().millisecondsSinceEpoch.toString(),
              'agencies': null,
              'target_groups': null,
              'application_steps': null,
              'url_button_name': e['button_name'] ?? null,
              'body': e['body'] ?? null,
              'category_slug': e['category_slug'] ?? null,
              'tab_kumpulan_sasar': e['tab_kumpulan_sasar'] ?? null,
              'tab_syarat_permohonan': e['tab_syarat_permohonan'] ?? null,
              'tab_kadar_bantuan': e['tab_kadar_bantuan'] ?? null,
              'tab_faq': e['tab_faq'] ?? null,
              'tab_agensi_pelaksana': e['tab_agensi_pelaksana'] ?? null,
              'sequence': e['sequence'] is int ? e['sequence'] : (e['sequence'] != null ? int.tryParse(e['sequence'].toString()) : null),
            });
          },
        ),
      );

      print('LOGAPP REPO: Total popular searches dari API: ${popularSearches.length}');
      print('LOGAPP REPO: Popular searches IDs dari API: ${popularSearches.map((e) => e.id).toList()}');
      print('LOGAPP REPO: Popular searches sequences dari API: ${popularSearches.map((e) => e.sequence).toList()}');
      print('LOGAPP REPO: Popular searches UUIDs dari API: ${popularSearches.map((e) => e.uuid ?? 'null').toList()}');
      print('LOGAPP REPO: Response pagination - total: ${response.data['data']['total']}, per_page: ${response.data['data']['per_page']}, current_page: ${response.data['data']['current_page']}, from: ${response.data['data']['from']}, to: ${response.data['data']['to']}');
      
      final Pagination<InitiativeModel> popularSearchesData =
          Pagination<InitiativeModel>.fromMap(response.data['data'], popularSearches);

      return popularSearchesData;
    } on HttpException catch (e){
      log(e.toString());
      rethrow;
    } catch (e, st) {
      log('Error getting popular searches $e');
      throw HttpException(message: e.toString(), data: st);
    }
  }

  Future<Pagination<InfographicModel>> getInfographics({
    int page = 0,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'per_page': 20,
      };
      
      Dio dio = await HttpsConfig().getDio(
        visitorId: null, // Bypass visitor ID
        queries: queryParams,
      );

      final fullUrl = HttpsConfig.getFullUrl(_infographicsPath, queryParams: queryParams);
      print('LOGAPP REPO: API CALL: GET $fullUrl');
      
      Response response = await dio.get(_infographicsPath);
      
      List<InfographicModel> infographics = List<InfographicModel>.from(
        response.data['data']['data'].map(
          (e) => InfographicModel.fromJson(e),
        ),
      );

      print('LOGAPP REPO: Total infographics dari API: ${infographics.length}');
      print('LOGAPP REPO: Infographic IDs dari API: ${infographics.map((e) => e.id).toList()}');
      print('LOGAPP REPO: Response pagination - total: ${response.data['data']['total']}, per_page: ${response.data['data']['per_page']}, current_page: ${response.data['data']['current_page']}, from: ${response.data['data']['from']}, to: ${response.data['data']['to']}');
      
      final Pagination<InfographicModel> infographicsData =
          Pagination<InfographicModel>.fromMap(response.data['data'], infographics);

      return infographicsData;
    } on HttpException catch (e){
      log(e.toString());
      rethrow;
    } catch (e, st) {
      log('Error getting infographics $e');
      throw HttpException(message: e.toString(), data: st);
    }
  }
}
