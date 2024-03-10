import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/presentations_layer/login_screen.dart';
import 'business_logic_layer/products_cubit/products_cubit.dart';
import 'data_layer/global_data/repository/products_repo.dart';
import 'data_layer/global_data/web_services/web_services.dart';


void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(ProductsRepo(WebServices())),
      child:  MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
