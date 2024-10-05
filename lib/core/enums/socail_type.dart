
enum SocialType {google, apple}

extension SocailTypeExtension on SocialType {
  String getValue() {
    switch (this) {
      case SocialType.google:
        return '1';
      case SocialType.apple:
        return '2';
    }
  }
}