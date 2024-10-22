
extension NullableStringExt on String? {

  bool get hasValue => this == null ? false : this!.isNotEmpty;

  String orEmpty() => this ?? '';

  String orNotSpecifiedText() => this ?? 'Not specified';

}

extension StringExt on String {

  String capitalize() {
    return length > 1
        ? '${this[0].toUpperCase()}${substring(1)}'
        : toUpperCase();
  }

  String replaceLast(String from, String to){
    return reversed.replaceFirst(from.reversed, to.reversed).reversed;
  }

  String get reversed {
    return split('').reversed.join();
  }

  String removeHtmlTags() {
    final RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return replaceAll(exp, '').replaceAll('&nbsp;', ' ');
  }

}