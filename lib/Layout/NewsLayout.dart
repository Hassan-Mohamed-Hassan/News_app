import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napp/Layout/cubit.dart';
import 'package:napp/Layout/states.dart';
import 'package:napp/Modules/SearchScreen.dart';
import 'package:napp/Shared/component.dart';

class NewsLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              title:Text(
                'NewsApp',
              ),
            actions: [
              IconButton(
                  onPressed: (){
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search)
              ),
              IconButton(
                  onPressed: (){
                    NewsAppCubit.get(context).ChangeMode();
                    NewsAppCubit.get(context).GetBusiness();
                  },
                  icon: Icon(Icons.brightness_4_outlined)
              ),


            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type:BottomNavigationBarType.fixed,
            currentIndex: cubit.CurrentIndex,
            onTap: (index){
             cubit.ChangeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.business
                  ),
                  label: "Business"

              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.sports
                  ),
                  label: "Sports"

              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.science
                  ),
                  label: "Science"

              ),
            ],
          ),
          body: cubit.Screen[cubit.CurrentIndex],
        );
      },

    );
  }



}