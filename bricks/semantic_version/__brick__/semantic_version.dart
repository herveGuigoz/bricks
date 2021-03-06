class SemanticVersion with CompareMixin {
  SemanticVersion({
    this.major = 0,
    this.minor = 0,
    this.patch = 0,
    this.preReleaseMajor,
    this.preReleaseMinor,
  });

  factory SemanticVersion.parse(String versionString) {
    // Remove any build metadata, denoted by a '+' character and whatever
    // follows.
    final buildMetadataIndex = versionString.indexOf('+');
    if (buildMetadataIndex != -1) {
      versionString = versionString.substring(0, buildMetadataIndex);
    }

    // [versionString] is expected to be of the form:
    // 2.15.0-178.1.beta
    // 2.6.0-12.0.pre.443
    //
    // So split on the spaces to the version, and then on the dash char to
    // separate the main semantic version from the pre release version.
    final splitOnSpaces = versionString.split(' ');
    final version = splitOnSpaces.first;
    final splitOnDash = version.split('-');
    assert(splitOnDash.length <= 2, 'version: $version');

    final semVersion = splitOnDash.first;
    final _parts = semVersion.split('.');
    final major = _parts.isNotEmpty ? int.tryParse(_parts.first) ?? 0 : 0;
    final minor = _parts.length > 1 ? int.tryParse(_parts[1]) ?? 0 : 0;
    final patch = _parts.length > 2 ? int.tryParse(_parts[2]) ?? 0 : 0;

    int? preReleaseMajor;
    int? preReleaseMinor;
    if (splitOnDash.length == 2) {
      final preRelease = splitOnDash.last;
      final preReleaseParts = preRelease
          .split('.')
          .map((part) => RegExp(r'\d+').stringMatch(part) ?? '')
          .toList()
        ..removeWhere((part) => part.isEmpty);
      preReleaseMajor = preReleaseParts.isNotEmpty
          ? int.tryParse(preReleaseParts.first) ?? 0
          : 0;
      preReleaseMinor = preReleaseParts.length > 1
          ? int.tryParse(preReleaseParts[1]) ?? 0
          : 0;
    }

    return SemanticVersion(
      major: major,
      minor: minor,
      patch: patch,
      preReleaseMajor: preReleaseMajor,
      preReleaseMinor: preReleaseMinor,
    );
  }

  int major;

  int minor;

  int patch;

  int? preReleaseMajor;

  int? preReleaseMinor;

  bool get isPreRelease => preReleaseMajor != null || preReleaseMinor != null;

  bool isSupported({required SemanticVersion supportedVersion}) {
    return compareTo(supportedVersion) >= 0;
  }

  @override
  int compareTo(other) {
    if (major == other.major &&
        minor == other.minor &&
        patch == other.patch &&
        (preReleaseMajor ?? 0) == (other.preReleaseMajor ?? 0) &&
        (preReleaseMinor ?? 0) == (other.preReleaseMinor ?? 0)) {
      return 0;
    }
    if (major > other.major ||
        (major == other.major && minor > other.minor) ||
        (major == other.major && minor == other.minor && patch > other.patch)) {
      return 1;
    }
    if (major == other.major && minor == other.minor && patch == other.patch) {
      if (isPreRelease != other.isPreRelease) {
        return isPreRelease ? -1 : 1;
      }
      if ((preReleaseMajor ?? 0) > (other.preReleaseMajor ?? 0) ||
          (preReleaseMajor == other.preReleaseMajor &&
              (preReleaseMinor ?? 0) > (other.preReleaseMinor ?? 0))) {
        return 1;
      }
    }

    return -1;
  }

  @override
  String toString() {
    final semVer = [major, minor, patch].join('.');

    return [
      semVer,
      if (preReleaseMajor != null || preReleaseMinor != null)
        [
          if (preReleaseMajor != null) preReleaseMajor,
          if (preReleaseMajor == null && preReleaseMinor != null) '0',
          if (preReleaseMinor != null) preReleaseMinor,
        ].join('.'),
    ].join('-');
  }
}

mixin CompareMixin implements Comparable {
  bool operator <(other) {
    return compareTo(other) < 0;
  }

  bool operator >(other) {
    return compareTo(other) > 0;
  }

  bool operator <=(other) {
    return compareTo(other) <= 0;
  }

  bool operator >=(other) {
    return compareTo(other) >= 0;
  }
}
