import 'package:flutter/widgets.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'binding/main_binding.dart';

final GlobalKey<_MyAppState> globalKeyMyApp = GlobalKey();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(mounted){
      switch (state) {
        case AppLifecycleState.inactive:
          print('appLifeCycleState inactive');
          break;
        case AppLifecycleState.resumed:
          print('appLifeCycleState resumed');
          break;
        case AppLifecycleState.paused:
          print('appLifeCycleState paused');
          break;
        case AppLifecycleState.detached:
          print('appLifeCycleState detached');
          break;
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: globalKeyMyApp,
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
