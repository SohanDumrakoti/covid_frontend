import 'package:coronatracker/constant.dart';
import 'package:coronatracker/data/auth.dart';
import 'package:coronatracker/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("user test", () {
    Auth auth = Auth();
    test('login user', () async {
      final client = MockClient();
      when(client
          .get(Uri.parse(Constants.baseUrl + 'login'))
          .then((value) async => http.Response('{}', 200)));
      expect(
          await auth.login(UserModel(
            email: 'hari@test.com',
            password: 'password',
          )),
          isA<UserModel>());
    });
  });
}
