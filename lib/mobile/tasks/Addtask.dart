import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/home/home_screen.dart';
import 'package:projects/mobile/register/register_screen.dart';
import 'package:projects/shared/network/end_points.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  FilePickerResult? result;
  var filename = "Add File";
  DateTime? _selectedDate;
  var mydate = "Date";
  Color? fontcolor = Colors.grey.shade300;
  bool _isChecked = false;
  bool _secondChecked = false;
  TextEditingController taskName=TextEditingController();
  var dio=Dio();
  bool isSubmitTab=false;


  void _datePicker() {
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
      setState(() {
        _selectedDate = value;
        mydate =
            "${_selectedDate?.day}-${_selectedDate?.month}-${_selectedDate?.year}";
        fontcolor = Color.fromRGBO(10, 102, 194, 1);
      });
    });
  }

  Color wordcolor = Colors.grey.shade300;
  Color wordcolor2 = Colors.grey.shade300;
  String? _selectedItem;
  String? _durationitem;
  List _kindList = ["Daily", "Weekly", "Monthly"];
  List _DurationList = ["30 min", "45 min", "90 min"];
  TextEditingController textarea = TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/icons/Group20.png'),
        elevation: 0.0,
        actions: [
          Image.asset('assets/icons/notify.png'),
        ],
        backgroundColor: Color.fromRGBO(10, 102, 194, 1),
      ),
      body: Form(
        key: formKey,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(10, 102, 194, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Task",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                      Image.asset(
                        "assets/icons/Checklist.png",
                        width: 134.89,
                        height: 120,
                      ),
                    ],
                  ),
                  //add to list
                  Container(
                    height: 70,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),

                    child: mainTextForm(isPassword: false,
                        hintText: "Add to my list",
                        prefixIcon: Icons.wb_sunny_outlined,
                        validator: "Enter the name of list",
                        controller: taskName,
                        keyboardType: TextInputType.name,
                        context: context),
                  ),

                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    //  alignment: AlignmentDirectional.centerStart,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //date
                        InkWell(
                          onTap: () {
                            _datePicker();
                          },
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.calendar_month_outlined),
                                onPressed: () {},
                                iconSize: 20,
                              ),
                              Text(
                                "$mydate",
                                style: TextStyle(color: fontcolor),
                              ),
                            ],
                          ),
                        ),
                        //line
                        Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: Container(
                            height: 1,
                            color: Colors.grey.shade300,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
//Duration
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
                                    "Duration",
                                    style: TextStyle(
                                        color: Colors.grey.shade300,
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
                                              color: Colors.black, fontSize: 13)),
                                      //hint:Text("Kind",style: TextStyle(color: Colors.lightBlueAccent),),
                                      value: _durationitem,
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
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      iconEnabledColor: Colors.black,
                                      items: _DurationList.map((item) {
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
                                        setState(() {
                                          _durationitem = newVal as String?;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //line
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Container(
                            height: 1,
                            color: Colors.grey.shade300,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(10, 102, 194, 1),
                                    side: BorderSide(
                                      color: Color.fromRGBO(10, 102, 194, 1),
                                    ),
                                    checkColor: Colors.white,
                                    value: _secondChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (_secondChecked == false) {
                                          wordcolor2 =
                                              Color.fromRGBO(10, 102, 194, 1);
                                          _secondChecked = value!;
                                        } else {
                                          _secondChecked = value!;
                                          wordcolor2 = Colors.grey.shade300;
                                          ;
                                        }
                                      });
                                    }),
                                Text(
                                  "  Remind me",
                                  style:
                                      TextStyle(color: wordcolor2, fontSize: 15),
                                ),
                              ],
                            ),
                            //SizedBox(width: MediaQuery.of(context).size.width/2.7,),
                            IconButton(
                              icon: Icon(
                                Icons.notifications_none_sharp,
                                size: 30,
                                color: wordcolor2,
                              ),
                              onPressed: () {
                                //_datePicker();
                              },
                              iconSize: 20,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Container(
                            height: 1,
                            color: Colors.grey.shade300,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Checkbox(
                                    activeColor: Color.fromRGBO(10, 102, 194, 1),
                                    side: BorderSide(
                                      color: Color.fromRGBO(10, 102, 194, 1),
                                    ),
                                    checkColor: Colors.white,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (_isChecked == false) {
                                          wordcolor =
                                              Color.fromRGBO(10, 102, 194, 1);
                                          _isChecked = value!;
                                        } else {
                                          _isChecked = value!;
                                          wordcolor = Colors.grey.shade300;
                                          ;
                                        }
                                      });
                                    }),
                                Text(
                                  "  Repeat",
                                  style:
                                      TextStyle(color: wordcolor, fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.7,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.repeat_rounded,
                                size: 30,
                                color: wordcolor,
                              ),
                              onPressed: () {
                                //_datePicker();
                              },
                              iconSize: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  // Text("Kind",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 15,fontWeight: FontWeight.bold),),
                  Container(
                    // height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kind",
                            style: TextStyle(
                              color: Color.fromRGBO(10, 102, 194, 1),
                              fontSize: 25,
                            ),
                          ),
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
                                  borderRadius: BorderRadius.circular(13),
                                  hint: Text("Monthly",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  underline: Container(
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1.0, style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                    ),
                                  ),

                                  //hint:Text("Kind",style: TextStyle(color: Colors.lightBlueAccent),),
                                  value: _selectedItem,
                                  //alignment: Alignment.center,
                                  dropdownColor: Color.fromRGBO(242, 199, 130, 1),
                                  isExpanded: true,
                                  elevation: 8,
                                  //isDense: true,
                                  iconDisabledColor: Colors.black,
                                  //underline: null,

                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  iconEnabledColor: Colors.black,
                                  items: _kindList.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                      value: item,
                                    );
                                  }).toList(),

                                  onChanged: (newVal) {
                                    setState(() {
                                      _selectedItem = newVal as String?;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  /* Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.attachment_sharp),
                          onPressed: () async {
                            /// Initialize controller in initState

                            result = await FilePicker.platform
                                .pickFiles(allowMultiple: true);
                            if (result == null) {
                              // filename="Add";
                              //result=Text("Add File") as FilePickerResult?;
                            } else {
                              setState(() {
                                filename = result!.files.first.name.toString();
                              });
                            }
                          },
                        ),
                        Text(
                          "$filename",
                          style: TextStyle(
                              color: Colors.grey.shade300, fontSize: 15),
                        )
                      ],
                    ),
                  ),*/
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: textarea,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: InputDecoration(
                          counterStyle: TextStyle(
                            color: Colors.black,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          helperStyle: TextStyle(
                            color: Colors.black,
                          ),

                          hintText: "  Add Note"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Enter a note";
                        } else {}
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  isSubmitTab?Center(child: CircularProgressIndicator(color: Colors.white,),):Container(
                    width: 200,
                    height: 40,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color.fromRGBO(135, 199, 255, 1),
                      ),
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                         setState(() {
                           isSubmitTab=true;
                           dio.post(
                               ALLTASKS,
                               options: Options(
                                 receiveDataWhenStatusError: true,
                                 headers: {
                                   "Accept": "application/vnd.api+json",
                                   "Content-Type": "application/vnd.api+json",
                                   "Authorization": "Bearer ${CashHelper.getString(key: "token")}",
                                 },
                               ),
                               data: {
                           "name": taskName.text,
                           "note": textarea.text,
                           "state": "active",
                           "duration": _durationitem=="30 min"?"30": (_durationitem=="45 min"?"45":"90"),
                           "reminder": _secondChecked==false?"1":"0",
                           "reminder_date": /*"$formattedDate 00:00",*/"2023-04-01 00:00",
                           "kind": _selectedItem=="Daily"?"daily":(_selectedItem=="Weekly"?"weekly":"monthly"),
                           "repeat":  _isChecked==false?"1":"0",
                           "initiated_at": /*"$mydate 01:00:00",*/"2023-02-01 00:00",
                           "due_date": /*"$formattedDate 01:30:00"*/"2023-02-02 00:00",
                               }
                           ).
                           then((value) {
                             print(true);
                             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
                           }).catchError((error){
                             print(error.toString());
                           });

                         });
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

