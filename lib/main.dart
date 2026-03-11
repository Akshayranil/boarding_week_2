import 'package:boarding2_machinetask/features/home_screen/data/datasource/product_api.dart';
import 'package:boarding2_machinetask/features/home_screen/data/repository/product_repository_imp.dart';
import 'package:boarding2_machinetask/features/home_screen/domain/usecase/product_usecase.dart';
import 'package:boarding2_machinetask/features/home_screen/presentation/bloc/product/product_bloc.dart';
import 'package:boarding2_machinetask/features/home_screen/presentation/ui/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final remoteDataSource = ProductDataSource(dio: dio);
    final repository = ProductRepositoryImp(api: remoteDataSource);
    final useCase = GetProductUseCase(repository: repository);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (_)=>ProductBloc(useCase)..add(GetCategoriesEvent()),
        child: ProductScreen()),
    );
  }
}
