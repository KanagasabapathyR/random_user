import '../model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepository {
  Future getAll() async {
    var data =
        await http.get(Uri.parse('https://randomuser.me/api/?results=50'));
    var jsonData = json.decode(data.body);
    List<User> users = [];
    var results = jsonData["results"];
    for (var item in results) {
      User user = User(
          item["name"]["first"],
          item["name"]["last"],
          item["email"], item["phone"],
          item["picture"]['large'],
          item['gender'],
          item['dob']['age'],
          item['cell'],
          item['nat'],
          '${item['location']['street']['number']} ' +
              item['location']['street']['name'] +", "+
              item['location']['city']+", " +
              item['location']['state'] + ", " +
              item['location']['country'],
          false,

      );
      users.add(user);
    }
    return users;
  }
}
