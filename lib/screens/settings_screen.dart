import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:layout/services/routes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account Settings'),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: BlocProvider(
            create: (context) => AuthenticationBloc(),
            child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationSuccess) {
                  Navigator.of(context).pushNamed(RouteId.homeScreen);
                } else if (state is AuthenticationFailure) {
                  Navigator.of(context).pushNamed(RouteId.loginScreen);
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(AuthLogoutRequested());
                    Navigator.of(context).pushNamed(RouteId.moreOptionsScreen);
                  },
                  child: Text("Logout"),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
