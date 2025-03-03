import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/couter/counter_cubit.dart';
import 'package:radio/couter/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
          children: [
            HomeBodyWidget(name: "a"),
            SizedBox(height: 10),
            HomeBodyWidget(name: "b"),
            SizedBox(height: 10),
            HomeBodyWidget(name: "c"),
          ],
        ),
      ),
    );
  }
}

class HomeBodyWidget extends StatelessWidget {
  final String name;

  const HomeBodyWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        AddBtnWidget(name: name),
        TextWidget(name: name),
        DecBtnWidget(name: name)
      ],
    );
  }
}
class AddBtnWidget extends StatelessWidget {
 final String name;
  const AddBtnWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return   BtnWidget(onPressed: (){
      context.read<CounterCubit>().increment(nameInstant:name);

    },icon: Icons.add,);
  }
}
class DecBtnWidget extends StatelessWidget {
  final String name;

  const DecBtnWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return   BtnWidget(onPressed: (){
      context.read<CounterCubit>().decrement(nameInstant: name);

    },icon: Icons.remove,);
  }
}
class BtnWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;

  const BtnWidget({super.key, this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Icon(icon));
  }
}
class TextWidget extends StatelessWidget {
  final String name;
  const TextWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {


    if(name=='a'){
      return BlocSelector<CounterCubit, CounterStat,int>(
        selector:(state) => state.a ,
        builder: (context, select) {
          print("a");
          return Text(select.toString());
        },
      );
    }
    if(name =='b'){
      return BlocSelector<CounterCubit, CounterStat,int>(
        selector: (state) => state.b,
        builder: (context, select) {
          print("b");
          return Text(select.toString());
        },
      );
    }
    return BlocSelector<CounterCubit, CounterStat,int>(
      selector: (state) => state.c,
      builder: (context, select) {
        print("c");
        return Text(select.toString());
      },
    );

}
}


