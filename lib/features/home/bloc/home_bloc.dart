import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
    // await Future.delayed(Duration(seconds: 3));
    // emit(HomeLoadedSuccessState(GroceryData.products.map((e) =>
    //     ProductDataModel(
    //         id: e['id'],
    //         name: e['name'],
    //         category: e['category'],
    //         description: e['description'],
    //         price: e['price'],
    //         imageUrl: e['image'])).toList()));
  }
  FutureOr<void> homeChatClickNavEvent(HomeChatClickNavEvent event, Emitter<HomeState> emit) {
    print("Chat Nav click");
    emit(HomeNavChatPageActionState());
  }
}
