import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: NestedScrollView(
        headerSliverBuilder: (context, isScroll){
          return <Widget>[
            SliverAppBar(
              leading: Icon(Icons.satellite),
              actions: [
                Text('app bar01'),
                Icon(Icons.pages)
              ],
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Flexible'),
                background: Image.asset('assets/images/banner01.jpg', fit: BoxFit.fill,),
                collapseMode: CollapseMode.pin,
              ),
              primary: true,
              pinned: true,
              floating: false,
              snap: false,
            )
          ];
        },
        body: ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ItemWidget(index);
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      )
    );
  }
}

class ItemWidget extends StatefulWidget {
  int index;

  ItemWidget(this.index);

  @override
  State<StatefulWidget> createState() {
    return ItemState();
  }
}

class ItemState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        Navigator.of(context).pushNamed("detail");
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(padding: EdgeInsets.only(left: 15),
              child: Text("水电",
                style: TextStyle(fontSize: 15, color: Colors.blueAccent),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text("已交",
                style: TextStyle(fontSize: 13, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}