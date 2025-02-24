import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/components/custom_text_widget.dart';
import 'package:mvvm_architecture/view_model/additional/post_view_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {

  PostViewViewModel postViewViewModel = PostViewViewModel();


  @override
  void initState() {
    postViewViewModel.fetchMoviesListApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: 'Post View'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: ChangeNotifierProvider(
        create: (_) => postViewViewModel,
        child: Consumer<PostViewViewModel>(
          builder: (context, value, child) {
            switch (value.userList.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.userList.data!.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: CustomTextWidget(
                            text: value.userList.data!.data![index].id
                                .toString()),
                      ),
                      title: CustomTextWidget(
                          text: value.userList.data!.data![index].firstName
                              .toString()),
                      subtitle: CustomTextWidget(
                          text: value.userList.data!.data![index].email
                              .toString()),
                    );
                  },
                );
              case Status.ERROR:
                return Center(
                  child:
                      CustomTextWidget(text: value.userList.message.toString()),
                );
              default:
                const SizedBox.shrink();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
