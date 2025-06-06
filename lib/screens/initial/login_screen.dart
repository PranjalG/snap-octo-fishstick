import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:layout/services/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  late AuthenticationBloc authenticationBloc;

  // void onClear() {
  //   passwordController.clear();
  //   mobileNumberController.clear();
  // }
  @override
  void initState() {
    authenticationBloc = AuthenticationBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authenticationBloc,
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          //print('Got state here= $state');
          if (state is AuthenticationSuccess) {
            Navigator.of(context).pushReplacementNamed(RouteId.homeScreen);
          } else if (state is AuthenticationFailure) {
            //print('this is else block');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login Failed:')),
            );
            //Navigator.of(context).pushNamed(RouteId.loginScreen);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.tealAccent,
            body: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal),
                    ),
                    SizedBox(height: 50),
                    const Text("Enter Mobile Number:",
                        textAlign: TextAlign.left),
                    TextFormField(
                      initialValue: state.mobileNum,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      onChanged: (value) =>
                          authenticationBloc.add(AuthDataMobileEntered(value)),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    const Text("Enter Password:"),
                    TextFormField(
                      initialValue: state.password,
                      obscureText: true,
                      maxLength: 15,
                      onChanged: (password) =>
                          authenticationBloc.add(AuthPassWordEntered(password)),
                      decoration: !state.isValid
                          ? InputDecoration(
                              errorText: state.error,
                              errorMaxLines: 4,
                            )
                          : const InputDecoration(hintText: ''),
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: state.isValid
                          ? () => authenticationBloc.add(
                                AuthLoginRequested(),
                              )
                          : null,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(300),
                        foregroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Log In"),
                    ),
                    // ElevatedButton(
                    //   onPressed: onClear,
                    //   style: ElevatedButton.styleFrom(
                    //     fixedSize: const Size.fromWidth(300),
                    //     foregroundColor: Colors.teal,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //   ),
                    //   child: const Text("Clear"),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
