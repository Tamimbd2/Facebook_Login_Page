
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

main(){
  runApp(face());
}
class face extends StatelessWidget {
  const face({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: screen(),
    );
  }
}
class screen extends StatelessWidget {
   screen({super.key});


  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (title: Text('Facebook', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Facebook',style: GoogleFonts.montserrat(
              fontSize: 40 ,fontWeight: FontWeight.bold,color: Colors.blueAccent
            ),
            ),


 Form(
     key: _formKey,
     child:
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Column(
          children: [
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'Mobile number or email address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              validator: (value){
                if(value == null || value.isEmpty ){
                  return 'Please enter youur email';
                }else{
                  return null;
                }
              },
            ),


            SizedBox(
              height: 100,
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty ){
                      return 'Please enter youur Password';
                    }else if(value.length <= 5 ){
                      return 'Must be 6 charecter';
                    }else{
                      return null;
                    }
                  },
                )

            ),
            SizedBox(
              height: 40,
             child:

              SizedBox(
                  width: 300,

                  child:

                  ElevatedButton(onPressed: (){

                   if( _formKey.currentState!.validate()){
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text('Login Success')),
                         );
                   }
                  }, child: Text('Login'),)),
            )
          ],
        ),
      ),
    )
 )
          ],
        ),
      ),
    ),

      );

  }
}
