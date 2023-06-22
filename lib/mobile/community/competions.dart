import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/community/cubit/cubit.dart';
import 'package:projects/mobile/community/cubit/state.dart';

class Competions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommunityScreenCubit>(
      create: (context) => CommunityScreenCubit(),
      child: BlocConsumer<CommunityScreenCubit, CommunityScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Expanded(
              child: Center(
                  child: Text(
            "Competions",
            style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
          )));
        },
      ),
    );
  }
}
