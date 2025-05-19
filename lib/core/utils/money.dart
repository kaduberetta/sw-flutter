
class MoneyFormatter {
  

  static String format(num? value, {MoneySimbol simbol = MoneySimbol.rEAIS}) {
    if (value == null) return r'R$ 0.00';
    var temp = value;
    final isNegative = temp < 0.0;
    if (isNegative) temp = value.abs();
    var formatted = temp.toStringAsFixed(2).replaceAll('.', ',');
    var size = formatted.length - 3;
    while (size > 3) {
      size -= 3;
      formatted =
          '${formatted.substring(0, size)}.${formatted.substring(size)}';
    }
    switch (simbol) {
      case MoneySimbol.rEAIS:
        return '${isNegative ? '- ' : ''}R\$ $formatted';
      case MoneySimbol.nONE:
        return '${isNegative ? '- ' : ''}$formatted';
    }
  }
}

enum MoneySimbol { rEAIS, nONE }