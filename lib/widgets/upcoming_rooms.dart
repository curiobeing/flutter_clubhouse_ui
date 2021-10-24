import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/config/palette.dart';

import '../data.dart';

class UpcomingRooms extends StatelessWidget {
  final List<Room> upcomingRooms;

  UpcomingRooms({required this.upcomingRooms});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Upcoming Rooms list clicked');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Palette.secondaryBackground,
        ),
        child: Column(
          children: upcomingRooms.map((e) {
            return Padding(
              padding: const EdgeInsets.only(left: 32, top: 4, bottom: 4),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: e.club.isNotEmpty ? 2 : 0),
                          child: Text(e.time),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (e.club.isNotEmpty)
                                Text(
                                  '${e.club} 🏠'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              Text(e.name, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
