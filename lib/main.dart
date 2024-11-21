import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:test1/drawer.dart';

void main(List<String> args) => runApp(const MyWidget());

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Word(),
    );
  }
}

class Word extends StatefulWidget {
  const Word({super.key});

  @override
  State<Word> createState() => _WordState();
}

class _WordState extends State<Word> {
  static var test = nouns.where((element) => element.length < 8).toList();
  static var text = (test..shuffle()).first;

  List<Widget> boxes = [];

  makeContainers(String i) {
    return Container(
      color: Colors.white,
      width: 50.0,
      height: 50.0,
      child: Center(
        child: Text(
          i,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        title: const Text('Random Game'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 30.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              height: 150.0,
              color: Colors.blue[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '説明：',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.visible,
                      text: const TextSpan(
                        text:
                            'asdfasdfasdfdasdfasdfasdfaasdfasdfasdfasfaasdfasdasdfasdfasdfasdfasdfasdfasdfasdfasdfassasdfasdfadfasfasdfasdasdfasdfasdfasdfasdfdfasfasdfasdasdfasdfasdfasdfasdfdfasfasdfasdasdfasdfasdfasdfasdfdfasfasdfasdasdfasdfz',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      maxLines: 8,
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < text.length; i++) makeContainers(text[i]),
            ],
          ),
        ],
      ),
      drawer: const Draw(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            test = nouns.where((element) => element.length < 8).toList();
            text = (test.toList()..shuffle()).first;
          });
        },
        child: const Icon(Icons.change_circle),
      ),
    );
  }
}
