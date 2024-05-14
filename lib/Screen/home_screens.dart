import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/Screen/Setting_screen.dart';
import 'package:real_estate/Screen/favourite_screen.dart';
import 'package:real_estate/Screen/home_page.dart';
import 'package:real_estate/bloc/home_bloc/home_bloc.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    int val = 0;
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is ChangeScreenState) {
            val = state.val;
          }
          if (val == 0) {
            return const HomePage();
          } else if (val == 1)
            return const FavouriteScreen();
          else
            return const SettingScreen();
        },
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: NotchBottomBarController(index: val),
        onTap: (value) {
          BlocProvider.of<HomeBloc>(context).add(ChangeScreenEvent(val: value));
        },
        kIconSize: 10,
        kBottomRadius: 10,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.star,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.star,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 2',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.star,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.star,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 3',
          ),
        ],
      ),
    );
  }
}
