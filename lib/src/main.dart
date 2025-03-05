import 'package:flutter/material.dart';

import 'token.dart';
import 'token_manager.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authProvider = TokenManager();
const String tokenValue = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IkMwNUMzOTQyRDg4MUFBOTVDNjREQTI0NTgxRThB';
// await authProvider.saveToken(token);
  final Token? token = await authProvider.readToken();
final isLoggedIn = await authProvider.isTokenStored();
debugPrint("is LoggedIn $isLoggedIn ${token!.expirationTime.toString()}");
}

