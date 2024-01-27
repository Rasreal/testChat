part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<HomeChatsModel> chats;
  HomeLoadedSuccessState(this.chats);
}

class HomeLoadedErrorState extends HomeState {}

class HomeNavChatPageActionState extends HomeActionState {}
