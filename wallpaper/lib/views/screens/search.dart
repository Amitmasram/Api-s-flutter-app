import 'package:flutter/material.dart';
import 'package:wallpaper/views/widgets/Customappbar.dart';

import 'package:wallpaper/views/widgets/serachbar.dart';

import '../../controllers/apioperation.dart';
import '../../models/photosmodel.dart';
import 'full_screen.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<PhotosModel> searchResults;
  // bool isLoading = true;

  GetSearchResults() async {
    searchResults = await ApiOperations.searchWallpapers(widget.query);
    setState(() {
      //  isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    GetSearchResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: CustomAppBar(
          word1: "Wallpaper",
          word2: "Guru",
        ),
      ),
      body: //isLoading
          // ? Center(child: CircularProgressIndicator())
          // :
          SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            // child: SearchBar()
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: searchResults.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 400),
                itemBuilder: (context, index) => GridTile(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FullScreen(
                                      imgUrl: searchResults[index].imgSrc)));
                        },
                        child: Hero(
                          tag: searchResults[index].imgSrc,
                          child: Container(
                            height: 500,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                height: 800,
                                width: 50,
                                searchResults[index].imgSrc,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
          )
        ]),
      ),
    );
  }
}
