import 'package:animated_card_custom/bloc/character/character_bloc.dart';
import 'package:animated_card_custom/bloc/origin/origin_bloc.dart';
import 'package:animated_card_custom/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future<void> main()async  {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppState());
}



class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      
      BlocProvider(create: (_) => CharacterBloc()),
      BlocProvider(create: (_) => OriginBloc()),
     
    ], child: const MainApp());
  }
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      //quitar el banner de debug
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
     theme: ThemeData.dark(),


      
    );
  }
}



