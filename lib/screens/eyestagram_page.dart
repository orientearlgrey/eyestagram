import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';

import 'package:eyestagram/brands.dart';
import 'package:eyestagram/components/eyesta_menu_tile.dart';
import 'package:eyestagram/components/eyestagram_icon.dart';

String getDuration() {
  Random random = Random();
  var units = ['h', 'd', 'w'];
  String unit = units[random.nextInt(units.length)];
  String duration = '';
  switch (unit) {
    case 'h':
      {
        duration = '${random.nextInt(23) + 1}$unit';
      }
    case 'd':
      {
        duration = '${random.nextInt(6) + 1}$unit';
      }
    case 'w':
      {
        duration = '${random.nextInt(2) + 1}$unit';
      }
  }
  return duration;
}

class EyestagramPage extends StatefulWidget {
  const EyestagramPage({super.key});

  @override
  State<EyestagramPage> createState() => _EyestagramPageState();
}

class _EyestagramPageState extends State<EyestagramPage> {
  bool isSponsored = false;
  bool isVerified = false;
  bool expanded = false;

  var formatter = NumberFormat('###,##0');
  Random random = Random();

  String duration = '';
  String nduration = '';

  int current = 260;
  int next = 0;

  int likes = 0;
  int pcomments = 0;
  int comments = 0;

  @override
  void initState() {
    super.initState();

    expanded = false;
    next = random.nextInt(brands.length);
    duration = getDuration();
    nduration = getDuration();

    likes = (random.nextInt(1000) * random.nextDouble()).toInt() + 2;
    pcomments = (likes * 0.1 * random.nextDouble()).toInt() + 2;
    comments = (likes * 0.1 * random.nextDouble()).toInt() + 2;
  }

  @override
  Widget build(BuildContext context) {
    String account = brands[current]?['ig_handle'] as String;

    String copy = '';

    String more = brands[current]?['more'] as String;
    String fold = brands[current]?['fold'] as String;
    if (more == 'true') {
      copy = brands[current]?['copy'] as String;
    } else {
      copy = brands[current]?['fold'] as String;
    }

    String naccount = brands[next]?['ig_handle'] as String;

    return Scaffold(
      body: Row(
        children: [
          /// Eyestagram Menu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
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
                  padding: EdgeInsets.zero,
                  children: [
                    SvgPicture.asset(
                      'assets/images/icons/instagram.svg',
                      height: 29,
                      alignment: Alignment.topLeft,
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    const EyestaMenuTile(
                      leading: EyestagramIcon('assets/images/icons/home.svg'),
                      titleText: 'Home',
                      isActive: true,
                    ),
                    EyestaMenuTile(
                      leading: const EyestagramIcon(
                          'assets/images/icons/search.svg'),
                      titleText: 'Search',
                      onTap: () {
                        setState(() {
                          isSponsored = !isSponsored;
                          expanded = false;
                          next = random.nextInt(brands.length);
                          duration = getDuration();
                          nduration = getDuration();
                          likes = (random.nextInt(1000) * random.nextDouble())
                                  .toInt() +
                              2;
                          pcomments =
                              (likes * 0.1 * random.nextDouble()).toInt() + 2;
                          comments =
                              (likes * 0.1 * random.nextDouble()).toInt() + 2;
                        });
                      },
                    ),
                    EyestaMenuTile(
                      leading: const EyestagramIcon(
                          'assets/images/icons/explore.svg'),
                      titleText: 'Explore',
                      onTap: () {
                        setState(() {
                          isVerified = !isVerified;
                          expanded = false;
                          next = random.nextInt(brands.length);
                          duration = getDuration();
                          nduration = getDuration();
                          likes = (random.nextInt(1000) * random.nextDouble())
                                  .toInt() +
                              2;
                          pcomments =
                              (likes * 0.1 * random.nextDouble()).toInt() + 2;
                          comments =
                              (likes * 0.1 * random.nextDouble()).toInt() + 2;
                        });
                      },
                    ),
                    const EyestaMenuTile(
                      leading: EyestagramIcon('assets/images/icons/reels.svg'),
                      titleText: 'Reels',
                    ),
                    const EyestaMenuTile(
                      leading:
                          EyestagramIcon('assets/images/icons/messenger.svg'),
                      titleText: 'Messages',
                    ),
                    const EyestaMenuTile(
                      leading: EyestagramIcon(
                          'assets/images/icons/notifications.svg'),
                      titleText: 'Notifications',
                    ),
                    const EyestaMenuTile(
                      leading: EyestagramIcon('assets/images/icons/create.svg'),
                      titleText: 'Create',
                    ),
                    const EyestaMenuTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/icons/marty-sq.jpeg'),
                        radius: 12,
                      ),
                      titleText: 'Profile',
                    ),
                    const SizedBox(
                      height: 285,
                    ),
                    EyestaMenuTile(
                      leading: const EyestagramIcon(
                          'assets/images/icons/threads.svg'),
                      titleText: 'Threads',
                      onTap: () {
                        setState(() {
                          if (current > 0) {
                            current -= 1;
                            expanded = false;
                            next = random.nextInt(brands.length);
                            duration = getDuration();
                            nduration = getDuration();
                            likes = (random.nextInt(1000) * random.nextDouble())
                                    .toInt() +
                                2;
                            pcomments =
                                (likes * 0.1 * random.nextDouble()).toInt() + 2;
                            comments =
                                (likes * 0.1 * random.nextDouble()).toInt() + 2;
                          }
                          ;
                        });
                      },
                    ),
                    EyestaMenuTile(
                      leading: const EyestagramIcon(
                          'assets/images/icons/settings.svg'),
                      titleText: 'More',
                      onTap: () {
                        setState(() {
                          if (current < (brands.length - 1)) {
                            current += 1;
                            expanded = false;
                            next = random.nextInt(brands.length);
                            duration = getDuration();
                            nduration = getDuration();
                            likes = (random.nextInt(1000) * random.nextDouble())
                                    .toInt() +
                                2;
                            pcomments =
                                (likes * 0.1 * random.nextDouble()).toInt() + 2;
                            comments =
                                (likes * 0.1 * random.nextDouble()).toInt() + 2;
                          }
                          ;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 375,
          ),

          /// -- Instagram Feed
          SingleChildScrollView(
            child: SizedBox(
              width: 1277,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- More Link
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                    child: SizedBox(
                      width: 468,
                      child: Text.rich(
                        TextSpan(
                          text: "...",
                          style: TextStyle(
                            fontFamily: "SF Pro",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.75,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: " more",
                              style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.75,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// -- Comments
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: Text(
                      "View all ${formatter.format(pcomments)} comments",
                      style: const TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75,
                        color: Colors.black54,
                      ),
                    ),
                  ),

                  /// -- Add a Comment
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: SizedBox(
                      width: 468,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Add a comment...",
                            style: TextStyle(
                              fontFamily: "SF Pro",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.75,
                              color: Colors.black54,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: SvgPicture.asset(
                              'assets/images/icons/emoji.svg',
                              height: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// -- Bottom Border
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: Container(
                      height: 10,
                      width: 468,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black12,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// -- Post Header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 0, 8),
                    child: SizedBox(
                      width: 468,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 17,
                                backgroundColor: Colors.black12,
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundImage: AssetImage(
                                      'assets/images/logos/$account.jpeg'),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '$account ',
                                        style: const TextStyle(
                                          fontFamily: "SF Pro",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.75,
                                          color: Colors.black,
                                        ),
                                      ),
                                      isVerified
                                          ? SvgPicture.asset(
                                              'assets/images/icons/verified.svg',
                                              height: 12,
                                            )
                                          : Container(),
                                      !isSponsored
                                          ? Text(
                                              ' • $duration',
                                              style: const TextStyle(
                                                fontFamily: "SF Pro",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.75,
                                                color: Colors.black54,
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                  isSponsored
                                      ? const Text(
                                          'Sponsored',
                                          style: TextStyle(
                                            fontFamily: "SF Pro",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.1,
                                            color: Colors.black87,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/images/icons/more-options.svg',
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// -- Post Image
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                    child: Image(
                      image: AssetImage('assets/images/posts/$account.jpeg'),
                      width: 468,
                    ),
                  ),

                  /// -- CTA Button
                  isSponsored
                      ? Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                              ),
                            ),
                            width: 468,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Learn more",
                                    style: TextStyle(
                                      fontFamily: "SF Pro",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                  RotationTransition(
                                    turns:
                                        const AlwaysStoppedAnimation(90 / 360),
                                    child: SvgPicture.asset(
                                      'assets/images/icons/right-chevron.svg',
                                      height: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(),

                  /// -- Icons Bar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 468,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/icons/like.svg',
                                height: 24,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SvgPicture.asset(
                                'assets/images/icons/comment.svg',
                                height: 24,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SvgPicture.asset(
                                'assets/images/icons/share-post.svg',
                                height: 24,
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/images/icons/save.svg',
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// -- Likes
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      "${formatter.format(likes)} likes",
                      style: const TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.75,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  /// -- Copy Text
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0.0),
                    child: SizedBox(
                      width: 468,
                      child: Text.rich(
                        TextSpan(
                          text: '$account ',
                          style: const TextStyle(
                            fontFamily: "SF Pro",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.75,
                            color: Colors.black,
                          ),
                          children: [
                            WidgetSpan(
                              child: isVerified
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 2.0),
                                      child: SvgPicture.asset(
                                        'assets/images/icons/verified.svg',
                                        height: 12,
                                      ),
                                    )
                                  : const Text(''),
                            ),
                            TextSpan(
                              text: expanded ? " $copy" : " $fold",
                              style: const TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.75,
                                color: Colors.black,
                              ),
                            ),
                            WidgetSpan(
                              child: !expanded
                                  ? SizedBox(
                                      width: 60,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            more = 'false';
                                            expanded = true;
                                          });
                                        },
                                        child: const Row(
                                          children: [
                                            Text(" ... ",
                                                style: TextStyle(
                                                  fontFamily: "SF Pro",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.75,
                                                  color: Colors.black,
                                                )),
                                            Text("more",
                                                style: TextStyle(
                                                  fontFamily: "SF Pro",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: -0.75,
                                                  color: Colors.black45,
                                                )),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const Text(''),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// -- Comments
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: Text(
                      "View all ${formatter.format(comments)} comments",
                      style: const TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75,
                        color: Colors.black54,
                      ),
                    ),
                  ),

                  /// -- Add a Comment
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: SizedBox(
                      width: 468,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Add a comment...",
                            style: TextStyle(
                              fontFamily: "SF Pro",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.75,
                              color: Colors.black54,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: SvgPicture.asset(
                              'assets/images/icons/emoji.svg',
                              height: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// -- Bottom Border
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: Container(
                      height: 10,
                      width: 468,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black12,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// -- Post Header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 0, 8),
                    child: SizedBox(
                      width: 468,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 17,
                                backgroundColor: Colors.black12,
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundImage: AssetImage(
                                      'assets/images/logos/$naccount.jpeg'),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '$naccount ',
                                        style: const TextStyle(
                                          fontFamily: "SF Pro",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.75,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        ' • $nduration',
                                        style: const TextStyle(
                                          fontFamily: "SF Pro",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.75,
                                          color: Colors.black54,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/images/icons/more-options.svg',
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// -- Post Image
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                    child: Image(
                      image: AssetImage('assets/images/posts/$naccount.jpeg'),
                      width: 468,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
