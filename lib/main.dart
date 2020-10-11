
import 'package:flutter/material.dart' hide Card;

import 'package:WeatherApp/src/Common/Card.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline4: 
            TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(1),
              fontSize: 24
            ),
          headline1: TextStyle(fontSize: 96, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(1)),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: MyHomePage(title: 'Flutter Dedmo Home Page'),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class WeatherPreview extends StatelessWidget {
    @override 
    Widget build(BuildContext context){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  '13C',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(1),
                    fontSize: 50
                  )
                ),
                Text('Feels like 12C',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(1),
                    fontSize: 12
                  )
                )
              ]
            )
          ,) ,
          Container(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(image: AssetImage('graphics/cloudy.png')),
              Text('Mostly Cloudy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(1),
                  fontSize: 12
                )
              )
            ]
          )
        ,)
        ]
      );
    }
}

var hourlyWeather = [
  {'time':0, 'description':"Mostly cloudy"},
  {'time':1, 'description':"Sunny"},
  {'time':2, 'description':"Sunny"},
  {'time':3, 'description':"Mostly cloudy"},
  {'time':4, 'description':"Mostly cloudy"},
  {'time':5, 'description':"Mostly cloudy"},
  {'time':6, 'description':"Mostly cloudy"},
  {'time':7, 'description':"Rainy"},
  {'time':8, 'description':"Rainy"},
  {'time':9, 'description':"Rainy"},
  {'time':10, 'description':"Rainy"},
  {'time':11, 'description':"Sunny"},
  {'time':12, 'description':"Sunny"},
  {'time':13, 'description':"Sunny"},
  {'time':14, 'description':"Sunny"},
  {'time':15, 'description':"Sunny"},
];

Map descToThumbnail = { 
  "Mostly cloudy" :  "graphics/cloudy.png",
  "Sunny" :"graphics/sunny.png",
  "Rainy" : "graphics/rainy.png",
 };

class MainTile extends StatelessWidget {
  @override 
    Widget build(BuildContext context){
      return Expanded(
        child: Card (
          boxDecoration: BoxDecoration(color: Colors.blue[500]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Hi, Maya! Weather today:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(1),
                        fontSize: 18,
                      )
                    ),
                    Text(
                      'Kanata, Ottawa, ON',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white.withOpacity(1),
                        fontSize: 24,
                      )
                    ),
                    WeatherPreview()
                  ]
                ),
              ),
              Container(
                height:80,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                alignment: Alignment.centerLeft,
                child:  ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:16, 
                  itemBuilder: (context, index) {
                    return HourlyWeatherPreview(thumbnail: Image(image: AssetImage(descToThumbnail[hourlyWeather[index]["description"]] )), title: hourlyWeather[index]["time"].toString() +" pm" );
                  }
                )
              )
              
              
              

            ]
          )
        )
      );
    }
}


class HourlyWeatherPreview extends StatelessWidget {
  const HourlyWeatherPreview({this.thumbnail, this.title});
  final Widget thumbnail;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 0,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white.withOpacity(1),
                fontSize: 12,
              )
            ),
          )
        ],
      ),
    );
  }
}
class RowSplitCard extends StatelessWidget{
  const RowSplitCard({this.leftWidget, this.rightWidget, this.margin = const EdgeInsets.all(0), this.boxDecoration = const BoxDecoration()});
  final Widget leftWidget;
  final Widget rightWidget;
  final EdgeInsets margin;
  final BoxDecoration boxDecoration;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: this.margin,
      boxDecoration: this.boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          this.leftWidget,
          this.rightWidget
        ],
      )
    );
  }
}
class DaysTillNextSunnyDayCard extends StatelessWidget{
  const DaysTillNextSunnyDayCard({this.daysTill});
  final int daysTill;

  @override
  Widget build(BuildContext context){
    return RowSplitCard(
      leftWidget: Text(
        'Days till next sunny day',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white.withOpacity(1),
          fontSize: 14,
        ),
      ),
      rightWidget:Text(
        daysTill.toString()+' days after today',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white.withOpacity(1),
          fontSize: 14,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical:3),
      boxDecoration: BoxDecoration(color: Colors.blue[500]),
    );
  }

}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MainTile(),
            DaysTillNextSunnyDayCard(daysTill:4),
            Card(
              boxDecoration: BoxDecoration(color: Colors.blue[500]),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter a search term',
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(fontSize:18)

              ) 
            )
          ],
        ),
      )
    );
  }
}
