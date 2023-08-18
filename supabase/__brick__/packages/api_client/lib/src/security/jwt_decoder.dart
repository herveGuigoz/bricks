import 'dart:convert';

final class JwtDecoder {
  /// Decode a string JWT token into a `Map<String, dynamic>`
  static Map<String, dynamic> decode(String token) {
    final splitToken = token.split('.');

    if (splitToken case [final String header, final String payload, final String signature]) {
      if (header.isEmpty || payload.isEmpty || signature.isEmpty) {
        throw const FormatException('Invalid token');
      }

      try {
        // Base64 should be multiple of 4. Normalize the payload before decode it
        final normalizedPayload = base64.normalize(payload);
        // Decode payload, the result is a String
        final payloadString = utf8.decode(base64.decode(normalizedPayload));
        // Parse the String to a Map<String, dynamic>
        final decodedPayload = jsonDecode(payloadString);

        return decodedPayload as Map<String, dynamic>;
      } catch (error) {
        throw const FormatException('Invalid payload');
      }
    }

    throw const FormatException('Invalid token');
  }

  /// Returns token expiration date
  static DateTime getExpirationDate(String token) {
    final decodedToken = decode(token);
    final exp = decodedToken['exp'];

    if (exp == null || exp is! num) {
      throw const FormatException('Invalid token');
    }

    final date = DateTime.fromMillisecondsSinceEpoch(0);
    final expirationDate = date.add(Duration(seconds: exp.toInt()));

    return expirationDate;
  }

  static bool isExpired(String token) {
    final expirationDate = getExpirationDate(token);
    // If the current date is after the expiration date, the token is already expired
    return DateTime.now().isAfter(expirationDate);
  }
}
