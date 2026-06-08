part of 'index.dart';

class NaccolRepo {
  static const String _naccolPath = '/naccol';

  Future<List<NaccolModel>> getNaccolData() async {
    try {
      Dio dio = await HttpsConfig().getDio(
        visitorId: null,
        queries: {},
      );

      final fullUrl = HttpsConfig.getFullUrl(_naccolPath);
      print('LOGAPP REPO: NACCOL - API CALL: GET $fullUrl');
      
      Response response = await dio.get(_naccolPath);
      print('LOGAPP REPO: NACCOL - API Response received - Status: ${response.statusCode}');
      
      List<NaccolModel> naccolData = List<NaccolModel>.from(
        response.data['data']['data'].map(
          (e) => NaccolModel.fromJson(e),
        ),
      );

      print('LOGAPP REPO: NACCOL - Total items dari API: ${naccolData.length}');
      
      // Sort by sequence
      naccolData.sort((a, b) => a.sequence.compareTo(b.sequence));

      print('LOGAPP REPO: NACCOL - Returning ${naccolData.length} items');
      return naccolData;
    } on HttpException catch (e) {
      print('LOGAPP REPO: NACCOL - HttpException: $e');
      log(e.toString());
      rethrow;
    } catch (e, st) {
      print('LOGAPP REPO: NACCOL - Error getting data: $e');
      log('Error getting NACCOL data $e');
      throw HttpException(message: e.toString(), data: st);
    }
  }
}

