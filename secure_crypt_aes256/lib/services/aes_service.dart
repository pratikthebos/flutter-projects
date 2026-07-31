import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class AESService {
  AESService._();

  static final AESService instance = AESService._();

  static const String _password = "SecureCrypt@2026";

  /// Generate 256-bit AES Key
  Key _generateKey() {
    final hash = sha256.convert(utf8.encode(_password));
    return Key(Uint8List.fromList(hash.bytes));
  }

  /// Encrypt Plain Text
  String encryptText(String plainText) {
    final key = _generateKey();

    final iv = IV.fromSecureRandom(16);

    final encrypter = Encrypter(
      AES(
        key,
        mode: AESMode.cbc,
        padding: 'PKCS7',
      ),
    );

    final encrypted = encrypter.encrypt(
      plainText,
      iv: iv,
    );

    // Save IV + Cipher Text
    final combined =
        "${iv.base64}:${encrypted.base64}";

    // Return Base64 String
    return base64Encode(
      utf8.encode(combined),
    );
  }

  /// Decrypt Cipher Text
  String decryptText(String cipherText) {
    final decoded = utf8.decode(
      base64Decode(cipherText),
    );

    final parts = decoded.split(":");

    if (parts.length != 2) {
      throw Exception("Invalid Cipher Text");
    }

    final iv = IV.fromBase64(parts[0]);

    final encrypted = Encrypted.fromBase64(
      parts[1],
    );

    final encrypter = Encrypter(
      AES(
        _generateKey(),
        mode: AESMode.cbc,
        padding: 'PKCS7',
      ),
    );

    return encrypter.decrypt(
      encrypted,
      iv: iv,
    );
  }
}