class Base64 {
  static const String _base64Chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';

  static String encode(String input) {
    final List<int> bytes = input.codeUnits;
    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < bytes.length; i += 3) {
      // Combine up to 3 bytes into a single 24-bit integer.
      final int combined = (bytes[i] << 16) +
          ((i + 1 < bytes.length ? bytes[i + 1] : 0) << 8) +
          (i + 2 < bytes.length ? bytes[i + 2] : 0);

      // Encode the 24-bit integer as 4 Base64 characters.
      buffer.write(_base64Chars[(combined >> 18) & 0x3F]);
      buffer.write(_base64Chars[(combined >> 12) & 0x3F]);
      buffer.write(
        i + 1 < bytes.length ? _base64Chars[(combined >> 6) & 0x3F] : '=',
      );
      buffer.write(i + 2 < bytes.length ? _base64Chars[combined & 0x3F] : '=');
    }

    return buffer.toString();
  }

  static String decode(String input) {
    final List<int> bytes = <int>[];
    final int paddingCount = input.endsWith('==')
        ? 2
        : input.endsWith('=')
            ? 1
            : 0;

    int num = 0;
    int bits = 0;

    for (int i = 0; i < input.length; i++) {
      final int value = _base64Chars.indexOf(input[i]);

      if (value >= 0) {
        // Shift in the 6 bits of the current Base64 character.
        num = (num << 6) + value;
        bits += 6;

        // If we have accumulated enough bits to form a byte, add it to the output.
        if (bits >= 8) {
          bits -= 8;
          bytes.add((num >> bits) & 0xFF);
        }
      }
    }

    // Remove padding bytes, if any.
    if (paddingCount > 0 && bytes.isNotEmpty) {
      bytes.removeRange(bytes.length - paddingCount, bytes.length);
    }

    return String.fromCharCodes(bytes);
  }
}
