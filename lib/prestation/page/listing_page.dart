import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:random_comments_app/controller/listing_controller.dart';
import 'package:random_comments_app/prestation/page/add_comment_page.dart';
import 'package:random_comments_app/prestation/page/comments_list_item.dart';


class ListingPage extends StatelessWidget {
  const ListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCommentPage())),
              icon: Icon(Icons.add_comment_outlined)),
          title: const Text("Comments"),
        ),
        body: GetBody(),
      ),
    );
  }
}

class GetBody extends StatefulWidget {
  @override
  State<GetBody> createState() => _GetBodyState();
}

class _GetBodyState extends State<GetBody> {
  final _controller = Get.find<ListingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => LazyLoadScrollView(
        onEndOfPage: _controller.loadNextPage,
        isLoading: _controller.lastPage,
        child: ListView.builder(
            itemCount: _controller.comments.length,
            itemBuilder: (context, index) {
              final comments = _controller.comments[index];
              return CommentsListItem(
                comments: comments,
              );
            })));
  }
}
