import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:test_chat/features/home/ui/chats_tile.dart";
import "package:test_chat/styles/text_styles.dart";

import "../bloc/home_bloc.dart";
import "../model/home_chats_model.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
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
      listener: (context, state) {},
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

            final List<HomeChatsModel> chats = successState.chats;

            // Filter the chats based on the search input
            List<HomeChatsModel> filteredChats = chats.where((chat) {
              String fullName = "${chat.fName} ${chat.lName}".toLowerCase();
              String searchInput = searchController.text.toLowerCase();
              return fullName.contains(searchInput);
            }).toList();
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  "Чаты",
                  style: hStyle,
                ),
              ),
              body: ListView.builder(
                  itemCount: searchController.text.isEmpty ? successState.chats.length+1 : filteredChats.length+1,
                  itemBuilder: (context, index) {

                    if(index == 0){
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.079,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 2.0,
                              ),
                              child: TextField(
                                focusNode: searchFocusNode,
                                controller: searchController,
                                decoration: InputDecoration(
                                  hintText: "Поиск",
                                  prefixIcon: Icon(Icons.search),
                                  filled: true,
                                  fillColor: Color(0xFFEDF2F6), // Grey-blue color
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onTapOutside: (a){
                                  searchFocusNode.unfocus();
                                },
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            color: Color.fromRGBO(169, 169, 169, 0.2),
                          ),
                        ],
                      );
                    }
                    return ChatTile(chatInfo: searchController.text.isEmpty ? successState.chats[index-1] : filteredChats[index-1]);
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
