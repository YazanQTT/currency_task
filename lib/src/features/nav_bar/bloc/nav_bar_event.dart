abstract class NavBarEvent {}

class NavBarScreenChanged extends NavBarEvent {
  final int index;
  NavBarScreenChanged({required this.index});
}
