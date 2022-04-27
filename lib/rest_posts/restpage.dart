import 'package:ecom/rest_posts/fetchdata.dart';
import 'package:ecom/rest_posts/rest_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestPage extends StatefulWidget {
  const RestPage({Key? key}) : super(key: key);

  @override
  State<RestPage> createState() => _RestPageState();
}

class _RestPageState extends State<RestPage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await FetchData().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FetchingData')),
      body: Scrollbar(
          child: Visibility(
            visible: isLoaded,
            child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CupertinoColors.systemGrey4,
                          boxShadow: const [
                            BoxShadow(
                            color: CupertinoColors.systemGrey5,
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(1, 2)
                          )],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(48), // Image radius
                            child: Image.asset('assets/images/backpack.jpg', fit: BoxFit.cover),
                          ),
                        ),
                  ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts![index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              posts![index].body ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
                },
            ),
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
          )
      ),
    );
  }
}
