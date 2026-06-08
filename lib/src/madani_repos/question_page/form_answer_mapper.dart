import 'dart:developer';

import 'package:madani/src/index.dart';

/// Helper to build query string for initiative review/details
/// using current `QuestionsState` answers.
class FormAnswerMapper {
  static String buildQueryString(QuestionsState state) {
    try {
      final params = <String, String>{};

      // Pastikan panjang answers & checkBoxAnswer selari dengan soalan
      final totalQuestions = state.question.data.length;

      for (var i = 0; i < totalQuestions; i++) {
        if (i >= state.checkBoxAnswer.length) {
          continue;
        }

        final answerModel = state.checkBoxAnswer[i];
        final criteriaId = answerModel.id;

        if (criteriaId.isEmpty) {
          continue;
        }

        // Jika tiada jawapan, skip
        if (answerModel.answer.isEmpty) {
          continue;
        }

        // API expect value terus (tanpa mapping lain), jadi join jika lebih dari satu
        final value = answerModel.answer.join(',');

        if (value.isEmpty) {
          continue;
        }

        params[criteriaId] = value;
      }

      final uri = Uri(queryParameters: params);
      final query = uri.query;

      log('LOGAPP FORM_ANSWER_MAPPER: Built query string: $query');

      return query;
    } catch (e, st) {
      log(
        'LOGAPP FORM_ANSWER_MAPPER: Error building query string: $e\n$st',
        error: e,
        stackTrace: st,
      );
      return '';
    }
  }
}


