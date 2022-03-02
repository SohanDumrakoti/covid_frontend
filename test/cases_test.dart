import 'package:coronatracker/constant.dart';
import 'package:coronatracker/data/cases.dart';
import 'package:coronatracker/models/cases_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'news_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("cases test", () {
    CasesResponse response = CasesResponse();
    test('return case', () async {
      final client = MockClient();
      when(client
          .get(Uri.parse(Constants.baseUrl + 'cases'))
          .then((value) async => http.Response('{}', 200)));
      expect(await response.fetchCases(), isA<Cases>());
    });
  });
}
