import 'package:flutter/material.dart';

import 'src/injection_container.dart' as di;
import 'src/app.dart';

void main() async {
  runApp(const MyApp());

  await di.init();
}
