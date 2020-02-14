library iitwitter_api_client;

class IITweet {
  final String author;
  final DateTime timestamp;
  final int likes;
  final String message;

  const IITweet(
    this.author,
    this.timestamp,
    this.likes,
    this.message,
  );
}

abstract class IITwitterApiClient {
  Stream<DateTime> get lastUpdated;

  Future<void> sendIITweet(IITweet iitweet);

  Future<List<IITweet>> getIITweets();
}

class MockIITwitterApiClient implements IITwitterApiClient {
  final List<IITweet> _iitweets = [];

  @override
  Future<List<IITweet>> getIITweets() =>
      Future.delayed(Duration(seconds: 1), () => Future.value(_iitweets));

  @override
  Stream<DateTime> get lastUpdated =>
      Stream.periodic(Duration(seconds: 10), (_) => DateTime.now());

  @override
  Future<void> sendIITweet(IITweet iitweet) =>
      Future.delayed(Duration(seconds: 1), () => _iitweets.add(iitweet));
}
