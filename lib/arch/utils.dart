// NOTE: It's base file

T? cast<T>(x) => x is T ? x : null;

extension ListGetExtension<T> on List<T> {
  T? safeGet(int index) =>
      index.isBetweenOrEqual(0, length - 1) ? this[index] : null;
}

extension Range on num {
  bool isBetween(num from, num to) => from < this && this < to;
  bool isBetweenOrEqual(num from, num to) => from <= this && this <= to;
}
