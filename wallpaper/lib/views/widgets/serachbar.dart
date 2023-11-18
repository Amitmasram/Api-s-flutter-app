import 'package:flutter/material.dart';
import 'package:wallpaper/views/screens/search.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    super.key,
  });
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 239, 239, 239),
            border: Border.all(
              color: Colors.black38,
            ),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      hintText: "Search For Wallpaper",
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: OutlineInputBorder())),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SearchScreen(query: _searchController.text)));
                },
                child: Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
