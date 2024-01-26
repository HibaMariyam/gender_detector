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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        
      ),
      body: SafeArea(
           child: Padding(
             padding: const EdgeInsets.symmetric(
              horizontal: 20
             ),
             child: Column(
                     children: [
        
             Text("Do you what to know your gender?",
             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
               fontSize: 30,
               color: Colors.black,
               fontWeight: FontWeight.bold,
               
             ),
             ),
             SizedBox(height: 30),
             Container(
           
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 244, 202, 231),
                  Color.fromARGB(255, 154, 202, 242)
                ])
              ),
               child: TextField(
                 controller: _genderController,
                 decoration: InputDecoration(
                     border: OutlineInputBorder(), hintText: 'Enter your name'),
                
               ),
             ),
             SizedBox(height: 20),
             ElevatedButton(
                 
                 onPressed: () async {
                   context
                       .read<GenderCubit>()
                       .genderDetector(_genderController.text);
                       
                 },
                 style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45),
                  backgroundColor: const Color.fromARGB(169, 255, 193, 7)
                 ),
                 
                 child: Text('Click here',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
    
               fontWeight: FontWeight.w500,
               
             ),
                 )
                 ),
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
                   
                   userGender=state.gender.gender?? "Other";
                   
                 }
                 );
                 
                }
             
               },
               builder: (context,state) {
                 if(state is GenderFailure){
                   return Text(state.msg);
                 }
               
                  if(state is GenderLoading){
                   return CircularProgressIndicator();
                 }
                  return Text(userGender??'Other',
                  
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )
                  );
               }
              
                
                 
               
             ),
             SizedBox(height: 14,),
              if(userGender == 'male')
      Image.asset('assets/images/male1.png',
      height: 50,
      width: 50,
      ),
    if (userGender == 'female')
     Image.asset('assets/images/female1.png',
     height: 50,
      width: 50,
     ),

                     ],
                   ),
           ),
         ),
      );
    
  }
}
