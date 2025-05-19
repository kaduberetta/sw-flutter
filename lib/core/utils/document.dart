class DocumentFormatter {
  DocumentFormatter._();

  static String format(String document) {
    String formatted = document;

    if (document.contains('-')) return document;

    if (document.length == 11) {
      formatted =
          '${document.substring(0, 3)}.${document.substring(3, 6)}.${document.substring(6, 9)}-${document.substring(9)}';
    } else if (document.length == 14) {
      formatted =
          '${document.substring(0, 2)}.${document.substring(2, 5)}.${document.substring(5, 8)}/${document.substring(8, 12)}-${document.substring(12)}';
    }

    return formatted;
  }
}
