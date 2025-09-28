import 'package:flutter/foundation.dart';

class Notifier extends ChangeNotifier {
  void update() => notifyListeners();
}
