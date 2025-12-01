import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'main_bloc.dart';

onThemeChange(
  event,
  emit,
  MainState Function() supraState,
) async {
  LocalStorage storage = LocalStorage('theme_config.json');
  await storage.ready;
  storage.setItem('isDark', !supraState().isDark);
  emit(supraState().copyWith(
    isDark: !supraState().isDark,
  ));
}

onThemeColorChange(
  event,
  emit,
  MainState Function() supraState,
) async {
  Color c = event.color;
  LocalStorage storage = LocalStorage('theme_config.json');
  await storage.ready;
  storage.setItem('alpha', c.alpha);
  storage.setItem('red', c.red);
  storage.setItem('green', c.green);
  storage.setItem('blue', c.blue);
  // print(event.color);
  emit(supraState().copyWith(
    themeColor: event.color,
  ));
}

themeLoader(
  event,
  emit,
  MainState Function() supraState,
) async {
  LocalStorage storage = LocalStorage('theme_config.json');
  await storage.ready;
  // SharedPreferences shared = await SharedPreferences.getInstance();
  bool? testRead = storage.getItem('isDark');
  // print('testRead: $testRead');
  emit(supraState().copyWith(
    isDark: testRead,
  ));
}

themeColorLoader(
  event,
  emit,
  MainState Function() supraState,
) async {
  LocalStorage storage = LocalStorage('theme_config.json');
  await storage.ready;
  // SharedPreferences shared = await SharedPreferences.getInstance();
  int alpha = storage.getItem('alpha') ?? 255;
  int red = storage.getItem('red') ?? 0;
  int green = storage.getItem('green') ?? 0;
  int blue = storage.getItem('blue') ?? 181;
  // Color testcolorStrgin = Color.fromARGB(alpha, red, green, blue);
  // print(testcolorStrgin);
  emit(supraState().copyWith(
    themeColor: Color.fromARGB(alpha, red, green, blue),
  ));
}
