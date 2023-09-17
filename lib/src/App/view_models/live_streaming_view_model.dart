import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class LiveStreamingViewModel extends ChangeNotifier {
  void copyToClipboard(String text) {
    // Copy text to clipboard
    Clipboard.setData(ClipboardData(text: text));
  }
}
