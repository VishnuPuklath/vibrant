import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(
    //     icon: Icon(Icons.upload),
    //     onPressed: () {},
    //   ),
    // );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          title: Text(
            'Post It',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Post',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1642478872194-855316ae300c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Write your thoughts',
                          border: InputBorder.none),
                      maxLines: 8,
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: AspectRatio(
                      aspectRatio: 487 / 451,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1642478853338-001b8e81a2c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 5,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
