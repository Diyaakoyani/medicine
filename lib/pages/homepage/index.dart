import 'package:flutter/material.dart';
import 'package:medicine/pages/homepage/reminderlist.dart';
import 'package:medicine/router/routes.dart';
import 'package:medicine/widgets/atoms/buttons.dart';
import 'calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButtonWidget(
        color: Theme.of(context).colorScheme.background,
        onPressed: () async {
          await Navigator.of(context).pushNamed(RouteManager.formPage);
        },
        icon: Icons.add,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              floating: false,
              delegate: TopBar(),
            ),
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: CalendarDelegate(),
            ),
            const ReminderList()
          ],
        ),
      ),
    );
  }
}

class TopBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      width: 150,
      child: Stack(fit: StackFit.expand, children: [
        Image.asset(
          "assets/images/Background.png",
          fit: BoxFit.cover,
        ),
        Positioned(
            left: 15,
            bottom: 40,
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 32,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Hello ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'Fighters',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            )),
      ]),
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
