typedef LogoutCallback = void Function();

class AuthManager {
  static LogoutCallback? onLogout;
}
