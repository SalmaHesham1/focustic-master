import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/tasks/Add%20Tasks/todomodel.dart';

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  //String tdata = DateFormat("hh:mm a").format(DateTime.now());
  //int index=0;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return TextStyle(
      color: Colors.black,
    );

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color.fromRGBO(135, 199, 255, 1),
                  width: 1,
                )
            ),
            child: ListTile(
              onTap: () {
                onTodoChanged(todo);
              },
              title: TextButton(onPressed: () {
                HomeCubit.get(context).changeBody(index: 11);
              }, style: ButtonStyle(
                  alignment: AlignmentDirectional.centerStart
              ),
                  child: Text(todo.name, style: _getTextStyle(todo.checked))),
              trailing: TextButton(onPressed: () {
                HomeCubit.get(context).changeBody(index: 15);
              },
                  child: Text(
                    todo.tdata, style: TextStyle(color: Colors.black,),)),
            )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
          child: Container(
            height: 1, color: Colors.grey.shade300, width: MediaQuery
              .of(context)
              .size
              .width,),
        ),
      ],
    );
  }
}
