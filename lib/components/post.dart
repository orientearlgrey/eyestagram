import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:eyestagram/brands.dart';
import 'package:eyestagram/utils/utils.dart';
import 'package:intl/intl.dart';

class EyestagramPost extends StatefulWidget {
  const EyestagramPost({super.key, required this.current});
  final int current;

  @override
  State<EyestagramPost> createState() => _EyestagramPostState();
}

class _EyestagramPostState extends State<EyestagramPost> {
  late bool isLiked;
  late bool isVerified;
  late bool isSponsored;
  late bool expanded;
  late String duration;
  late int likes;
  late int comments;

  @override
  void initState() {
    isLiked = false;
    expanded = false;
    isVerified = Random().nextBool();
    isSponsored = Random().nextBool();
    duration = getDuration();
    likes = getLikes();
    comments = getComments(likes);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String account = brands[widget.current]?['ig_handle'] as String;
    String copy = '';

    String more = brands[widget.current]?['more'] as String;
    String fold = brands[widget.current]?['fold'] as String;
    if (more == 'true') {
      copy = brands[widget.current]?['copy'] as String;
    } else {
      copy = brands[widget.current]?['fold'] as String;
    }

    var formatter = NumberFormat('###,##0');

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 375,
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                turns: const AlwaysStoppedAnimation(90 / 360),
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
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isLiked = !isLiked;
                                likes = isLiked ? likes + 1 : likes - 1;
                              });
                            },
                            icon: SvgPicture.asset(
                              isLiked
                                  ? 'assets/images/icons/unlike.svg'
                                  : 'assets/images/icons/like.svg',
                              height: 24,
                              colorFilter: isLiked
                                  ? const ColorFilter.mode(
                                      Color(0xffff3040), BlendMode.srcIn)
                                  : const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                            ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
                                  padding: const EdgeInsets.only(bottom: 2.0),
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
                          child: (!expanded & (more == 'true'))
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
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
            ]),
      ],
    );
  }
}
