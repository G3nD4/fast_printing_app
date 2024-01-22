class Trial {
  late final DateTime timeStamp; // time when user entered played
  late final int amountOfWords; // amount of words user entered in total
  late final int hits; // amount of words that user entered correctly
  late final int misses; // amount of words that user did not entered correctly
  late final String id;

  Trial({
    required this.timeStamp,
    required this.amountOfWords,
    required this.hits,
    required this.misses,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'timeStamp': timeStamp,
      'amountOfWords': amountOfWords,
      'hits': hits,
      'misses': misses,
      'id': id,
    };
  }

  factory Trial.fromJson(Map<String, dynamic> json) {
    return Trial(
      timeStamp: json['timeStamp'],
      amountOfWords: json['amountOfWords'],
      hits: json['hits'],
      misses: json['misses'],
      id: json['id'],
    );
  }
}