import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

@freezed
class Book with _$Book {
  const factory Book({
    String? id,
    String? href,
    required String title,
    required String author,
    required String imageUrl,
  }) = _Book;

  factory Book.dummy() => const Book(
      title: "The Barefoot Investor [DUMMY]",
      author: "Scott Pape [DUMMY]",
      imageUrl:
          "https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/7303/9780730324218.jpg");
}
