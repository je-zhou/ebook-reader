import 'package:flutter/material.dart';
import 'package:iridium_reader_widget/views/viewers/epub_screen.dart';

void openBook(BuildContext context, String path) {
  Navigator.push(
    context,
    MaterialPageRoute(
        // the cfi cant be null, but empty string is ok
        // the idref is the path minus the server
        // not sure how to solve
        builder: (context) => EpubScreen.fromPath(
              filePath: path,

              // TODO:: SAVE SPINE_ITEM_ID TO DB THEN CAN OPEN EBOOK FROM THAT SPINE_ITEM_ID
              location: '{"cfi":"","idref":"Chapter03"}',
              // CALLBACK FUNCTION IS CALLED WHENEVER A NEW SPINEITEM IS NAVIGATED TO
              // TODO:: replace print function with a 'save to db' function
              callback: print,
            )),

    // TODO:: Update Iridium to flutter 3 migration branch - might make less buggy
    // Open another branch to test
  );
}
