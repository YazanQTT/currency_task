import 'package:equatable/equatable.dart';


class NavBarState extends Equatable {
  final int selectedScreen;

  const NavBarState({this.selectedScreen = 0});

  @override
  List<Object?> get props => [selectedScreen];
}
