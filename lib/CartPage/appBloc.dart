//AppBloc, which can be used as a gatekeeper

import 'cartListBloc.dart';
import 'listTileColorBloc.dart';

class AppBloc {
  CartListBloc _bloc;
  ColorBloc _colorBloc;

  AppBloc()
      : _bloc = CartListBloc(),
        _colorBloc = ColorBloc();

//getters to access our blocs.
  CartListBloc get cartBloc => _bloc;
  ColorBloc get colorBloc => _colorBloc;
}