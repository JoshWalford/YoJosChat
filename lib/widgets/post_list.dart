import 'package:flutter/material.dart';

import '../utils/placeholder/post.dart';

class PostList extends StatelessWidget {
  const PostList({
    required this.posts,
    super.key,
  });

  final List<Post> posts;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(posts[index].body),
            ],
          ),
        ),
      ),
    );
  }
}
