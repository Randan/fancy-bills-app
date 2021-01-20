import 'package:flutter/foundation.dart';

abstract class HistoryState {}

class HistoryEmptyState extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistoryLoadedState extends HistoryState {
  List<dynamic> loadedMetersData;
  HistoryLoadedState({@required this.loadedMetersData})
      : assert(loadedMetersData != null),
        super();
}

class HistoryErrorState extends HistoryState {}
