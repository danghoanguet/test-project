extension NullableStringExtension on String? {
  bool get isNullOrEmpty => this == null || (this?.isEmpty ?? true);

  bool get isNotNullAndNotEmpty => this != null && (this?.isNotEmpty ?? false);

  String get orDefault => this ?? "";
}
