import 'package:flutter/material.dart';
import 'package:orange_home/widgets/card.dart';
import 'package:orange_home/widgets/drawer.dart';
import 'widgets/banner.dart';

class TabWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: NestedScrollView(
        headerSliverBuilder: (context, isScroll) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: Text('Tab'),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: ()=>Navigator.pop(context),
                ),
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Nav'),
                  collapseMode: CollapseMode.pin,
                  background: Image.asset('assets/images/banner02.jpg', fit: BoxFit.fill,),
                ),
                primary: true,
                pinned: false,
                snap: true,
                floating: true,
                bottom: TabBar(
                  tabs: [
                    Tab(text: '唐僧', icon: Icon(Icons.person),),
                    Tab(text: '孙行者', icon: Icon(Icons.settings),),
                    Tab(text: '老猪', icon: Icon(Icons.pages),),
                    Tab(text: '沙师弟', icon: Icon(Icons.satellite),),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            BannerWidget(),
            CardWidget(),
            Text('老猪'),
            Text('沙师弟'),
          ],
        ),
      )
    );
  }

}