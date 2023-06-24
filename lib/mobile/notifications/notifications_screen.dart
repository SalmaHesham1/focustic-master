import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/home/app_cubit/cubit.dart';
import 'package:projects/mobile/home/app_cubit/state.dart';
import 'package:projects/shared/network/local/cash_helper.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHardwareData(token: CashHelper.getString(key: "token"), context: context),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is GetHardwareDataLoadingState?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width:double.infinity,
                        child: Text(
                          "Notifications",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.black,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "New",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.black,
                                ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                    ],
                  ),
                ),
                HomeCubit.get(context).hardwareModel!.data.length==0?Container(child: Center(child: Text("No Notification",style:TextStyle(color:Colors.black))),):ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                          color:
                              index % 2 == 0 ? Colors.white : Color(0xffE4F5FF),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/background.png"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "rotation_x: ${HomeCubit.get(context).hardwareModel!.data[HomeCubit.get(context).hardwareModel!.data.length-1].attributes.rotationX}  "
                                    "rotation_y: ${HomeCubit.get(context).hardwareModel!.data[HomeCubit.get(context).hardwareModel!.data.length-1].attributes.rotationY}  "
                                      "rotation_z: ${HomeCubit.get(context).hardwareModel!.data[HomeCubit.get(context).hardwareModel!.data.length-1].attributes.rotationZ}  "
                                      "ultrasonic: ${HomeCubit.get(context).hardwareModel!.data[HomeCubit.get(context).hardwareModel!.data.length-1].attributes.ultrasonic}  "
                                      ,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    separatorBuilder: (Context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: 1)
              ],
            ),
          );
        },
      ),
    );
  }
}
