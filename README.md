# Base64 Encoding/Decoding in Dart

This is a simple implementation of Base64 encoding and decoding in Dart. The `Base64` class provides two static methods `encode` and `decode` which can be used to encode and decode a string, respectively.

## Usage

### Encoding

```dart
final String encoded = Base64.encode('Hello, world!');
print(encoded); // SGVsbG8sIHdvcmxkIQ==
```

### Decoding

```dart
final String decoded = Base64.decode('SGVsbG8sIHdvcmxkIQ==');
print(decoded); // Hello, world!
```
