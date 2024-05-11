double fromDoubleOrString(dynamic value) {
  if (value is int) {
    return value.toDouble();
  }
  if (value is double) {
    return value;
  }
  if (value is String) {
    if (value == 'fill') {
      return double.infinity;
    }
    final v = double.tryParse(value);
    if (v == null) {
      throw "Parse error";
    }
    return v;
  }
  throw "Parse error";
}

double? optionalFromDoubleOrString(dynamic value) {
  try {
    return fromDoubleOrString(value);
  } catch (e) {
    return null;
  }
}

dynamic doubleToJsonWithFill(dynamic value) {
  if (value == null) {
    return null;
  }
  if (value is double) {
    if (value == double.infinity) {
      return 'fill';
    }
    return value;
  }
  throw "Parse error ${value.runtimeType} ${value}";
}
