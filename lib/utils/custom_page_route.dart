import 'package:flutter/cupertino.dart';

class CustomMaterialPageRoute extends CupertinoPageRoute {
  CustomMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool maintainState = true,
    bool fulldcreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fulldcreenDialog,
        );

  @override
  bool get hasScopedWillPopCallback {
    return false;
  }
}
