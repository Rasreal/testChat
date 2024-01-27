import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_chat/data/chats_data.dart';
import 'package:test_chat/features/home/model/home_chats_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeChatClickNavEvent>(homeChatClickNavEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(ChatsData.chats.map((e) =>
        HomeChatsModel(
            id: e['id'],
            fName: e['firstName'],
            lName: e['lastName'],
            lastMessagedMe: e['lastMessagedMe'],
            lastMessaged: e['lastMessaged'],
            imageUrl: e['imageUrl'])).toList()));
  }
  FutureOr<void> homeChatClickNavEvent(HomeChatClickNavEvent event, Emitter<HomeState> emit) {
    print("Chat Nav click");
    emit(HomeNavChatPageActionState());
  }
}
