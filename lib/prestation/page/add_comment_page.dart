import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:random_comments_app/core/constant.dart';
import 'package:random_comments_app/core/form_builder.dart';
import 'package:dio/dio.dart';
import 'package:random_comments_app/core/model/add_comments_model.dart';

class AddCommentPage extends StatelessWidget {
  const AddCommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context, true),
            icon: Icon(Icons.cancel_outlined)),
        title: const Text("AddComment"),
      ),
      body: GetBody(),
    );
  }
}

class GetBody extends StatefulWidget {
  final Dio? dio;

  const GetBody({Key? key, this.dio}) : super(key: key);

  @override
  State<GetBody> createState() => _GetBodyState();
}

class _GetBodyState extends State<GetBody> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  AddCommentsModel addCommentsModel = AddCommentsModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: FormBuilder(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                      SizedBox(height: 50.0),
                      Text("Complete the form to add a comment"),
                      RegisterTextField(
                        controller: _titleController,
                        labelName: "title *",
                        hintText: "title:",
                        icon: Icon(
                          Icons.title_outlined,
                          color: Colors.blue,
                        ),
                      ),
                      RegisterTextField(
                        controller: _descriptionController,
                        labelName: "description *",
                        hintText: "description:",
                        icon: Icon(
                          Icons.description_outlined,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      MaterialButton(
                          color: Colors.blue,
                          child: Text("Add"),
                          onPressed: () {
                            sendDataComments();
                          }),
                    ])))));
  }

  void sendDataComments() async {
    addCommentsModel = AddCommentsModel(
        title: _titleController.text, description: _descriptionController.text);
    var response = await widget.dio!.post(addHost,
        data: addCommentsModel,
        options: Options(
          headers: {"Content-type": "application/json"},
        ));

    print(response.data);
    return (response.data);
  }
}
