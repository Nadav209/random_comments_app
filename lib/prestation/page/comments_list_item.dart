import 'package:flutter/material.dart';
import 'package:random_comments_app/core/model/comments_model.dart';

class CommentsListItem extends StatelessWidget {
  final CommentsModel? comments;

  const CommentsListItem({Key? key, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 20, right: 20, bottom: 15, left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comments!.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(height: 5),
                    Text(
                      comments!.id.toString(),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      comments!.postId.toString(),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      comments!.email.toString(),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            comments!.body.toString(),
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
    ;
  }
}
