import 'package:eyestagram/components/icon.dart';
import 'package:eyestagram/components/menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EyestagramMenu extends StatelessWidget {
  const EyestagramMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
      width: 220,
      child: Padding(
        padding: const EdgeInsets.only(top: 38),
        child: ListView(
          padding: const EdgeInsets.only(right: 12),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SvgPicture.asset(
                'assets/images/icons/instagram.svg',
                height: 29,
                alignment: Alignment.topLeft,
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            EyestagramMenuTile(
              leading: EyestagramIcon('assets/images/icons/home.svg'),
              titleText: 'Home',
              isActive: true,
              onTap: () {},
            ),
            EyestagramMenuTile(
              leading: const EyestagramIcon('assets/images/icons/search.svg'),
              titleText: 'Search',
              onTap: () {},
            ),
            EyestagramMenuTile(
              leading: const EyestagramIcon('assets/images/icons/explore.svg'),
              titleText: 'Explore',
              onTap: () {},
            ),
            EyestagramMenuTile(
              leading: const EyestagramIcon('assets/images/icons/reels.svg'),
              titleText: 'Reels',
              onTap: () {},
            ),
            EyestagramMenuTile(
              leading:
                  const EyestagramIcon('assets/images/icons/messenger.svg'),
              titleText: 'Messages',
              onTap: () {},
            ),
            EyestagramMenuTile(
              leading:
                  const EyestagramIcon('assets/images/icons/notifications.svg'),
              titleText: 'Notifications',
              onTap: () {},
            ),
            EyestagramMenuTile(
              leading: const EyestagramIcon('assets/images/icons/create.svg'),
              titleText: 'Create',
              onTap: () {},
            ),
            EyestagramMenuTile(
              leading: const CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/icons/marty-sq.jpeg'),
                radius: 12,
              ),
              titleText: 'Profile',
              onTap: () {},
            ),
            const SizedBox(
              height: 285,
            ),
            EyestagramMenuTile(
              leading: const EyestagramIcon('assets/images/icons/threads.svg'),
              titleText: 'Threads',
              onTap: () {},
            ),
            EyestagramMenuTile(
              leading: const EyestagramIcon('assets/images/icons/settings.svg'),
              titleText: 'More',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
