import 'package:test/test.dart';

import 'package:dart_base_64_encoder_decoder/base_64_encoder_decoder.dart';

void main() {
  group('base64 encode and decoder test =>', () {
    test('encode should correctly encode a string.', () {
      const String input = 'Hello, world!';
      const String expectedOutput = 'SGVsbG8sIHdvcmxkIQ==';

      expect(Base64.encode(input), equals(expectedOutput));
    });

    test('decode should correctly decode an encoded string.', () {
      const String input = 'SGVsbG8sIHdvcmxkIQ==';
      const String expectedOutput = 'Hello, world!';

      expect(Base64.decode(input), equals(expectedOutput));
    });

    test('encode and decode should be inverse operations.', () {
      const String input =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';
      final String encoded = Base64.encode(input);
      final String decoded = Base64.decode(encoded);

      expect(decoded, equals(input));
    });
  });
}
