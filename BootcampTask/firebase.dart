import 'package:firebase/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
FirebaseAuth _auth = FirebaseAuth.instance;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home:  SignInpage()
    );
  }
}
class SignInpage extends StatefulWidget {

  @override
  State<SignInpage> createState() => _SignInpageState();
}
class _SignInpageState extends State<SignInpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
//FirebaseAuth _auth = FirebaseAuth.instance;
void SignInuser (String email , String password)async{
  UserCredential user = await   _auth.signInWithEmailAndPassword(email: email, password: password).catchError((errorMessage){

  });
  if(user != null){
    print(user.user?.uid);
    print(user.user?.email);
    print(user.user?.emailVerified);
  }
  Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding() ));

}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(

                padding: EdgeInsets.all(20),
                child : TextField(
                  controller: emailController,

                  decoration: InputDecoration(

                      border :OutlineInputBorder(),
                      label: Text("Email")
                  ),
                ),
              ),

              Padding(

                padding: EdgeInsets.all(20),
                child :  TextField(
                  obscureText: true,
                  controller: passController,

                  decoration: InputDecoration(
                      border :OutlineInputBorder(),
                      label: Text("password")
                  ),
                ),
              ),
          Padding(

            padding: EdgeInsets.all(20),
            child :
              ElevatedButton(onPressed: (){
                SignInuser(emailController.text , passController.text);
              }, child: Text('Login')))

            ],
          ),
        ),
         // This trailing comma makes auto-formatting nicer for build methods.
    ),
      );
  }
}
class signuppage extends StatefulWidget {
  const signuppage({Key? key}) : super(key: key);

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Padding(

          padding: EdgeInsets.all(20),
          child :
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border :OutlineInputBorder(),
                    label: Text("Email")
                ),
              ),),
        Padding(

          padding: EdgeInsets.all(20),
          child :
              TextField(
                obscureText: true,
                controller: passController,
                decoration: InputDecoration(
                    border :OutlineInputBorder(),
                    label: Text("Password")
                ),
              )),
        Padding(

          padding: EdgeInsets.all(20),
          child :
              ElevatedButton(onPressed: (){
                Signupuser(emailController.text , passController.text);
              }, child: Text('SignUp')))

            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
  void Signupuser  (String email , String password) async{
    UserCredential user =await  _auth.createUserWithEmailAndPassword(email: email, password: password) ;
     //   .catchError((Error message){}
Fluttertoast.showToast(msg: "Your Account is Created!!");
  }
}


