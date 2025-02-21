import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData(String productName) async {
  final response = await http.get(Uri.parse(
      'https://api.edamam.com/api/food-database/v2/parser?ingr=$productName&app_id=f379f4c9&app_key=f23d08e45a25b8a8834a2be3d2b046f5'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['hints'] != null && data['hints'].isNotEmpty) {
      // إرجاع المعلومات عن الطعام المحدد
      return data['hints'][0]['food'];
    }
    throw Exception('No data found for $productName');
  } else {
    throw Exception('Failed to load data');
  }
}
