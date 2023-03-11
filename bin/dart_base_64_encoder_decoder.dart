import 'package:dart_base_64_encoder_decoder/base_64_encoder_decoder.dart';

void main(List<String> arguments) {
  const String input = 'Hello, world!';

  final String encoded = Base64.encode(input);
  final String decoded = Base64.decode(encoded);

  print('Input: $input');
  print('Encoded: $encoded');
  print('Decoded: $decoded');
}
