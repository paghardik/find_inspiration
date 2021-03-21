class Constant {
  static RegExp priceRegExp = RegExp(
      r"^\d{0,8}(\.\d{1,4})?$",
      multiLine: false);

  static RegExp titleRegExp = RegExp(
      r"[a-zA-Z]",
      multiLine: false);
}
