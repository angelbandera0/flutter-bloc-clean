class ServerException implements Exception {
  late final String message;
  ServerException(this.message);
}

class PublishAuctionException implements Exception {
  late final String message;
  PublishAuctionException(this.message);
}

class TwilioException implements Exception {}

class NotFoundException implements Exception {}

class UnauthorizedException implements Exception {}

class CacheException implements Exception {}
