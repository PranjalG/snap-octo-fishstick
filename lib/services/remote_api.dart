import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data_models/api_result_data_model.dart';

class RemoteApi {
  static Future<ApiResultData?> getDataList(int page, int limit) async {
    try {
      // Construct the API URL with the page parameter
      final uri = Uri.parse(
          'https://openlibrary.org/search.json?q=the+lord+of+the+rings&page=2&limit=10');

      // Perform the GET request
      final response = await http.get(uri);
      // print("got response here:$response");
      // Check if the response was successful
      if (response.statusCode == 200) {
        // print("got response here in 200:$response");
        // Decode the response body
        final mybody = jsonDecode(response.body);
        // print("got mybody here in 200:$mybody");
        // Parse the JSON into an ApiResultData object
        ApiResultData? resultData = ApiResultData.fromJson(mybody);

        // print("got data here in api::$resultData");
        return resultData;
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }
}
