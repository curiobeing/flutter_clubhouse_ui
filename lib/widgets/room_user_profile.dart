import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile_image.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageURL;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile(
      {required this.imageURL,
      required this.name,
      this.size = 48,
      this.isNew = false,
      this.isMuted = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                padding: const EdgeInsets.all(6),
                child: UserProfileImage(imageURL: imageURL, size: size)),
            if (isNew)
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '🎉',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            if (isMuted)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Icon(CupertinoIcons.mic_slash_fill),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(name, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
