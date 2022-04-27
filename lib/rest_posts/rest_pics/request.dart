import 'package:ecom/rest_posts/rest_pics/parser.dart';

import 'package:http/http.dart' as http;

class Request {
  Future<List<Users>?> getUsers() async {
    var client = http.Client();
    var uri = Uri.parse('https://fakerestapi.azurewebsites.net/api/v1/Users');
    var response = await client.get(uri);
    if(response.statusCode == 200) {
      var json = response.body;
      return usersFromJson(json);
    }
    return null;

  }
}