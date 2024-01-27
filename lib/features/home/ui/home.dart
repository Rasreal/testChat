import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../bloc/home_bloc.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
      },
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.redAccent,
                  strokeWidth: 5,
                ),
              ),
            );
            break;
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text("Чаты"),
              ),
              body: ListView.builder(
                  itemCount: successState.chats.length,
                  itemBuilder: (context, index) {
                    return null;
                  }),
            );
          case HomeLoadedErrorState:
            return const Scaffold(
              body: Center(
                child: Text(
                    "Error caught, please wait or try again. \nSorry for the inconvenience"),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
