import 'package:ecom/rest_posts/rest_test.dart';
import 'package:http/http.dart' as http;

class FetchData {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if(response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return null;

  }
}