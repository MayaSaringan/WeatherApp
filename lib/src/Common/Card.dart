
import 'package:flutter/material.dart';
class Card extends StatelessWidget {
  const Card({this.child, this.margin = const EdgeInsets.all(0), this.boxDecoration = const BoxDecoration()});
  final Widget child;
  final EdgeInsets margin;
  final BoxDecoration boxDecoration;
  @override
    Widget build(BuildContext context){
      return  FractionallySizedBox(
          widthFactor: 1,
          child:Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(25),
            margin: this.margin,
            decoration: this.boxDecoration,
            child:this.child
          )
          
        );
    }
}