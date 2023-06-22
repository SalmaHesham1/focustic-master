import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:projects/mobile/tasks/Addtask.dart';
import 'package:projects/mobile/tasks/cubit/cubit.dart';
import 'package:projects/mobile/tasks/cubit/state.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

import '../../home/app_cubit/cubit.dart';


class ToDo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocProvider<TasksCubit>(
      create:(context)=>TasksCubit()..getAllTasks(token: CashHelper.getString(key: "token"), context: context),
      child: BlocConsumer<TasksCubit,TasksStates>(
        listener: (context,state){},
        builder: (context,state){
          TasksCubit.get(context: context).changeTasksList(context: context, newVal: TasksCubit.get(context: context).selectedItemTask);
          return state is TasksAllTasksLoadingState?Center(child: CircularProgressIndicator(),):Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("  To do list", style: TextStyle(fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,),),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.5,
                      height: 156,
                      decoration: BoxDecoration(
                        image: DecorationImage(

                          alignment: Alignment.topRight,
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "assets/icons/todo.png",
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(

                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AddTask()))
                              .then((value) {
                            // setState(() {
                            //   index++;
                            // });
                            // //  _addTodoItem("Task${index}");
                            // items.add(Text('Task ${index}'));
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("Add Task", style: TextStyle(color: Colors.grey),),
                            Icon(Icons.add, color: Colors.grey, size: 10,),
                          ],
                        ),
                      ),
                      Container(
                        width: 118,
                        height: 35,

                        // alignment: Alignment.centerRight,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(135, 199, 255, 1),),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              // hint: Text("Tap", style: TextStyle(color: Colors
                              //     .black, fontSize: 15)),
                              //hint:Text("Kind",style: TextStyle(color: Colors.lightBlueAccent),),
                              value: TasksCubit.get(context: context).selectedItemTask,
                              //alignment: Alignment.center,
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              elevation: 8,
                              //isDense: true,
                              iconDisabledColor: Colors.black,
                              //underline: null,
                              style: TextStyle(color: Colors.black, fontSize: 15),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              iconEnabledColor: Colors.black,
                              items: TasksCubit.get(context: context).kindListTask.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item,),
                                  value: item,
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                TasksCubit.get(context: context).changeBody(context: context, newVal: newVal);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        // var current = items[index];
                        return InkWell(
                          onTap: (){
                            TasksCubit.get(context: context).changeEditTaskId(id: TasksCubit.get(context: context).listOfTasksTask[index].id);
                            CashHelper.putData(key: "edit task id", value: TasksCubit.get(context: context).listOfTasksTask[index].id);
                            print(CashHelper.getString(key: "edit task id"));
                            HomeCubit.get(context)
                                .changeBody(index: 11);
                          },
                          child: Dismissible(
                            key: UniqueKey(),
                            background: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.red,
                              ),
                              alignment: AlignmentDirectional.centerStart,
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              ),
                            ),
                            secondaryBackground: TasksCubit.get(context: context).listOfTasksTask![index]
                                .attributes
                                .state ==
                                "active"
                            /*HomeCubit.get(context)
                                          .tasksModel!
                                          .data[index]
                                          .attributes
                                          .state ==
                                      "active"*/
                                ? Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.green,
                              ),
                              alignment: AlignmentDirectional.centerEnd,
                              child: Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.white,
                              ),
                            )
                                : null,
                            onDismissed: (DismissDirection direction) {
                              if (direction == DismissDirection.startToEnd) {
                                //delete
                                TasksCubit.get(context: context).deleteTask(
                                  token: CashHelper.getString(key: "token"),
                                  id: TasksCubit.get(context: context).listOfTasksTask[index].id,
                                );
                              } else if (direction == DismissDirection.endToStart) {
                                //done
                                TasksCubit.get(context: context).updateTask(
                                  context: context,
                                    // due_date: TasksCubit.get(context: context).listOfTasksTask[index].attributes.due_date,
                                    duration: TasksCubit.get(context: context).listOfTasksTask[index].attributes.duration,
                                    id: TasksCubit.get(context: context).listOfTasksTask[index].attributes.id,
                                    initiated_at: TasksCubit.get(context: context).listOfTasksTask[index].attributes.initiated_at,
                                    kind: TasksCubit.get(context: context).listOfTasksTask[index].attributes.kind,
                                    name: TasksCubit.get(context: context).listOfTasksTask[index].attributes.name,
                                    note: TasksCubit.get(context: context).listOfTasksTask[index].attributes.note,
                                    // reminder: TasksCubit.get(context: context).listOfTasksTask[index].attributes.reminder,
                                    // reminder_date: TasksCubit.get(context: context).listOfTasksTask[index].attributes.reminder_date,
                                    // repeat: TasksCubit.get(context: context).listOfTasksTask[index].attributes.repeat,
                                    state: "done",
                                    token: CashHelper.getString(key: "token")
                                );
                              }
                            },
                            child: Column(
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Color.fromRGBO(135, 199, 255, 1),
                                              width: 1,
                                            )),
                                        child: ListTile(
                                          onTap: () {
                                            // onTodoChanged(todo);
                                          },
                                          title: Text(
                                            TasksCubit.get(context: context).listOfTasksTask![index].attributes
                                                .name,
                                            style: TextStyle(
                                              color: TasksCubit.get(context: context).listOfTasksTask![index]
                                                  .attributes
                                                  .state ==
                                                  "active"
                                                  ? Colors.blueAccent
                                                  : Colors.grey,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            maxLines: 2,
                                          ),
                                          trailing: Text(
                                            TasksCubit.get(context: context).listOfTasksTask![index]
                                                .attributes
                                                .initiatedAt /*DateFormat("hh:mm a").format(DateTime.now())*/,
                                            style: TextStyle(
                                              color: TasksCubit.get(context: context).listOfTasksTask![index]
                                                  .attributes
                                                  .state ==
                                                  "active"
                                                  ? Colors.black
                                                  : Colors.grey,
                                            ),
                                          ),
                                        )),
                                    TasksCubit.get(context: context).listOfTasksTask![index].attributes
                                        .state ==
                                        "active"
                                        ? SizedBox()
                                        : Divider(
                                      height: 50,
                                      color: Colors.black87,
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 20,
                                  color: Colors.grey[350],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: TasksCubit.get(context: context).listOfTasksTask!.length,

                      //my edit _todos.length
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

}