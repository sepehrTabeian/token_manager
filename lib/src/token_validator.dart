abstract interface class ITokenValidator {

  Future<bool> validate(String? accessToken);
}

class TokenValidator implements ITokenValidator {
  @override
  Future<bool> validate(String? accessToken) {
    if(accessToken == null) {
      return Future.value(false);
    }

    if(accessToken.isEmpty) {
      return Future.value(false);
    }

    return Future.value(true);
  }


}