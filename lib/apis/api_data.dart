import 'package:http/http.dart';
import 'package:movieapp/models/model.dart';

class ApiData {
  static Future<UserModel> getData() async {
    var request = Request(
        'GET',
        Uri.parse(
            'https://api.themoviedb.org/3/movie/top_rated?api_key=f86bdbb9dd3366766e19da7513699000'));

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      UserModel encodedData = userModelFromJson(body);

      print(body);
      return encodedData;
    } else {
      print(response.reasonPhrase);
      return Future.value(UserModel());
    }
  }
}
