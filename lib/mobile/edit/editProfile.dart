import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/community/coach_profile.dart';
import 'package:projects/mobile/edit/cubit/cubit.dart';
import 'package:projects/mobile/edit/cubit/state.dart';
import 'package:projects/mobile/edit/mainbutton.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditCubit>(
      create: (context)=>EditCubit(),
      child:BlocConsumer<EditCubit,EditProfileStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Container(
            height: double.infinity,
            color: Color.fromRGBO(6, 72, 116, 1),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: EditCubit.get(context: context).formKet,
                child: Column(
                  children: [
                    profileImage(context: context),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      "Edit your profile",
                      style: TextStyle(fontSize: 19),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 52),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(height: MediaQuery.of(context).size.height*0.25,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("   User name"),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height: MediaQuery.of(context).size.height * 0.036,
                                child: TextFormField(
                                  controller: EditCubit.get(context: context).userNameController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromRGBO(255, 94, 23, 0.09),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(
                                                248, 154, 84, 1)), //<-- SEE HERE
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        //<-- SEE HERE
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(248, 154, 84, 1)),
                                      ),
                                    ),
                                    validator:(value){
                                      if(value!.isEmpty){
                                        return "Enter your name";
                                      }
                                    },
                                keyboardType: TextInputType.text,)
                              ),
                            ],
                          ),
                          //name
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("  Email"),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height: MediaQuery.of(context).size.height * 0.036,
                                child: TextFormField(
                                    validator:(value){
                                      if(value!.isEmpty){
                                        return "Enter your email";
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                  controller: EditCubit.get(context: context).emailController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromRGBO(255, 94, 23, 0.09),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(
                                                248, 154, 84, 1)), //<-- SEE HERE
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        //<-- SEE HERE
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(248, 154, 84, 1)),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          //age
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("  Age"),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height: MediaQuery.of(context).size.height * 0.036,
                                child: TextFormField(
                                    validator:(value){
                                      if(value!.isEmpty){
                                        return "Enter your age";
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                  controller: EditCubit.get(context: context).ageController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromRGBO(255, 94, 23, 0.09),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(
                                                248, 154, 84, 1)), //<-- SEE HERE
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        //<-- SEE HERE
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(248, 154, 84, 1)),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          //job
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("  Job"),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height: MediaQuery.of(context).size.height * 0.036,
                                child: TextFormField(
                                    validator:(value){
                                      if(value!.isEmpty){
                                        return "Enter your job";
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                  controller: EditCubit.get(context: context).jobController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromRGBO(255, 94, 23, 0.09),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(
                                                248, 154, 84, 1)), //<-- SEE HERE
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        //<-- SEE HERE
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(248, 154, 84, 1)),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          //bio
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "  Bio",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                // height:MediaQuery.of(context).size.height*0.036 ,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  //  color: Color.fromRGBO(255,94,23,0.09 ),
                                ),
                                child: TextFormField(
                                  controller: EditCubit.get(context: context).bioController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 4,
                                  validator:(value){
                                    if(value!.isEmpty){
                                      return "Enter your bio";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    counterStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    filled: true,
                                    fillColor: Color.fromRGBO(255, 94, 23, 0.09),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(
                                              248, 154, 84, 1)), //<-- SEE HERE
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      //<-- SEE HERE
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(248, 154, 84, 1)),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    helperStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
//button
                          SizedBox(
                            height: 18,
                          ),
                          state is EditProfileLoadingState?Center(child: CircularProgressIndicator(),):Container(
                              width: 246,
                              height: 34,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(255, 94, 23, 1),
                                    Color.fromRGBO(242, 199, 130, 1),
                                    Color.fromRGBO(242, 199, 130, 1)
                                  ],
                                ),
                              ),
                              child: mainTextButton(
                                context: context,
                                child: Text("Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                onPressed: () {
                                  if(EditCubit.get(context: context).formKet.currentState!.validate()){
                                    print("true");
                                    EditCubit.get(context: context).editProfile(
                                        context: context,
                                        userName: EditCubit.get(context: context).userNameController.text,
                                        email: EditCubit.get(context: context).emailController.text,
                                        age: EditCubit.get(context: context).ageController.text,
                                        job: EditCubit.get(context: context).jobController.text,
                                        bio: EditCubit.get(context: context).bioController.text,
                                        token: CashHelper.getString(key: "token",),);
                                  }
                                },
                                radius: 10,
                              )),
                          SizedBox(
                            height: 100,
                          )
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
}
