import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:metronomelutter/global_data.dart';
import 'package:metronomelutter/pages/home_page.dart';
import 'package:metronomelutter/store/index.dart';

import 'utils/shared_preferences.dart';

void main() async {
  // 确保初始化,否则访问 SharedPreferences 会报错
  WidgetsFlutterBinding.ensureInitialized();

  GlobalData.sp = (await SpUtil.getInstance())!;
  initSoundType();
  initBpm();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '节拍器',
      // 右上角不显示 debug 横幅
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
              fillColor: Colors.grey.shade50,
            ),
        colorScheme: ColorScheme.fromSwatch(brightness: Brightness.light).copyWith(secondary: Colors.blue),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark).copyWith(secondary: Color.fromRGBO(134, 165, 255, 1)),
      ),
      themeMode: ThemeMode.system,
      home: MyHomePage(),
      builder: EasyLoading.init(),
      // home: example01,
    );
  }
}

initSoundType() {
  int? soundType = GlobalData.sp.getInt('soundType');
  print('get sound type $soundType');
  if (soundType != null) appStore.setSoundType(soundType);
}

initBpm() {
  int? spRes = GlobalData.sp.getInt('bpm');
  print('get bpm $spRes');
  if (spRes != null) appStore.setBpm(spRes);
}
