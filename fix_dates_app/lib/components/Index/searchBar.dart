import 'package:flutter/material.dart';

class IndexSearchBar extends StatelessWidget {
  const IndexSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              size: 35.0,
            ),
            border: OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(50.0),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0)
            // hintText: 'Enter a search term',
            ),
      ),
    );
  }
}
