import 'dart:developer';
import 'package:http/http.dart' as http;

Future<void> getStates() async {
  Uri url = Uri.parse("https://opentdb.com/api.php?amount=10");

  var response = await http.get(url);
  if (response.statusCode == 200) {
    log('api worked ${response.body}');
    var body = response.body;
  } else {
    log('api request failed ${response.body}');

    return null;
  }
}
