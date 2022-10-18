import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/di.dart';

void main() async {
  await initAppModule();
  runApp(MyApp());
}
