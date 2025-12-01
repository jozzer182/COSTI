bool validarEmailEnel(String email) {
  // Expresión regular para validar si termina con @enel.com, sin importar mayúsculas o minúsculas
  final regex = RegExp(r'@enel\.com$', caseSensitive: false);
  return regex.hasMatch(email);
}


bool validarEmailEnelEmpty(String email) {
  // Expresión regular para validar si termina con @enel.com, sin importar mayúsculas o minúsculas
  final regex = RegExp(r'@enel\.com$', caseSensitive: false);
  return regex.hasMatch(email) || email.isEmpty;
}