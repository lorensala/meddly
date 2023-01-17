extension StringX on String {
  String get capitalizeFullName => split(' ').map((word) {
        return word.substring(0, 1).toUpperCase() +
            word.substring(1).toLowerCase();
      }).join(' ');
}
