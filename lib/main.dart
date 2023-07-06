import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napp/Layout/NewsLayout.dart';
import 'package:napp/Layout/cubit.dart';
import 'package:napp/Layout/states.dart';
import 'package:napp/Shared/remote/CacheHelper.dart';
import 'package:napp/Shared/remote/DioHelper.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CacheHelper.init();
 bool? Dark=await CacheHelper.GetData(key: 'Dark');
  runApp(NewsApp(Dark));
}
class NewsApp extends StatelessWidget{
  final bool? Dark;
  NewsApp(this.Dark);
  @override
  Widget build(BuildContext context) {
  return MultiBlocProvider(

    providers: [
     BlocProvider(create: (BuildContext context) =>NewsAppCubit()..GetBusiness()..ChangeMode(
    Shared:Dark
    ),)

    ],
    child: BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener:(context,state){},
      builder: (context,state){
        var cubit=NewsAppCubit.get(context);
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                 iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,

                  elevation: 0,
                  titleTextStyle:TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.black54,
                  elevation: 0
              ),
              textTheme: TextTheme(
                  bodyText1:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                  bodyText2: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  )

              ),
            inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey,
            filled: true,
          )
          ),
          darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.black54,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.black54,
                  iconTheme: IconThemeData(color:Colors.white),
                  elevation: 0,
                  titleTextStyle:TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.black54,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.white,
                  elevation: 0
              ),
              textTheme: TextTheme(
                  bodyText1:TextStyle(
                      color:Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                  bodyText2: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  )
              ),
               inputDecorationTheme: InputDecorationTheme(
                 fillColor: Colors.grey[300],
                 filled: true,
               )
          ),
          themeMode:NewsAppCubit.get(context).dark ?ThemeMode.light :ThemeMode.dark,
          home: NewsLayout(),
        );
      },
    ),
  );
  }


}