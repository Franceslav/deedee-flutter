import 'package:equatable/equatable.dart';

class FilterDTO extends Equatable {
  final String filterId;
  final String userId;
  final String topic;
  final String subtopic;
  final List<String> filterKeys;
  final bool bookmarked;
  final bool subscribed;

  const FilterDTO({
    required this.filterId,
    required this.userId,
    required this.topic,
    required this.subtopic,
    required this.filterKeys,
    required this.bookmarked,
    required this.subscribed,
  });

  static const empty = FilterDTO(
    filterId: '',
    userId: '',
    topic: '',
    subtopic: '',
    filterKeys: [],
    bookmarked: false,
    subscribed: false,
  );

  bool get isEmpty => this == FilterDTO.empty;
  bool get isNotEmpty => this != FilterDTO.empty;

  factory FilterDTO.fromJson(Map<String, dynamic> parsedJson) {
    return FilterDTO(
      filterId: parsedJson['filterId'] ?? '',
      userId: parsedJson['userId'] ?? '',
      topic: parsedJson['topic'] ?? '',
      subtopic: parsedJson['subtopic'] ?? '',
      filterKeys: parsedJson['filterKeys'] ?? '',
      bookmarked: parsedJson['bookmarked'] ?? '',
      subscribed: parsedJson['subscribed'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'filterId': filterId,
      'userId': userId,
      'topic': topic,
      'subtopic': subtopic,
      'filterKeys': filterKeys,
      'bookmarked': bookmarked,
      'subscribed': subscribed,
    };
  }

  FilterDTO copyWith({
    String? filterId,
    String? userId,
    String? topic,
    String? subtopic,
    List<String>? filterKeys,
    bool? bookmarked,
    bool? subscribed,
  }) {
    return FilterDTO(
      filterId: filterId ?? this.filterId,
      userId: userId ?? this.userId,
      topic: topic ?? this.topic,
      subtopic: subtopic ?? this.subtopic,
      filterKeys: filterKeys ?? this.filterKeys,
      bookmarked: bookmarked ?? this.bookmarked,
      subscribed: subscribed ?? this.subscribed,
    );
  }

  @override
  List<Object?> get props => [
        filterId,
        userId,
        topic,
        subtopic,
        filterKeys,
        bookmarked,
        subscribed,
      ];
}
