import 'package:equina_task/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabView extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> views;
  final int initialTabIndex;

  const CustomTabView({
    Key? key,
    required this.tabs,
    required this.views,
    required this.initialTabIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: initialTabIndex,
      child: Column(
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: black,
            indicatorColor: mainBlue,
            tabs: tabs.map((title) => Tab(text: title)).toList(),
          ),
          SizedBox(height: 500.h, child: TabBarView(children: views)),
        ],
      ),
    );
  }
}
