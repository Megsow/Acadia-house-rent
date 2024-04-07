import 'package:flutter/material.dart';
import 'package:house_rent/model/bookmark.dart';
import 'package:house_rent/screen/detail/detail.dart';

class BookmarkPage extends StatelessWidget {
  final List<Bookmark> bookmarks;

  const BookmarkPage({Key? key, required this.bookmarks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Bookmarks'),
      ),
      body: ListView.builder(
        itemCount: bookmarks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(bookmarks[index].house.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage(house: bookmarks[index].house)),
              );
            },
          );
        },
      ),
    );
  }
}
