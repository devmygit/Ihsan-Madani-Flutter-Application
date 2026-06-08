part of 'index.dart';

class FaqRepo {
  static const String _faqsPath = '/faqs';

  Future<Pagination<FaqModel>> getFaqs({
    int page = 0,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'per_page': 10,
      };
      
      print('LOGAPP REPO: FAQ - page parameter value: $page');
      
      Dio dio = await HttpsConfig().getDio(
        visitorId: null,
        queries: queryParams,
      );

      final fullUrl = HttpsConfig.getFullUrl(_faqsPath, queryParams: queryParams);
      print('LOGAPP REPO: API CALL: GET $fullUrl');
      
      Response response = await dio.get(_faqsPath);
      
      List<FaqModel> faqs = List<FaqModel>.from(
        response.data['data']['data'].map(
          (e) => FaqModel.fromJson(e),
        ),
      );

      print('LOGAPP REPO: Total FAQs dari API: ${faqs.length}');
      
      final Pagination<FaqModel> faqData =
          Pagination<FaqModel>.fromMap(response.data['data'], faqs);

      return faqData;
    } on HttpException catch (e) {
      log(e.toString());
      rethrow;
    } catch (e, st) {
      log('Error getting FAQs $e');
      throw HttpException(message: e.toString(), data: st);
    }
  }
}

