import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Postcard {

  static const String TEST_PIC="assets/test_1.jpg";
  static const String TEXT_RESULT="Consult Now";
  final double _totalW=338;
  final double _totalH=494;

  Container? _imageBlock;
  final double _imageW=336;
  final double _imageH=275;

  Text? _nameBlock;
  final double _nameW=336;
  final double _nameH=50;

  Text? _descriptionBlock;
  final double _descriptionW=336;
  final double _descriptionH=50;

  Container? _consultButtonBlock;
  final double _consultW=256;
  final double _consultH=65;

  final double _bottomH=35;


  Postcard(String name,String description,String imagePath){
    _initTextName("  "+name);
    _initImage(imagePath);
    _initTextDescription("  " +description);
    _initButtonConsult();
  }

  void _initImage(String imagePath){
   _imageBlock=Container(
     width: _imageW,
     height: _imageH,
      //超出部分，可裁剪
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            bottomEnd: Radius.circular(20)
        ),
      ),
      child: Image(
          width: _imageW,
          height: _imageH,
          fit: BoxFit.fill,
          image: FileImage(File(imagePath))
      ),
    );
  }

  void _initTextName(String name){
    _nameBlock= Text(
        name,
        style:  TextStyle(
            fontSize: 40,
            // color: Colors.orange,
            foreground: Paint()
              ..shader=const LinearGradient(
                begin:Alignment.topRight,
                end:Alignment.topLeft,
                colors:[Colors.yellow,Colors.red],
              ).createShader(ui.Rect.largest)
        ));
  }

  void _initTextDescription(String description){
    _descriptionBlock=Text(
      description,
      textAlign: TextAlign.start,
      style: const TextStyle(
          fontSize: 26,
          color: Colors.black26,
          overflow: TextOverflow.clip,
      ),
    ) ;
  }

  void _initButtonConsult(){
    Text textConsult= const Text(
      TEXT_RESULT,
      style: TextStyle(
        fontSize: 28,
        color: Colors.white,
        overflow: TextOverflow.clip,
      ),
      textAlign: TextAlign.center,
    );


    _consultButtonBlock=
    Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,//渐变开始于上面的中间开始
              end: Alignment.bottomRight,//渐变结束于下面的中间
              colors: [Colors.yellow, Colors.red]//开始颜色和结束颜色])),
             )
    ),
        child:CupertinoButton(
          borderRadius: BorderRadius.circular(50),
          onPressed: () {  },
          child: _sizedBox(textConsult, _consultW, _consultH)
    )
    );

  }



  SizedBox _sizedBox(Widget? object,double W,double H){
    return SizedBox(
      width: W,
      height: H,
      child: object,
    );
  }

  SizedBox get(){
    return _sizedBox(DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.amberAccent,
          border: Border.all(
              color: Colors.orange,
              width: 1
          ),
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(20),
              bottomEnd: Radius.circular(20)
          )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: _imageH.toInt(),
            child: _sizedBox(_imageBlock, _imageW, _imageH),
          ),
          Expanded(
            flex: _nameH.toInt(),
            child: _sizedBox(_nameBlock, _nameW, _nameH),
          ),
          Expanded(
            flex: _descriptionH.toInt(),
            child: _sizedBox(_descriptionBlock, _descriptionW, _descriptionH),
          ),
          Expanded(
            flex: _consultH.toInt(),
            child: _sizedBox(_consultButtonBlock, _consultW, _consultH),
          ),
          Expanded(
            flex: _bottomH.toInt(),
            child: _sizedBox(null, _consultW, _bottomH),
          )

        ],
      ) ,
    ), _totalW, _totalH) ;
  }

}