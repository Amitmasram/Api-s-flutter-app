import 'package:flutter/material.dart';
import 'package:wallpaper/controllers/apioperation.dart';
import 'package:wallpaper/models/photosmodel.dart';
import 'package:wallpaper/views/screens/full_screen.dart';
import 'package:wallpaper/views/widgets/Customappbar.dart';
import 'package:wallpaper/views/widgets/getBlock.dart';
import 'package:wallpaper/views/widgets/serachbar.dart';

import '../../models/categorymodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotosModel> getTrendingWallList = [];
  late List<CategoryModel> CatModList;
  bool isLoading = true;
  GetCatDetails() async {
    CatModList = await ApiOperations.getCategoriesList();
    print("GETTTING CAT MOD LIST");
    print(CatModList);
    setState(() {
      CatModList = CatModList;
    });
  }

  GetTrendingWallpapers() async {
    getTrendingWallList = await ApiOperations.getTrendingWallpapers();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    GetCatDetails();

    GetTrendingWallpapers();
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: SearchBar()
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: 30,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CatBlock(
                              categoryImgSrc: CatModList[index].catImgUrl,
                              categoryName: CatModList[index].catName,
                            )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 700,
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: getTrendingWallList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                            imgUrl: getTrendingWallList[index]
                                                .imgSrc)));
                              },
                              child: Hero(
                                tag: getTrendingWallList[index].imgSrc,
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
                                      getTrendingWallList[index].imgSrc,
                                      //"https://images.pexels.com/photos/10394786/pexels-photo-10394786.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
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
