import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user/user_cubit.dart';
import '../data/repo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => UserCubit(Repo()),

      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Builder(
            builder: (context) {
              print("object");
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<UserCubit, UsrState>(
                      buildWhen: (previous, current) {
                        return current is UsrLoading;
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            context.read<UserCubit>().login('ddd', '10120');
                          },
                          child: Text(state is UsrLoading ?"Loading":'Login'),
                        );
                      },
                    ),
                    BlocBuilder<UserCubit, UsrState>(
                      builder: (context, state) {
                        if (state is UserInitial) {
                          return Container();
                        } else if (state is UsrLoading) {
                          return CircularProgressIndicator();
                        } else if (state is UsrSuccess) {
                          return Text('Success');
                        } else if (state is UsrFailure) {
                          return Text('Failure');
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}

