import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginRepository {
  Future<List<dynamic>> login(String email, String password) async {
    try {
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('$email:$password'))}';
      final url = Uri.parse(
          'http://milkfed.demoalight.com/api/FarmerAPI/GetValidateUser?FarmerCode=F01&MobileNo=7490000624');
      final jsonData =
          await http.get(url, headers: {'authorization': basicAuth});
      final response = jsonDecode(jsonData.body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
