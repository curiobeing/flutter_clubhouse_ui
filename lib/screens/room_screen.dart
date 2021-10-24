import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';

import '../data.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  RoomScreen({required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.chevron_down, color: Colors.black),
          label: const Text('All Rooms', style: TextStyle(color: Colors.black)),
        ),
        leadingWidth: 120,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.doc, size: 28),
            onPressed: () {
              print('Doc icon clicked');
            },
          ),
          GestureDetector(
            onTap: () {
              print('User Profile Image clicked');
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 20, 10),
              child: UserProfileImage(imageURL: currentUser.imageUrl, size: 36),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                      ),
                      GestureDetector(
                        child: Icon(CupertinoIcons.ellipsis),
                        onTap: () {
                          print('Ellipsis icon clicked');
                        },
                      ),
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                  ),
                ],
              ),
            ),
            CustomSliverGridCount(
              usersList: room.speakers,
              crossAxisCount: 3,
              childAspectRatio: 0.9,
              isMuted: Random().nextBool(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Followed by Speakers',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            CustomSliverGridCount(
              usersList: room.followedBySpeakers,
              crossAxisCount: 4,
              childAspectRatio: 0.7,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Others in the Room',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            CustomSliverGridCount(
              usersList: room.others,
              crossAxisCount: 4,
              childAspectRatio: 0.7,
            ),
            SliverPadding(padding: const EdgeInsets.only(bottom: 100)),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Text(
                          '✌🏼',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      TextSpan(
                        text: ' Leave quietly',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('+ icon clicked');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      CupertinoIcons.add,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    print('hand icon clicked');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      CupertinoIcons.hand_raised_fill,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
