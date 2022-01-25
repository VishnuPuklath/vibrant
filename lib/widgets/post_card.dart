import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final snap;

  const PostCard({required this.snap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(snap['profImage']),
                ),
              ),
              SizedBox(width: 6),
              Text(
                snap['username'],
                style: TextStyle(fontSize: 16),
              ),
            ]),
            Container(
              width: double.infinity,
              height: 400,
              child: Image.network(snap['posUrl']),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Text(snap['description']),
              ),
            ),
            Divider(
              thickness: 3,
            )
          ],
        ),
      ),
    );
  }
}
