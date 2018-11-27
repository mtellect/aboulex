import 'package:flutter/material.dart';
import 'package:smart_churchy/Act.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:page_indicator/page_indicator.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    title: "Smart Churchy",
    routes: <String, WidgetBuilder>{
      '/Act': (BuildContext context) => new Act()
    },
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Timer timer;
  int currentPage = 0;
  bool reverse = false;
  PageController controller = new PageController();


  @override
  void initState() {
    super.initState();
    pageChangeTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    controller.dispose();
    super.dispose();
  }

 void onPageChanged(int value) {
    setState(() {
      currentPage = value;
    });

    if (currentPage == 3) {
      setState(() {
        reverse = true;
      });
      return;
    }

    if (currentPage == 0) {
      setState(() {
        reverse = false;
      });
      return;
    }
  }


  //imagechanger function
  pageChangeTimer() async {
    timer = Timer.periodic(Duration(seconds: 5), (_) {
      if (reverse == false && currentPage < 3) {
        controller.nextPage(
            duration: Duration(milliseconds: 5), curve: Curves.easeIn);
      } else if (reverse == true && currentPage <= 3) {
        controller.previousPage(
            duration: Duration(milliseconds: 5), curve: Curves.easeOut);
      }
    });
  }

  //image asset list
   List<AssetImage> myImages = [
      AssetImage("images/c7.jpg"),
      AssetImage("images/c3.jpg"),
      AssetImage("images/c1.jpg"),
      AssetImage("images/c5.jpg"),
      AssetImage("images/c2.jpg"),
      AssetImage("images/c4.jpg"),
      AssetImage("images/c6.jpg"),
      AssetImage("images/c8.jpg"),
    ];

//custom Imagechanger
  Widget myCustomCarousel() {
      return Container(
        height: 200.0,
        margin: EdgeInsets.all(5.0),
        //padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: new PageIndicatorContainer(
            size: 10.0,
            indicatorSpace: 5.0,
            indicatorSelectorColor: Colors.white,
            indicatorColor: Colors.white.withAlpha(125),
            pageView: new PageView.builder(
                controller: controller,
                onPageChanged: onPageChanged,
                itemCount: myImages.length,
                itemBuilder: (c, index) {
                  return new Container(
                    //height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        image: DecorationImage(
                            image: myImages[index],
                            fit: BoxFit.cover,
                            alignment: Alignment.center),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  );
                }),
            length: myImages.length),
      );
    }

    //your drawer
    Widget myDrawer(){
    return new Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("RCCG ONDO PARISH"),
            accountEmail: Text("rccgonodo@gmail.com"),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.cyanAccent,
                child: Image.asset("images/l1.png", width: 70.0,),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
                title: Text("Tayo Muyiwa"),
                leading: Icon(Icons.verified_user,color: Colors.green,)),
          ),
          Divider(),
          InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("Location"), leading: Icon(Icons.add_location,color: Colors.green,))),
          InkWell(
              onTap: () {},
              child:
              ListTile(title: Text("Socials"), leading: Icon(Icons.people,color: Colors.cyan),
              )),
          InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Contact Us"), leading: Icon(Icons.contacts,color: Colors.lightGreenAccent),
              )),
          InkWell(
            onTap: () {},
            child: ListTile(
                title: Text("About Us"), leading: Icon(Icons.description,color: Colors.green)),
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child:
            ListTile(title: Text("Logout"), leading: Icon(Icons.delete,color: Colors.red,)),
          ),
          Divider(),
          Divider(),
          InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("Powered by Scoodent Limited"),
                  leading: Icon(Icons.texture,color: Colors.blueAccent))
          ),
        ],
      ),
    );
    }

    
    //your appbar
    Widget myAppBar(){
    return  AppBar(
      title: Text(
        "SMART CHURCHY",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),
      ),
      backgroundColor: Colors.red,
    );
    }

    Widget bodyUI(){
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverList(
            delegate: SliverChildListDelegate([
              myCustomCarousel(),
              new SizedBox(
                height: 10.0,
              ),
            ])),

      ],
    );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar(),
      drawer: myDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_right),
          backgroundColor: Colors.pink,
          onPressed: () => Navigator.pushNamed(context, '/Act')),
      body :bodyUI()
    );
  }
  
  
}



// This is a new dart file that contains the Act Class thats supposed to have the pop of Icons in grid view


import 'package:flutter/material.dart';


class Act extends StatefulWidget {
  @override
  _ActState createState() => new _ActState();
}

class _ActState extends State<Act> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

    );
  }
}
