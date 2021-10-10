
class AuthException implements Exception {
  static const Map<String, String> erros = {
    'EMAIL_EXISTS': 'E-mail já está sendo utilizado!',
    'OPERATION_NOT_ALLOWED': 'Não permito!',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Acesso está bloquado temporariamente!',
    'EMAIL_NOT_FOUND': 'Não foi encontrado seu email!',
    'INVALID_PASSWORD': 'A senha infomada não confere!',
    'USER_DISABLED': 'A conta do usuario foi desabilitada!',
      };

  final String key;

  AuthException(this.key);

  @override 
  String toString(){
    return erros[key] ?? 'Ocorreu um erro! entre em contato com o desenvolvedor!';
  }
}