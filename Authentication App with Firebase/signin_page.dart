import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_deneme/home_page.dart';
import 'package:firebase_deneme/login_page.dart';
import 'package:flutter/material.dart';

TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
TextEditingController confirmPasswordController = new TextEditingController();

class SignInPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Colors.white10,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.red,title: Text("ToDoApp"),),
      body: Center(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 75,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
              child: Divider(color: Colors.white38,thickness: 5,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(controller: emailController,
           style: TextStyle(color: Colors.white,),
           decoration: InputDecoration(
                      labelText: "  email",
                      labelStyle: TextStyle(color: Colors.white24),
                      enabledBorder:OutlineInputBorder(
                        borderSide:BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      )
          ),

        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(controller: passwordController,
                      style: TextStyle(color: Colors.white,),
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: " password",
                          labelStyle: TextStyle(color: Colors.white24),
                          enabledBorder:OutlineInputBorder(
                            borderSide:BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(controller: confirmPasswordController,
                      style: TextStyle(color: Colors.white,),
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: " confirm password",
                          labelStyle: TextStyle(color: Colors.white24),
                          enabledBorder:OutlineInputBorder(
                            borderSide:BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),

                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(

                        onPressed: ()async{
                      try{
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                        HomePage.user = emailController.text;
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()) , (route) => false);
                      }
                      catch(e){
                        print(e.toString());
                      }
                    }, child: Text("Sign In"),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(40),
                            primary:Colors.red,
                            shadowColor: Colors.black
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("If you already have an account ",style: TextStyle(color: Colors.white),),
                      InkWell(onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    },

                      child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}