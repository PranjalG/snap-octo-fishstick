import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:layout/screens/pagination/post_item.dart';
import 'package:layout/data_models/api_result_data_model.dart';

class Post {
  final String title;
  final String author;
  final String body;

  Post(this.title, this.author, this.body);
}

class PostsOverviewScreen extends StatefulWidget {
  @override
  _PostsOverviewScreenState createState() => _PostsOverviewScreenState();
}

class _PostsOverviewScreenState extends State<PostsOverviewScreen> {
  late bool _isLastPage;
  late int _pageNumber;
  late bool _error;
  late bool _loading;
  final int _numberOfPostsPerRequest = 10;
  late List<Post> _posts;
  final int _nextPageTrigger = 4;

  @override
  void initState() {
    super.initState();
    _pageNumber = 1;
    _posts = [];
    _isLastPage = false;
    _loading = true;
    _error = false;
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await get(Uri.parse(
          "https://openlibrary.org/search.json?q=psychology&page=$_pageNumber&limit=$_numberOfPostsPerRequest"
          // "https://jsonplaceholder.typicode.com/posts?_page=$_pageNumber&_limit=$_numberOfPostsPerRequest"
          ));
      final responseList = json.decode(response.body);
      ApiResultData? resultData = ApiResultData.fromJson(responseList);
      //List<Post> postList = responseList.map((data) => Post(data['author_name'], data['first_sentence'])).toList();
      List<Post>? postList = resultData.docs?.map((data) {
        return Post(
          data.title ?? 'Title',
          data.authorName?[0] ?? 'Author Name',
          data.firstSentence?[0] ?? 'Description',
        );
      }).toList();

      setState(() {
        _isLastPage = (postList!.length < _numberOfPostsPerRequest);
        _loading = false;
        _pageNumber = _pageNumber + 1;
        _posts.addAll(postList);
      });
    } catch (e) {
      print("error --> $e");
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }

  Widget errorDialog({required double size}) {
    return SizedBox(
      height: 180,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'An error occurred when fetching the posts.',
            style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _loading = true;
                  _error = false;
                  fetchData();
                });
              },
              child: const Text(
                "Retry",
                style: TextStyle(fontSize: 20, color: Colors.purpleAccent),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books Trivia"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: buildPostsView(),
    );
  }

  Widget buildPostsView() {
    if (_posts.isEmpty) {
      if (_loading) {
        return const Center(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: CircularProgressIndicator(),
        ));
      } else if (_error) {
        return Center(child: errorDialog(size: 20));
      }
    }
    return ListView.builder(
      itemCount: _posts.length + (_isLastPage ? 0 : 1),
      itemBuilder: (context, index) {
        if (index == _posts.length - _nextPageTrigger) {
          fetchData();
        }
        if (index == _posts.length) {
          if (_error) {
            return Center(child: errorDialog(size: 15));
          } else {
            return const Center(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ));
          }
        }
        final Post post = _posts[index];
        return Padding(
            padding: const EdgeInsets.all(10.0),
            child: PostItem(post.title, post.author, post.body));
      },
    );
  }
}
