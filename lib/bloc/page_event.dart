part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class PageTapped extends PageEvent {
  final int buttomNavBar;

  PageTapped({this.buttomNavBar = 0});

  @override
  List<Object?> get props => [buttomNavBar];
}
