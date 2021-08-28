part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class PageInitial extends PageState {
  final int buttomNavBar;
  

  PageInitial({this.buttomNavBar = 0});
  @override
  List<Object?> get props => [buttomNavBar];
}
