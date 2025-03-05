import 'package:token_manager/secure_storage_service.dart';
import 'package:token_manager/storage_service.dart';
import 'package:token_manager/token.dart';
import 'package:token_manager/token_validator.dart';

import 'constant.dart';

class TokenManager {
  late IStorageService _storageService;
  late ITokenValidator _tokenValidator;

  TokenManager(){
    _storageService = SecureStorageService();
    _tokenValidator = TokenValidator();
  }

  Future<bool> isTokenStored() async {
    String? token = await _storageService.read(Constants.accessToken);
    return _tokenValidator.validate(token);
  }

  Future<void> saveToken(Token token) async {
    await _saveToken(token);
  }

  Future<void> clearStorage() async {
    await _storageService.clear();
  }

  Future<Token?> readToken() async {
    return await _readToken();
  }

  Future<void> _saveToken(Token token) async {
    await _storageService.write(Constants.accessToken, token.accessToken);
    await _storageService.write(Constants.refreshToken, token.refreshToken);
    await _storageService.write(
        Constants.expirationTime, token.expirationTime.toString());
  }

  Future<Token?> _readToken() async {
    final accessToken = await _storageService.read(Constants.accessToken);
    final refreshToken = await _storageService.read(Constants.refreshToken);
    final expirationTime = await _storageService.read(Constants.expirationTime);
    if (accessToken == null || refreshToken == null || expirationTime == null) return null;

    return Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expirationTime: int.parse(expirationTime),
    );
  }
}
