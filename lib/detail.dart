import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {

  @override
  State createState() {
    return DetailState();
  }
}

class DetailState extends State<DetailWidget> {
  TextEditingController _nameControl;
  TextEditingController _numControl;
  GlobalKey _globalKey;

  // 判断是否是数字
  bool isNumber(String num) {
    try {
      double.parse(num);
    } on FormatException{
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    _nameControl = new TextEditingController();
    _numControl = new TextEditingController();
    _globalKey = new GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameControl.dispose();
    _globalKey = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail'),),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Stack(
          children: [
            Form(
              key: _globalKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameControl,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person_add),
                        labelText: 'Name',
                        hintText: 'please input text',
                        border: InputBorder.none
                    ),
                    validator: (str) {
                      return str.length == 2 ? null : '名称必须两位';
                    },
                  ),
                  TextFormField(
                    controller: _numControl,
                    decoration: InputDecoration(
                        icon: Icon(Icons.money),
                        labelText: '金额',
                        hintText: 'please input \$\$',
                        border: InputBorder.none
                    ),
                    keyboardType: TextInputType.number,
                    validator: (str) {
                      return isNumber(str) ? null : 'please input number';
                    },
                  ),
                  RaisedButton(
                      child: Text('save'),
                      onPressed: ()=> {
                        if ((_globalKey.currentState as FormState).validate()) {
                          Navigator.of(context).pushNamed('tab')
                        } else {
                          print('error')
                        }
                      }),
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}