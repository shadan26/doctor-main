import 'package:doctorproject/7doctor/moduels/bookingmodel/bookingscreen.dart';
import 'package:doctorproject/models/onBoardModel.dart';
import 'package:doctorproject/models/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildServiseItem(context,Map map)=> Column(

  children: [


    CircleAvatar(
      backgroundImage: NetworkImage(
          '${map['image']}'
      ),
      radius: 50,
    ),

    Expanded(
      child: Container(
        width:135 ,

        child: Text(

            '${map['name']}',

            maxLines:1,

            textAlign: TextAlign.center,



            style: Theme.of(context).textTheme.titleMedium!.copyWith(

                fontWeight:FontWeight.bold

            )

        ),

      ),
    )

  ],

);
Widget buildOnlineClinicItem(userModel usermodel,context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(20),
      color: Colors.grey[200],
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(20)

          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image(
            height: 170,
            width: 170,
            image:NetworkImage(
                '${usermodel.image}'
            ),
            fit: BoxFit.cover,),
        ),
        SizedBox(
          width: 7,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name : ${usermodel.name}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontSize: 16

                ),
              ),
              SizedBox(
                height: 7,),
              Text(
                'Major : ${usermodel.major}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: AlignmentDirectional.bottomCenter,

                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadiusDirectional.circular(20)
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: MaterialButton(
                  onPressed:(){

                  },
                  child: Text(
                    'Chating',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )

            ],
          ),
        ),

      ],
    ),
  ),
);
Widget buildInClinicItem(userModel usermodel,context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(20),
      color: Colors.grey[200],
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(20)

          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image(
            height: 170,
            width: 170,
            image:NetworkImage(
                '${usermodel.image}'
            ),
            fit: BoxFit.cover,),
        ),
        SizedBox(
          width: 7,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name : ${usermodel.name}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontSize: 16

                ),
              ),
              SizedBox(
                height: 7,),
              Text(
                'Major : ${usermodel.major}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadiusDirectional.circular(20)
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: MaterialButton(
                  onPressed:(){
                    switch(usermodel.id){
                      case 1:
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookScreen(
                          token: usermodel.token,
                          id: usermodel.id ,
                          status: usermodel.status,
                          name: usermodel.name,
                          major: usermodel.major,
                          email: usermodel.email,
                          phone: usermodel.phone,
                          dateOfBirth: usermodel.date,
                          description: usermodel.cv,
                          image: usermodel.image,
                          uid: usermodel.uid,
                        )));
                        break;
                      case 2:
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookScreen(
                          token: usermodel.token,
                          id: usermodel.id ,
                          status: usermodel.status,
                          name: usermodel.name,
                          major: usermodel.major,
                          email: usermodel.email,
                          phone: usermodel.phone,
                          dateOfBirth: usermodel.date,
                          description: usermodel.cv,
                          image: usermodel.image,
                          uid: usermodel.uid,
                        )));
                        break;
                      case 3:
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookScreen(
                          id: usermodel.id,
                          status: usermodel.status,
                          token: usermodel.token,
                          name: usermodel.name,
                          major: usermodel.major,
                          email: usermodel.email,
                          phone: usermodel.phone,
                          dateOfBirth: usermodel.date,
                          description: usermodel.cv,
                          image: usermodel.image ,
                          uid: usermodel.uid,
                        )));
                        break;
                      case 4:
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookScreen(
                          id: usermodel.id,
                          status: usermodel.status,
                          name: usermodel.name,
                          token: usermodel.token,
                          major: usermodel.major,
                          email: usermodel.email,
                          phone: usermodel.phone,
                          dateOfBirth: usermodel.date,
                          description: usermodel.cv,
                          image: usermodel.image ,
                          uid: usermodel.uid,
                        )));
                        break;
                      case 5:
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookScreen(
                          id: usermodel.id,
                          status: usermodel.status,
                          name: usermodel.name,
                          token: usermodel.token,
                          major: usermodel.major,
                          email: usermodel.email,
                          phone: usermodel.phone,
                          dateOfBirth: usermodel.date,
                          description: usermodel.cv,
                          image: usermodel.image,
                          uid: usermodel.uid,
                        )));
                        break;
                      case 6:
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookScreen(
                          id: usermodel.id,
                          status: usermodel.status,
                          name: usermodel.name,
                          major: usermodel.major,
                          token: usermodel.token,
                          email: usermodel.email,
                          phone: usermodel.phone,
                          dateOfBirth: usermodel.date,
                          description: usermodel.cv,
                          image: usermodel.image,
                          uid: usermodel.uid,
                        )));
                        break;
                      case 7:
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookScreen(
                          id: usermodel.id,
                          name: usermodel.name,
                          major: usermodel.major,
                          email: usermodel.email,
                          token: usermodel.token,
                          phone: usermodel.phone,
                          dateOfBirth: usermodel.date,
                          description: usermodel.cv,
                          image: usermodel.image,
                          uid: usermodel.uid, status: usermodel.status,
                        )));
                        break;

                    }
                  },
                  child: Text(
                    'Booking',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )

            ],
          ),
        ),

      ],
    ),
  ),
);
Widget buildPageViewItem(OnBoard board,context)=> Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Image(
          image: AssetImage(
              '${board.image}'
          )),
    ),
    Text(
        '${board.title}',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.black
        )
    ),

  ],
);


