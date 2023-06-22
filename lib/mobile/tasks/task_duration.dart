import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/home/app_cubit/state.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/mobile/tasks/time_text_format.dart';
import 'package:projects/shared/component/component.dart';

class TaskDurationScreen extends StatelessWidget {
  const TaskDurationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("Task duration",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xfff2f2f2),
                    radius: (MediaQuery.of(context).size.width / 3),
                    child: CircleAvatar(
                      backgroundColor: Color(0xfffd6923),
                      radius: (MediaQuery.of(context).size.width / 3) - 18,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20,
                            width: 1,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 1,
                                width: 20,
                                color: Colors.black,
                              ),
                              Expanded(
                                  child: mainContainer(
                                      colorOfTheBorder: Colors.grey,
                                      color: Colors.white.withOpacity(0.3),
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                            HomeCubit.get(context)
                                                .duration
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge),
                                      ))),
                              Container(
                                height: 1,
                                width: 20,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: HomeCubit.get(context).timeController,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      HomeCubit.get(context).changeTaskDuration(time: value);
                      print("---------");
                      print(value);
                    },
                    keyboardType:
                    TextInputType.numberWithOptions(decimal: false),
                    decoration: InputDecoration(
                        hintText: '00:00:00',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        fillColor: Color(0xffe2f4ff),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                    inputFormatters: <TextInputFormatter>[
                      TimeTextInputFormatter()
                      // This input formatter will do the job
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: mainTextButton(
                          context: context,
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                          radius: 25,
                          backgroundColor: Color(0xfffd6923),
                          borderColor: Color(0xfffd6923),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
