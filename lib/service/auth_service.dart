import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthService {
  Future<String> login(String email, String password) async {
    return Future.delayed(const Duration(milliseconds: 5000))
        .then((onValue) => 'authToken');
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
