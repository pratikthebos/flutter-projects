import '../models/history_model.dart';

class HistoryService {
  final List<HistoryModel> _history = [];

  List<HistoryModel> getHistory() {
    return _history.reversed.toList();
  }

  void addHistory(
      HistoryModel history,
      ) {
    _history.add(history);
  }

  void clearHistory() {
    _history.clear();
  }
}