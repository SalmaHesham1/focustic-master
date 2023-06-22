import 'package:flutter/material.dart';
import 'package:projects/mobile/seccions/cubit/cubit.dart';
import 'package:projects/shared/component/component.dart';

class ListOfSessionsScreen extends StatelessWidget {
  const ListOfSessionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 230,
        color: Colors.transparent,
        child: mainContainer(
          color: Colors.transparent,
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        SessionsCubit
                                            .get(context: context)
                                            .sessionsModel!
                                            .data[index].attributes.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffF98D47),
                                            overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10,
                                        left: 5,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          SessionsCubit.get(context: context).changeIdOfSession(index: SessionsCubit
                                              .get(context: context)
                                              .sessionsModel!
                                              .data[index].id);
                                          print(SessionsCubit
                                              .get(context: context).idOfEditSession);
                                          SessionsCubit.get(context: context)
                                              .changeSessionsScreen(numOfScreen: 1);
                                        },
                                        child: Image(
                                          height: 30,
                                          width: 30,
                                          fit: BoxFit.contain,
                                          color: Theme.of(context).primaryColor,
                                          image: AssetImage(
                                            "assets/icons/edit.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Expanded(child: Row(
                                children: [Expanded(
                                  flex: 1,
                                  child: Text(
                                    SessionsCubit
                                        .get(context: context)
                                        .sessionsModel!
                                        .data[index].attributes.state,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: SessionsCubit
                                          .get(context: context)
                                          .sessionsModel!
                                          .data[index].attributes.state ==
                                          "active"
                                          ? Color(0xff00AC47)
                                          : Color(0xffF98D47).withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){},
                                      child: Icon(Icons.play_arrow),
                                    ),
                                  ),],
                              ),)
                            ],
                          ),
                        )),
                separatorBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 2,
                        color: Colors.black12,
                      ),
                    ),
                itemCount: SessionsCubit
                    .get(context: context)
                    .sessionsModel!
                    .data
                    .length)));
  }
}
