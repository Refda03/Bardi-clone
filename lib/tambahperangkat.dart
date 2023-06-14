import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckContainer extends StatefulWidget {
  const CheckContainer({Key? key, this.title = ''}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _CheckContainerState();
  }
}

class _CheckContainerState extends State<CheckContainer> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.cyanAccent,
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(12),
        color: isChecked ? Colors.cyan : Colors.white,
        child: Row(
          children: [
            const Image(
              image:
              AssetImage('assets/images/Fishfeeder.png'),
              height: 50,
              width: 50,
            ),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: isChecked ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class tambahperangkat extends StatelessWidget{
  var appBarHeight = AppBar().preferredSize.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: const Color(0xffffffff),
          title: Text('Tambah Perangkat',style: TextStyle(fontSize: 17, fontFamily: "San Francisco", color: Color(
              0xB4000000),),),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios, color: Colors.grey, size: 30.0,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: Text('Simpan',style: TextStyle(fontSize: 17, fontFamily: "San Francisco", color: Colors.cyan),),),
          ],
        ),
      ),

      body: Container(
        color: const Color(0xfff8f8f8),
        child: Column(
          children: [
            Center(
              child: Column(
                children: const [
                  CheckContainer(title: ' Gas Cooker'),
                  CheckContainer(title: ' Washing Machine'),
                  CheckContainer(title: ' Wifi'),
                  CheckContainer(title: ' Television'),
                  CheckContainer(title: ' Water Heater'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}