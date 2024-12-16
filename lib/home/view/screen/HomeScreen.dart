import 'package:flutter/material.dart';
import 'package:movieapp/common/Appcolors.dart';
import 'package:movieapp/home/view/screen/homeTab.dart';
import 'package:movieapp/home/view/screen/search.dart';
import 'package:movieapp/home/view/screen/watchList.dart';
import 'package:movieapp/home/view/screen/browseScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int Index = 0;
  Widget build(BuildContext context) {
    List<Widget> Tabs = [
      CustomHomeTab(),
      CustomSearchTab(),
      CustomBrowse(),
      CustomWatchList()
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Tabs[Index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          Index = value;
          setState(() {});
        },
        currentIndex: Index,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.mainColor,
        selectedItemColor: AppColor.goldColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'HOME'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'SEARCH'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.movie,
              ),
              label: 'BROWSE'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.collections_bookmark,
              ),
              label: 'WATCHList'),
        ],
      ),
    );
  }
}
