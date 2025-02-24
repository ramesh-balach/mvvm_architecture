import 'package:flutter/material.dart';
import 'package:mvvm_architecture/data/response/status.dart';
import 'package:mvvm_architecture/res/app_colors.dart';
import 'package:mvvm_architecture/res/components/custom_text_widget.dart';
import 'package:mvvm_architecture/routes/app_routes.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/view_model/home_view_view_model.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomTextWidget(
            text: 'Home View',
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          actions: [
            IconButton(
                onPressed: () async {
                  await UserViewModel().removeUser();
                  Navigator.pushNamed(context, AppRoutes.loginView);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: ChangeNotifierProvider(
          create: (_) => homeViewViewModel,
          child: Consumer<HomeViewViewModel>(
            builder: (context, value, child) {
              switch (value.moviesList.status) {
                case Status.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.COMPLETED:
                  return ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: (context, index) => ListTile(
                      style: ListTileStyle.drawer,
                      leading: Image.network(
                        height: 50, width: 30,
                        value.moviesList.data!.movies![index].posterurl
                            .toString(),
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                      title: CustomTextWidget(
                          text: value.moviesList.data!.movies![index].title
                              .toString()),
                      subtitle: CustomTextWidget(
                          text: value.moviesList.data!.movies![index].year
                              .toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          CustomTextWidget(
                              text: Utils.calculateAverage(value.moviesList
                                      .data!.movies![index].ratings!)
                                  .toStringAsFixed(1))
                        ],
                      ),
                    ),
                  );
                case Status.ERROR:
                  return CustomTextWidget(
                      text: value.moviesList.message.toString());
                default:
                  return SizedBox.shrink();
              }
            },
          ),
        )
        //
        );
  }
}
