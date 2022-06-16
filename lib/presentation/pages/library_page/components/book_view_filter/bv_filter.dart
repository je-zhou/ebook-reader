import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_view_filter/bv_filter_btn.dart';

class BVFilter extends StatelessWidget {
  const BVFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reset',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text('Done', style: Theme.of(context).textTheme.bodyText1)
          ],
        ),
        const Divider(
          height: 2,
          thickness: 2,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Sort',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              children: [
                Row(
                  children: [
                    BVFilterButton(title: 'By Title', onPressed: () {}),
                    BVFilterButton(title: 'By Author', onPressed: () {}),
                  ],
                ),
              ],
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Status',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              children: [
                Row(
                  children: [
                    BVFilterButton(title: 'Reading', onPressed: () {}),
                    BVFilterButton(title: 'New', onPressed: () {}),
                    BVFilterButton(title: 'Completed', onPressed: () {}),
                  ],
                ),
              ],
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'File Type',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              children: [
                Row(
                  children: [
                    BVFilterButton(title: 'EPUB', onPressed: () {}),
                    BVFilterButton(title: 'PDF', onPressed: () {}),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
