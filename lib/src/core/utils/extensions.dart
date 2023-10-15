extension TextHandler on String {
  String getISOCode() {
    if (this.isEmpty)
      return '';
    else if (this.length < 3)
      return this.toLowerCase();
    else
      return this.toLowerCase().substring(0, 2);
  }
}

extension ResponseHandler on int {
  bool successResponse() {
    return this >= 200 && this < 300;
  }

  bool timeoutResponse() {
    return this == 408;
  }
}
