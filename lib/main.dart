import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynotes/views/login_view.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("building");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 233, 0, 0)),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
            case ConnectionState.active:
              // Show a loading indicator while Firebase is initializing
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              // Firebase initialization is complete, show the registration form
              return Column(
                children: [
                  TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Enter your email",
                    ),
                  ),
                  TextField(
                    controller: _password,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter your password",
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email, password: password);
                        print(userCredential);

                      } 
                      on FirebaseAuthException catch (e){
                        if(e.code == "weak-password"){
                          print("weak password");
                        }
                        else{
                          if(e.code == "email-already-in-use"){
                            print("email already in use");
                          }
                          else if(e.code == "invalid-email"){
                              print("invalid email entered");
                          }
                        }
                      }
                    },
                    child: const Text('Register'),
                  ),
                ],
              );
            default:
              // Handle any unexpected connection states
              return const Center(
                child: Text("Something went wrong"),
              );
          }
        },
      ),
    );
  }
}


