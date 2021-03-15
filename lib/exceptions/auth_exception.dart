class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': ' E-mail ja em uso!',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida, tente mais tarde!',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Muitas tentativas tente mais tarde!',
    'EMAIL_NOT_FOUND': 'E-mail não existe!',
    'INVALID_PASSWORD': 'Senha inválida!',
    'USER_DISABLED': 'Usuario desabilitado!',
  };
  final String key;

  AuthException(this.key);
  @override
  String toString() {
    if (errors.containsKey(key)) {
      return errors[key];
    } else {
      return 'Error na atenticação';
    }
  }
}
