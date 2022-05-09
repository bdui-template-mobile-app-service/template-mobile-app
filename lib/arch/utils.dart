// NOTE: It's base file

import 'package:intl/intl.dart';

T? cast<T>(x) => x is T ? x : null;

extension ExtendedList<T> on List<T> {
  T? safeGet(int index) =>
      index.isBetweenOrEqual(0, length - 1) ? this[index] : null;
}

extension ExtendedSet<T> on Set<T> {
  bool isEqualToOther(Set<T> set) =>
      this.difference(set).isEmpty && set.difference(this).isEmpty;
}

extension Range on num {
  bool isBetween(num from, num to) => from < this && this < to;
  bool isBetweenOrEqual(num from, num to) => from <= this && this <= to;
}

final defaultPriceFormat = NumberFormat.currency(symbol: '₽')
  ..maximumFractionDigits = 2
  ..minimumFractionDigits = 0;
