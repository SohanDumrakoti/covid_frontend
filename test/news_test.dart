import 'package:coronatracker/constant.dart';
import 'package:coronatracker/data/news.dart';
import 'package:coronatracker/models/news_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'news_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("news test", () {
    NewsResponse response = NewsResponse();
    test('return list of news', () async {
      final client = MockClient();
      when(client
          .get(Uri.parse(Constants.baseUrl + 'news/'))
          .then((value) async => http.Response('[]', 200)));
      expect(await response.fetchNews(), isA<List<News>>());
    });
  });
}
