import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctorproject/7doctor/cubit/cubit.dart';
import 'package:doctorproject/7doctor/cubit/state.dart';
import 'package:doctorproject/7doctor/homescreen/homescreen.dart';
import 'package:doctorproject/7doctor/moduels/chatModel/chatScreen.dart';
import 'package:doctorproject/7doctor/moduels/settingmodel/settingScreen.dart';
import 'package:doctorproject/7doctor/moduels/timemodel/timescreen.dart';
import 'package:doctorproject/models/usermodel.dart';
import 'package:doctorproject/shared/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorState>(
      listener: (context,DoctorState){
      },
      builder: (context,DoctorState){
        DoctorCubit cubit=DoctorCubit.get(context);
        var modell=DoctorCubit.get(context).model;
        return   Scaffold(
          appBar: AppBar(
            title: Text(
              'Message Screen',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:cubit.currentIndex,
            onTap: (index){
              cubit.changeCureentIndex(index);
              if(cubit.currentIndex==0){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
              }
              else if(cubit.currentIndex==1){

                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>TimeScreen()), (route) => false);




              }
              else if(cubit.currentIndex==2)
              {
                cubit.getAllUsers();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MessageScreen()), (route) => false);
              }
              else
                {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SettingScreen()), (route) => false);


                }
            },
            items: [
              BottomNavigationBarItem(
                  icon:Icon(
                      Icons.home
                  ),
                  label: 'Home'

              ),
              BottomNavigationBarItem(
                  icon:Icon(
                      Icons.watch_later_rounded
                  ),
                  label: 'Time'

              ),
              BottomNavigationBarItem(
                  icon:Icon(
                      Icons.chat
                  ),
                  label: 'Message'

              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.settings
                  ),
                  label: 'Setting'

              ),

            ],
          ),
          body: ConditionalBuilder(
            condition:modell!.status=='user',
            builder:(context)=>ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder:(context,index)=> buildChatItem(context,DoctorCubit.get(context).doctors[index]),
                separatorBuilder: (context,index)=>Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 20
                  ),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                itemCount: DoctorCubit.get(context).doctors.length),
            fallback:(context)=>ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder:(context,index)=> buildChatItem(context,DoctorCubit.get(context).users[index]),
                separatorBuilder: (context,index)=>Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 20
                  ),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                itemCount: DoctorCubit.get(context).users.length),
          ),

        );
      },

    );

  }
  Widget buildChatItem(context,userModel model)=>InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(usermodel: model,)));


    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage:NetworkImage(
                '${model.image}'
            ),
            radius: 40,
          ),
          SizedBox(
            width:10 ,
          ),
          Text(
              '${model.name}'
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 7,
          )
        ],
      ),
    ),
  );

}