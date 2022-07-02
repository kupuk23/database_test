class IdRoutePath {
  final int? id;
  final bool isUnknown;

  IdRoutePath.home()
      : id = null,
        isUnknown = false;

  IdRoutePath.details(this.id) : isUnknown = false;

  IdRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}
