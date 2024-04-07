import 'package:flutter/material.dart';
import 'package:house_rent/model/bookmark.dart';

class BookmarkButton extends StatefulWidget {
  final Bookmark bookmark;

  const BookmarkButton({Key? key, required this.bookmark}) : super(key: key);

  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    // Check if the house is already bookmarked
    _isBookmarked = _checkIfBookmarked();
  }

  bool _checkIfBookmarked() {
    // Logic to check if the house is bookmarked
    // You can use local storage or any state management solution
    // For simplicity, let's assume it's not bookmarked initially
    return false;
  }

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
      // Update bookmark status in local storage or state management
      // For simplicity, we'll not implement this here
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: _isBookmarked ? Colors.red : Colors.grey,
      ),
      onPressed: _toggleBookmark,
    );
  }
}
