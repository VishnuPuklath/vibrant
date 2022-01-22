import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String postUrl;
  final String username;
  final String postId;
  final datePublished;
  final String profImage;
  final likes;

  Post(
      {required this.description,
      required this.uid,
      required this.postUrl,
      required this.username,
      required this.datePublished,
      required this.likes,
      required this.postId,
      required this.profImage});

  Map<String, dynamic> toJson() => {
        'description': description,
        'uid': uid,
        'username': username,
        'postId': postId,
        'datePublished': datePublished,
        'profImage': profImage,
        'likes': likes,
        'posUrl': postUrl
      };
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
        description: snapshot['description'],
        uid: snapshot['uid'],
        postId: snapshot['postId'],
        username: snapshot['username'],
        profImage: snapshot['profImage'],
        likes: snapshot['likes'],
        postUrl: snapshot['postUrl'],
        datePublished: snapshot['datePublished']);
  }
}
