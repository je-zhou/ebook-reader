import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/domain/book/book.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_details/bd_continue_btn.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_details/bd_description.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_details/bd_metadata.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_details/bd_progress_bar.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_details/bd_title_and_author.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_details/bd_view_quotes_btn.dart';

class BookDetails extends StatelessWidget {
  final Book book;
  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Image will have 1:1.6 aspect ratio
    double imageWidth = (screenWidth - 72) / 3;
    double imageHeight = imageWidth * 1.6;

    double progressBarWidth = imageWidth * 1.8;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Image.memory(
                  book.img,
                  fit: BoxFit.fill,
                  width: imageWidth,
                  height: imageHeight,
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                height: imageHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BDTitleAndAuthor(book: book),
                    BDDescription(book: book),
                    BDMetadata(book: book),
                    BDProgressBar(book: book, width: progressBarWidth)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BDViewQuotesButton(book: book),
              BDContinueButton(book: book),
            ],
          )
        ],
      ),
    );
  }
}
