

import 'package:doctorproject/7doctor/cubit/cubit.dart';
import 'package:doctorproject/7doctor/cubit/state.dart';
import 'package:doctorproject/7doctor/moduels/bookingmodel/bookingscreen.dart';
import 'package:doctorproject/models/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NurseScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorState>(
      listener: (context,DoctorState){

      },
      builder: (context,DoctorState){
        var cubit=DoctorCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text(
                  'Nurses'
              ),
            ),
            body: ListView.separated(
                itemBuilder: (context,index)=>BuildNurseItem(cubit.nurses[index],context),
                separatorBuilder: (context,index)=>SizedBox(
                  height: 10,
                ),
                itemCount: cubit.nurses.length)
        );
      },
    );
  }

}
Widget BuildNurseItem(userModel model,context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadiusDirectional.circular(20)
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Row(
      children: [
        Image(
            height: 170,
            width: 170,
            fit: BoxFit.cover,
            image:NetworkImage(
                '${model.image}'
            )),
        SizedBox(
          width: 7,
        ),
        Container(
          height: 170,
          padding: EdgeInsetsDirectional.only(
              bottom: 10,
              start: 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                  'Name : ${model.name} '
              ),
              Text(
                  'Major : ${model.major} '
              ),
              Spacer(),
              Container(

                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadiusDirectional.circular(20)
                ),
                child: MaterialButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BookScreen(
                      name: model.name,
                      major: model.major,
                      email: model.email,
                      phone: model.phone,
                      dateOfBirth: model.date,
                      description: model.cv,
                      image: model.image,
                      uid: model.uid, id: model.id, token: model.token, status: model.status,)));

                },
                  child: const Text(
                    'Book Nurse',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),),
              )
            ],
          ),
        )
      ],
    ),
  ),
);