
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napp/Layout/cubit.dart';
import 'package:napp/Layout/states.dart';
import 'package:napp/Shared/component.dart';

class BusinessScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var List=NewsAppCubit.get(context).Business;
        return ConditionalBuilder(
            condition: List.length>0,
            builder: (context)=>ListView.separated(
              physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>BuildRowItem(List[index],context),
                separatorBuilder: (context,index)=>Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                      color: Colors.grey[300]

                  ),

                ),
                itemCount:List.length
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator())
        );
      },

    );
  }

}