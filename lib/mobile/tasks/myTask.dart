import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/edit/cubit/state.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/mobile/tasks/SheetWedgit.dart';
import 'package:projects/mobile/tasks/cubit/cubit.dart';
import 'package:projects/mobile/tasks/cubit/state.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class MyTask extends StatelessWidget {
  MyTask({Key? key}) : super(key: key);




  //DateTime _Date=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksCubit>(
      create:(context)=>TasksCubit(),
      child: BlocConsumer<TasksCubit,TasksStates>(
        listener: (context,state){},
        builder:(context,state) {
         return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: TasksCubit.get(context: context).editFormKey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                  //color: Colors.cyan,
                                  height: 130,
                                  width: double.infinity,
                                  padding: EdgeInsets.all(30.0),
                                  alignment: Alignment.bottomRight,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "assets/icons/Pathtask.png"))),
                                  child: Center(
                                    child: Text(
                                      "Task",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            "assets/icons/taskimg.png",
                            width: 134.89,
                            height: 144,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Task Info : ",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black)),
                          Divider(
                            height: 26,
                            color: Colors.grey,
                          ),
                          InkWell(
                            onTap: () {
                              //  mySheet(context: context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.timer_outlined),
                                      onPressed: () {},
                                      iconSize: 20,
                                    ),
                                    Text(
                                      "${TasksCubit.get(context: context).defultEdit}",
                                      style: TextStyle(
                                          color: Colors.lightBlueAccent,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),

                                //SizedBox(width: MediaQuery.of(context).size.width/2.7,),
                                Container(
                                  width: 159,
                                  height: 33,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(135, 199, 255, 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        focusColor: Colors.orange,

                                        borderRadius: BorderRadius.circular(13),
                                        hint: Text("30 min",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13)),
                                        //hint:Text("Kind",style: TextStyle(color: Colors.lightBlueAccent),),
                                        value: TasksCubit.get(context: context).durationitemEdit,
                                        //alignment: Alignment.center,
                                        dropdownColor:
                                            Color.fromRGBO(242, 199, 130, 1),
                                        isExpanded: true,
                                        elevation: 8,
                                        //isDense: true,
                                        iconDisabledColor: Colors.black,
                                        //underline: null,

                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                        icon:
                                            const Icon(Icons.keyboard_arrow_down),
                                        iconEnabledColor: Colors.black,
                                        items: TasksCubit.get(context: context).DurationListEdit.map((item) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14),
                                            ),
                                            value: item,
                                          );
                                        }).toList(),

                                        onChanged: (newVal) {
                                          TasksCubit.get(context: context).editTaskDuration(value: newVal);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 26,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("State",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25)),
                              DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint: Text("Active",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 25)),
                                  value:TasksCubit.get(context: context).selectedstateItemEdit,
                                  //alignment: Alignment.center,
                                  dropdownColor: Colors.white,
                                  //isExpanded:true,
                                  elevation: 8,
                                  //isDense: true,
                                  iconDisabledColor: Colors.grey,
                                  //underline: null,

                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_up_sharp,
                                    color: Colors.green,
                                  ),
                                  iconSize: 25,
                                  //focusColor: C,
                                  iconEnabledColor: Colors.green,
                                  items: TasksCubit.get(context: context).StateListEdit.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 25),
                                      ),
                                      value: item,
                                    );
                                  }).toList(),

                                  onChanged: (newVal) {
                                    TasksCubit.get(context: context).editTaskSelectedItem(value: newVal);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 26,
                            color: Colors.grey,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: TasksCubit.get(context: context).nameEdit,
                            validator: ( value){
                              if(value!.isEmpty){
                                return "Enter the name of task";
                              }
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterStyle: TextStyle(
                                color: Colors.black,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              helperStyle: TextStyle(
                                color: Colors.black,
                              ),
                            prefix: Icon(
                                Icons.wb_sunny_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            height: 26,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kind",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              Container(
                                width: 145,
                                height: 33,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(135, 199, 255, 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text("Daily",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15)),
                                      value: TasksCubit.get(context: context).selectedItemEdit,
                                      //alignment: Alignment.center,
                                      dropdownColor: Colors.white,
                                      isExpanded: true,
                                      elevation: 8,
                                      //isDense: true,
                                      iconDisabledColor: Colors.black,
                                      //underline: null,

                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      iconEnabledColor: Colors.black,
                                      items: TasksCubit.get(context: context).kindListEdit.map((item) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          value: item,
                                        );
                                      }).toList(),

                                      onChanged: (newVal) {
                                        TasksCubit.get(context: context).editTaskSelectedItemKind(value: newVal);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 26,
                            color: Colors.grey,
                          ),
                          InkWell(
                            onTap: () {
                              _datePicker(context: context);
                            },
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.calendar_month_outlined,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {},
                                  iconSize: 20,
                                ),
                                Text(
                                  "${TasksCubit.get(context: context).mydateEdit}",
                                  style: TextStyle(color: TasksCubit.get(context: context).fontcolorEdit),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 20,
                            color: Colors.grey,
                          ),
                          Text(
                            "   Note",
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              validator: ( value){
                                if(value!.isEmpty){
                                  return "Enter the note";
                                }
                              },
                              style: TextStyle(color: Colors.black),
                              controller: TasksCubit.get(context: context).textareaEdit,
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                counterStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                helperStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                // hintText: "  Add Note",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //remind button
                          // Row(
                          //   children: [
                          //     Expanded(
                          //         child: Padding(
                          //       padding: EdgeInsets.symmetric(horizontal: 10),
                          //       child: mainTextButton(
                          //         context: context,
                          //         child: Text(
                          //           "Set Reminder",
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .button!
                          //               .copyWith(
                          //                 color: Colors.black,
                          //               ),
                          //         ),
                          //         onPressed: () {
                          //           mySheet(context: context);
                          //         },
                          //         backgroundColor:
                          //             Color.fromRGBO(135, 199, 255, 1),
                          //         radius: 21,
                          //         borderColor: Color.fromRGBO(135, 199, 255, 1),
                          //       ),
                          //     )),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          //save button
                          state is EditProfileLoadingState?Center(child: CircularProgressIndicator(),):Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: mainTextButton(
                                  context: context,
                                  child: Text(
                                    "Save",
                                    style: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                  onPressed: () {
                                    if(TasksCubit.get(context:context).editFormKey.currentState!.validate()){
                                      TasksCubit.get(context:context).updateTask(
                                        context: context,
                                          token: CashHelper.getString(key: "token"),
                                          id: CashHelper.getString(key: "edit task id"),
                                          name: TasksCubit.get(context:context).nameEdit.text,
                                          note: TasksCubit.get(context:context).textareaEdit.text,
                                          state: TasksCubit.get(context:context).selectedstateItemEdit.toString(),
                                          duration: TasksCubit.get(context:context).defultEdit.toString(),
                                          kind: TasksCubit.get(context:context).selectedItemEdit.toString(),
                                          initiated_at: TasksCubit.get(context:context).mydateEdit,);
                                    }
                                  },
                                  backgroundColor:
                                      Color.fromRGBO(135, 199, 255, 1),
                                  radius: 21,
                                  borderColor: Color.fromRGBO(135, 199, 255, 1),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 40,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  void _datePicker({required BuildContext context}) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2025),
        builder: (context, child) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  height: 450,
                  width: 700,
                  child: child,
                ),
              ),
            ],
          );
        }).then((value) {
      if (value == null) {
        return;
      }
      TasksCubit.get(context: context).editTaskDatePicker(value: value);
    });
  }
}
