import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/screens/profile_screen.dart';
import 'package:instagram_app/screens/search_screen.dart';

import '../screens/add_post_screen.dart';
import '../screens/feed_screen.dart';

const WebScreenSize = 600;

List<Widget> homeScreenItem = [
  FeedScreen(),
  SearchScreen(),
  const AddPostScreen(),
  const Center(child: Text('fav posts\n暂未建设')),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
