import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';


class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.isScrollable,
    required this.pages,
  });

  final List<Widget> tabs;
  final List<Widget> pages;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 35,
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
                color: const Color(0xffF3F2F3),
                border: Border.all(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(6.0),
                bottomRight: Radius.circular(6.0),
              ),
              child: TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Colors.transparent,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorPrimary,
                  ),
                  isScrollable: isScrollable,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                  unselectedLabelStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                  tabs: tabs),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: pages,
            ),
          )
        ],
      ),
    );
  }
}
