import 'package:flutter/material.dart';
import 'app.dart';

import 'di/app_injector.dart';


void main(){
  AppInjector.create();
  runApp(App());
}

