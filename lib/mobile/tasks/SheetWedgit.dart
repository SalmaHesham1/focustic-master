import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/shared/component/const.dart';
import 'package:time_slot/time_slot_from_list.dart';

mySheet({
  required BuildContext context,
}) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) =>
        SingleChildScrollView(
          child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.55,
              padding:
              EdgeInsets.only(bottom: MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reminder",
                      style: TextStyle(
                        color: Colors.black,
                      ),),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Date",
                      style: TextStyle(color: Colors.black,),),
                    HorizontalCalendar(
                      date: DateTime.now(),
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      selectedColor: Color.fromRGBO(135, 199, 255, 1),
                      onDateSelected: (date) {
                        print(date.toString());
                      },
                    ),
                    Text("Time",
                      style: TextStyle(color: Colors.black,),),
                    Expanded(
                      child: Container(
                        child: GridView.count(crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2,
                          children: [
                            for(int index = 0; index <
                                time_splot.length; index++)Container(
                              child: mainTextButton(context: context,
                                  child: Text(time_splot[index]),
                                  onPressed: () {}),)
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 56,
                        width: 289,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            backgroundColor: Color.fromRGBO(135, 199, 255, 1),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Confirm",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
  );
}
