import 'dart:math';

import 'package:flutter/material.dart';

import '../data.dart';
import 'widgets.dart';

class CustomSliverGridCount extends StatelessWidget {
  const CustomSliverGridCount({
    required this.usersList,
    required this.crossAxisCount,
    required this.childAspectRatio,
    this.isMuted = false,
  });

  final List<User> usersList;
  final int crossAxisCount;
  final double childAspectRatio;
  final bool isMuted;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 20,
        childAspectRatio: childAspectRatio,
        children: [
          ...usersList.map((e) {
            return RoomUserProfile(
              imageURL: e.imageUrl,
              name: e.givenName,
              size: 66,
              isNew: Random().nextBool(),
              isMuted: isMuted,
            );
          })
        ],
      ),
    );
  }
}
