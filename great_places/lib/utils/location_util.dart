import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

class LocationUtil {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    final String googleApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$googleApiKey';
  }
}
