import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final packages = [
    'cupertino_icons', 'sleek_circular_slider', 'url_launcher', 'wakelock_plus',
    'shared_preferences', 'fluttertoast', 'flutter_easyloading', 'flutter_mobx', 'mobx', 'audioplayers',
    'package_info_plus', 'quick_actions', 'build_runner', 'mobx_codegen'
  ];
  for (final p in packages) {
    try {
      var req = await HttpClient().getUrl(Uri.parse('https://pub.dev/api/packages/$p'));
      var res = await req.close();
      var body = await res.transform(utf8.decoder).join();
      var json = jsonDecode(body);
      print('$p: ^${json["latest"]["version"]}');
    } catch(e) {
      print('$p: error');
    }
  }
}
