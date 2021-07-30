extension StringExt on String {
  /// Removes all characters.
  /// ```
  /// var bestPackage = 'Mega'.removeAll('X');
  /// print(bestPackage) // Mega;
  /// ```
  String removeAll(String value) {
    var newValue = replaceAll(value, '');
    //this =  newValue;
    return newValue;
  }
}
