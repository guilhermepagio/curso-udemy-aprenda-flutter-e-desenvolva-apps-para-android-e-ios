import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationUtil {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    final String googleApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$googleApiKey';
  }

  static Future<String> getLocationAddress({required LatLng position}) async {
    final String googleApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApiKey';

    final response = await http.get(Uri.parse(url));

    return jsonDecode(response.body)['results'][0]['formatted_address'];
  }
}
