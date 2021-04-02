import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tubes_apb_nih/data/cubit/cubit.dart';
import 'package:tubes_apb_nih/data/providers/cart_provider.dart';
import 'package:tubes_apb_nih/view/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => UserCubit()),
          BlocProvider(create: (_) => FoodCubit()),
          BlocProvider(create: (_) => TransactionCubit()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: OnBoardingPage(),
        ),
      ),
    );
  }
}
