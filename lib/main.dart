import 'package:ecommerce_samples/Domain/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_samples/Presentation/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => CartBloc(),
      child:  MaterialApp(
        title: 'E-Commerce Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // scaffoldBackgroundColor: const Color(0xffF9F9F9),
          scaffoldBackgroundColor: Colors.white,
          searchBarTheme: const SearchBarThemeData(
              constraints: BoxConstraints(
                minHeight: 40,
                maxHeight: 40,
              )
          ),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
