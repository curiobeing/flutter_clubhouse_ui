import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_clubhouse_ui/data.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            print('Search icon clicked');
          },
          icon: Icon(CupertinoIcons.search, size: 28),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('Envelope icon clicked');
            },
            icon: Icon(CupertinoIcons.envelope_open, size: 26),
          ),
          IconButton(
            onPressed: () {
              print('Calendar icon clicked');
            },
            icon: Icon(CupertinoIcons.calendar, size: 28),
          ),
          IconButton(
            onPressed: () {
              print('Bell icon clicked');
            },
            icon: Icon(CupertinoIcons.bell, size: 28),
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
            children: [
              UpcomingRooms(upcomingRooms: upcomingRoomsList),
              const SizedBox(height: 12),
              ...roomsList.map((e) => RoomCard(room: e)),
              ...roomsList.map((e) => RoomCard(room: e)),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
          // Start a room button
          Positioned(
            left: 0,
            right: 0,
            bottom: 60,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  print('Start a Room clicked');
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(
                            CupertinoIcons.add,
                            size: 21,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: ' Start a Room',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 40,
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.circle_grid_3x3_fill,
                    size: 28,
                  ),
                  splashRadius: 2,
                  onPressed: () {
                    print('Grid icon clicked');
                  },
                ),
                Positioned(
                  right: 4.6,
                  bottom: 11.8,
                  child: Icon(
                    CupertinoIcons.circle_fill,
                    size: 18,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
