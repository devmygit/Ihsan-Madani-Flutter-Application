part of 'index.dart';

class InitiativeRepo {
  Future<Pagination<InitiativeModel>> getIndexInitiative({
    required String cluster,
    String search = '',
    int page = 0,
  }) async {
    try {
      // Use new endpoint format: /clusters/{shortName}
      final endpoint = '/clusters/$cluster';
      final queryParams = {
        'search': search,
        'page': page,
        'per_page': 20,
      };
      
      print('LOGAPP REPO: Initiative - page parameter value: $page');
      
      Dio dio = await HttpsConfig().getDio(
        visitorId: Visitor.visitorId,
        queries: queryParams,
      );

      final fullUrl = HttpsConfig.getFullUrl(endpoint, queryParams: queryParams);
      print('LOGAPP REPO: API CALL: GET $fullUrl');
      print('LOGAPP REPO: Extracted cluster from endpoint: $cluster');
      
      Response response = await dio.get(endpoint);

      // Map API response to InitiativeModel format
      List<InitiativeModel> inisiatif = List<InitiativeModel>.from(
        response.data['data']['data'].map(
          (item) {
            // Map the new API response structure to InitiativeModel format
            return InitiativeModel.fromJson({
              'id': item['id']?.toString() ?? '',
              'uuid': item['uuid'] ?? item['id']?.toString() ?? '', // Use UUID if available, fallback to id
              'nid': item['nid']?.toString() ?? null, // Map nid from API if available
              'cluster': item['category'] ?? item['button_name'] ?? '',
              'name': item['title'] ?? '',
              'description': item['description'] ?? '',
              'objectives': null,
              'requirements': null,
              'aids': null,
              'faqs': null,
              'url': item['url'] ?? '',
              'alternative_url': null,
              'enforce_date': item['publish_date'] ?? null,
              'is_published': item['is_published'] ?? false,
              'updated_at': item['created_at']?.toString() ?? DateTime.now().millisecondsSinceEpoch.toString(),
              'agencies': null,
              'target_groups': null,
              'application_steps': null,
              'url_button_name': item['button_name'] ?? null,
              'body': null,
              'category_slug': item['category_slug'] ?? null,
              'tab_kumpulan_sasar': null,
              'tab_syarat_permohonan': null,
              'tab_kadar_bantuan': null,
              'tab_faq': null,
              'tab_agensi_pelaksana': null,
            });
          },
        ),
      );

      print('LOGAPP REPO: Total inisiatif dari API: ${inisiatif.length}');
      print('LOGAPP REPO: Inisiatif IDs dari API: ${inisiatif.map((e) => e.id).toList()}');
      print('LOGAPP REPO: Response pagination - total: ${response.data['data']['total']}, per_page: ${response.data['data']['per_page'] ?? 'N/A'}, current_page: ${response.data['data']['current_page'] ?? 'N/A'}, from: ${response.data['data']['from'] ?? 'N/A'}, to: ${response.data['data']['to'] ?? 'N/A'}');

      final Pagination<InitiativeModel> inisiatifData =
          Pagination<InitiativeModel>.fromMap(response.data['data'], inisiatif);
      // log('InitiativeModel getindex data: $inisiatif');

      return inisiatifData;
    } on HttpException catch(e){
      log('Error getting inisiatif $e');
      rethrow;
    }
    catch (e, st) {
      log('Error getting inisiatif $e');
      throw HttpException(message: e.toString(), data: st);
    }
  }

  Future<InitiativeModel> getDetailInitiative({
    required String initiativeId,
  }) async {
    try {
      Dio dio = await HttpsConfig().getDio(
        visitorId: Visitor.visitorId,
        queries: {},
      );

      final endpoint = '/articles/$initiativeId';
      final fullUrl = HttpsConfig.getFullUrl(endpoint);
      print('LOGAPP REPO: API CALL: GET $fullUrl');
      
      Response response = await dio.get(endpoint);

      // Map API response to InitiativeModel format
      final articleData = response.data['data'];
      final InitiativeModel data = InitiativeModel.fromJson({
        'id': articleData['id']?.toString() ?? '',
        'uuid': articleData['uuid'] ?? '',
        'nid': articleData['nid']?.toString() ?? null, // Map nid from API if available
        'cluster': articleData['category'] ?? '',
        'name': articleData['title'] ?? '',
        'description': articleData['description'] ?? '',
        'objectives': articleData['body'] ?? null, // Use body for objectives
        'requirements': null, // Will be parsed from tab_syarat_permohonan
        'aids': null, // Will be parsed from tab_kadar_bantuan
        'faqs': articleData['tab_faq'] ?? null,
        'url': null,
        'alternative_url': null,
        'enforce_date': articleData['publish_date'] ?? null,
        'is_published': articleData['is_published'] ?? false,
        'updated_at': articleData['created_at']?.toString() ?? DateTime.now().millisecondsSinceEpoch.toString(),
        'agencies': null, // Will be parsed from tab_agensi_pelaksana
        'target_groups': null, // Will be parsed from tab_kumpulan_sasar
        'application_steps': null, // Will be parsed from body
        'url_button_name': null,
        // Add new fields for tabs
        'tab_kumpulan_sasar': articleData['tab_kumpulan_sasar'] ?? null,
        'tab_syarat_permohonan': articleData['tab_syarat_permohonan'] ?? null,
        'tab_kadar_bantuan': articleData['tab_kadar_bantuan'] ?? null,
        'tab_faq': articleData['tab_faq'] ?? null,
        'tab_agensi_pelaksana': articleData['tab_agensi_pelaksana'] ?? null,
        'body': articleData['body'] ?? null,
        'category_slug': articleData['category_slug'] ?? null,
        'field_pautan_tambahan': articleData['field_pautan_tambahan'] ?? null,
        'field_pautan_tambahan_label': articleData['field_pautan_tambahan_label'] ?? null,
      });

      // log('InitiativeModel getDetail data: $data');

      return data;
    } on HttpException catch (e) {
      log('Error getting detail inisiatif $e');
      rethrow;
    } 
    catch (e, st) {
      log('Error getting detail inisiatif $e');
      throw HttpException(message: e.toString(), data: st);
    }
  }

  Future<Pagination<InitiativeModel>> searchArticlesByKeyword({
    required String keyword,
  }) async {
    try {
      Dio dio = await HttpsConfig().getDio(
        visitorId: Visitor.visitorId,
        queries: {},
      );

      // Use new search endpoint: /articles/search/{keyword}
      // Keyword is part of the path, not a query parameter
      final encodedKeyword = Uri.encodeComponent(keyword);
      final endpoint = '/articles/search/$encodedKeyword';
      final fullUrl = HttpsConfig.getFullUrl(endpoint);
      print('LOGAPP REPO: API CALL: GET $fullUrl');
      print('LOGAPP REPO: Search keyword: $keyword');
      
      Response response = await dio.get(endpoint);

      // Map API response to InitiativeModel format
      final responseData = response.data['data'];
      List<InitiativeModel> inisiatif = List<InitiativeModel>.from(
        responseData['data'].map(
          (item) {
            // Map the search API response structure to InitiativeModel format
            return InitiativeModel.fromJson({
              'id': item['id']?.toString() ?? '',
              'uuid': item['uuid'] ?? item['id']?.toString() ?? '',
              'nid': item['nid']?.toString() ?? null, // Map nid from API if available
              'cluster': item['category'] ?? '',
              'name': item['title'] ?? '',
              'description': item['description'] ?? '',
              'objectives': null,
              'requirements': null,
              'aids': null,
              'faqs': item['tab_faq'] ?? null,
              'url': null,
              'alternative_url': null,
              'enforce_date': item['publish_date'] ?? null,
              'is_published': item['is_published'] ?? false,
              'updated_at': item['created_at']?.toString() ?? DateTime.now().millisecondsSinceEpoch.toString(),
              'agencies': null,
              'target_groups': null,
              'application_steps': null,
              'url_button_name': null,
              'body': item['body'] ?? null,
              'category_slug': item['category_slug'] ?? null,
              'tab_kumpulan_sasar': item['tab_kumpulan_sasar'] ?? null,
              'tab_syarat_permohonan': item['tab_syarat_permohonan'] ?? null,
              'tab_kadar_bantuan': item['tab_kadar_bantuan'] ?? null,
              'tab_faq': item['tab_faq'] ?? null,
              'tab_agensi_pelaksana': item['tab_agensi_pelaksana'] ?? null,
            });
          },
        ),
      );

      print('LOGAPP REPO: Total articles dari search API: ${inisiatif.length}');
      print('LOGAPP REPO: Search keyword: ${responseData['keyword']}');
      print('LOGAPP REPO: Total: ${responseData['total']}');

      // Create pagination object from search response
      // Search API doesn't have pagination, so we create a simple pagination object
      final Pagination<InitiativeModel> inisiatifData = Pagination<InitiativeModel>(
        path: '',
        firstPageUrl: '',
        lastPageUrl: '',
        currentPage: 1,
        from: 1,
        to: inisiatif.length,
        lastPage: 1,
        perPage: inisiatif.length,
        total: responseData['total'] ?? inisiatif.length,
        data: inisiatif,
      );

      return inisiatifData;
    } on HttpException catch(e){
      log('Error searching articles $e');
      rethrow;
    }
    catch (e, st) {
      log('Error searching articles $e');
      throw HttpException(message: e.toString(), data: st);
    }
  }

  /// Resolve article ID for `/articles/{id}` when source data has no nid/uuid
  /// (e.g. `/popular-searches` returns sequence ids that return HTTP 409).
  Future<String> resolveDetailArticleId(InitiativeModel initiative) async {
    try {
      if (initiative.nid != null && initiative.nid!.isNotEmpty) {
        return initiative.nid!;
      }

      final normalizedTitle = initiative.name.trim().toLowerCase();
      final cluster = _resolveClusterShortName(initiative);

      if (cluster.isNotEmpty) {
        final clusterResults = await getIndexInitiative(
          cluster: cluster,
          search: initiative.name,
          page: 0,
        );

        for (final item in clusterResults.data) {
          if (item.name.trim().toLowerCase() == normalizedTitle) {
            if (item.nid != null && item.nid!.isNotEmpty) {
              print('LOGAPP REPO: Resolved detail id via cluster/$cluster nid=${item.nid}');
              return item.nid!;
            }
            if (item.id.isNotEmpty) {
              print('LOGAPP REPO: Resolved detail id via cluster/$cluster id=${item.id}');
              return item.id;
            }
          }
        }
      }

      final searchResults =
          await searchArticlesByKeyword(keyword: initiative.name);

      for (final item in searchResults.data) {
        if (item.name.trim().toLowerCase() == normalizedTitle) {
          print('LOGAPP REPO: Resolved detail id via search id=${item.detailArticleId}');
          return item.detailArticleId;
        }
      }

      throw HttpException(
        message: 'Article not found for title: ${initiative.name}',
      );
    } on HttpException catch (e) {
      log('Error resolving detail article id $e');
      rethrow;
    } catch (e, st) {
      log('Error resolving detail article id $e');
      throw HttpException(message: e.toString(), data: st);
    }
  }

  String _resolveClusterShortName(InitiativeModel initiative) {
    try {
      final url = initiative.url;
      if (url != null && url.isNotEmpty) {
        final uri = Uri.tryParse(url);
        if (uri != null) {
          final segments = uri.pathSegments;
          final index = segments.indexOf('inisiatif');
          if (index >= 0 && index + 1 < segments.length) {
            return segments[index + 1].toLowerCase();
          }
        }
      }

      final category = (initiative.urlButtonName ?? initiative.cluster).trim();
      if (category.isNotEmpty) {
        return category.toLowerCase();
      }
    } catch (e) {
      log('Error resolving cluster short name $e');
    }
    return '';
  }
}
