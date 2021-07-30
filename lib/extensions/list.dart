extension ListExtension<T> on List<T> {
  /// Edit all elements of a list.
  /// ```
  /// List<String> users = ['renan', 'kanu'];
  /// users.replaceAll( (user) => user.toUpperCase());
  /// print(users); // ['RENAN', 'KANU'];
  /// ```
  ///
  List<T> replaceAll(T Function(T element) function) {
    for (var i = 0; i < length; i++) {
      this[i] = function(this[i]);
    }
    return this;
  }
}
