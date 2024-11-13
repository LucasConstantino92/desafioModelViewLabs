String? validatePassword(String password) {
  const minLength = 8;
  final hasUppercase = RegExp(r'[A-Z]');
  final hasLowercase = RegExp(r'[a-z]');
  final hasNumber = RegExp(r'[0-9]');
  final hasSpecialCharacter = RegExp(r'[!@#\$&*~-]');

  if (password.length < minLength) {
    return 'A senha deve ter pelo menos $minLength caracteres.';
  } else if (!hasUppercase.hasMatch(password)) {
    return 'A senha deve conter pelo menos uma letra maiúscula.';
  } else if (!hasLowercase.hasMatch(password)) {
    return 'A senha deve conter pelo menos uma letra minúscula.';
  } else if (!hasNumber.hasMatch(password)) {
    return 'A senha deve conter pelo menos um número.';
  } else if (!hasSpecialCharacter.hasMatch(password)) {
    return 'A senha deve conter pelo menos um caractere especial.';
  }

  return null; // Senha válida
}
