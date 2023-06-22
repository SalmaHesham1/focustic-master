import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/mobile/community/cubit/cubit.dart';
import 'package:projects/mobile/community/cubit/state.dart';

class Articles extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommunityScreenCubit>(
      create: (context) => CommunityScreenCubit(),
      child: BlocConsumer<CommunityScreenCubit, CommunityScreenStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {},
                        child: Container(
                            height: 201,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color(0xff89a6b8),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 123,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        "assets/images/community-artifici.png",
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      right: 18,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                              "Checkout these exercises and "
                                              "Stretches for better posture "
                                              "back and neck health",
                                              maxLines: 3,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  )),
                                        ),
                                        Expanded(
                                          child: SizedBox(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: 10),
            ));
          }),
    );
  }
}
