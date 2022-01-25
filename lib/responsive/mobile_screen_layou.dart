import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibrant/models/users.dart' as model;
import 'package:vibrant/providers/user_provider.dart';
import 'package:vibrant/screens/add_post_screen.dart';
import 'package:vibrant/screens/feed_screen.dart';

class MobileScreenLayout extends StatefulWidget {
  // const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int selectedIndex = 0;
  List _pages = [
    FeedScreen(),
    SearchScreen(),
    AddPostScreen(),
    FavouriteScreen(),
    UserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) => setState(() {
                selectedIndex = value;
              }),
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.deepPurple,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Post'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Post'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Post'),
          ]),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text('This is Search Screen....'),
    ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text('This is Home Screen....'),
    ));
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text('This is User Screen....'),
    ));
  }
}

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Fav Screen'),
      ),
    );
  }
}
