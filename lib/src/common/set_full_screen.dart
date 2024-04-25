import 'dart:io';

import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

Future<void> setFullScreen({required bool fullScreen}) async {
  if (fullScreen) {
    if (Platform.isWindows) {
      await WindowManager.instance.ensureInitialized();
      await WindowManager.instance.setFullScreen(true);
    } else if (Platform.isAndroid) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: []);
    } else {
      throw Exception('SetFullScreen ?!');
    }
  } else {
    if (Platform.isAndroid) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    } else {
      await WindowManager.instance.setFullScreen(false);
    }
  }
}
