import 'dart:math';

import 'package:fakestagram/presentation/widgets/likes.dart';
import 'package:fakestagram/presentation/widgets/random_image.dart';
import 'package:fakestagram/presentation/widgets/user_image.dart';
import 'package:flutter/material.dart';

import '../../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: Column(children: <Widget>[
        buildHeader(),
        buildImage(),
        buildActions(),
        buildLikes()
      ]),
    );
  }

  Widget buildImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: RandomImage(
          media: 'https://picsum.photos/id/${Random().nextInt(80)}/200'),
    );
  }

  Widget buildHeader() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 20),
                child: UserImage(
                  image: post.avatar,
                  radio: 16,
                  width: 38,
                ),
              ),
              const Text(
                'User name',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 25),
          child: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget buildActions() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10, left: 20),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Icon(
                Icons.send,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 25),
          child: Icon(
            Icons.bookmark_outline,
            color: Colors.white,
            size: 24,
          ),
        )
      ],
    );
  }

  Widget buildLikes() {
    return Row(
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20, top: 5),
          child: Likes(),
        ),
      ],
    );
  }
}
