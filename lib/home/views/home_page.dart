import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_detector/home/cubit/gender_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _genderController = TextEditingController();
  String userGender='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                    children: [
            Text("do you what to know your gender?"),
            SizedBox(height: 20),
            TextField(
              controller: _genderController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter your name'),
             
            ),
            Text('Click on the button'),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  context
                      .read<GenderCubit>()
                      .genderDetector(_genderController.text);
                      
                },
                child: Text('Know your gender')),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<GenderCubit, GenderState>(
              listener: (context, state) {
               if(state is GenderFailure){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error')));
               }
               if(state is GenderSuccess){
            
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gender detected')));
                setState(() {
                  
                  userGender=state.gender.gender ?? "Other";
                  
                }
                  
                
                );
                
               }
            
              },
              builder: (context,state) {
                if(state is GenderFailure){
                  return Text(state.msg);
                }
                
                // state is GenderLoading
                // ?CircularProgressIndicator()
      
                //:Text(userGender??'');
                 if(state is GenderLoading){
                  return CircularProgressIndicator();
                }
                 return Text(userGender??'');
              }
             
               
                
              
            )
                    ],
                  ),
          )),
    );
  }
}
