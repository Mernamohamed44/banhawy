import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_navigation_bar_cubit.dart';
import 'bottom_navigation_bar_state.dart';

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => BottomNavigationBarCubit(),
        child: BlocBuilder<BottomNavigationBarCubit,BottomNavigationBarState>(
            builder: (context, state) {
          var cubit = BlocProvider.of<BottomNavigationBarCubit>(context);
          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 4,
            showUnselectedLabels: true,
            items: cubit.bottomNavigationItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeNavigationBottom(index);
            },
          ),
            body: cubit.getCurrenView,
          );
        }));
  }
}
