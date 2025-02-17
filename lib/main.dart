import 'package:symphony_app/app/core/constants/imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 771),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Symphony App',
          initialBinding: ApplicationBindings(),
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}