import 'package:flutter/material.dart';
import 'package:tensorflow/text_classification/classifier.dart';

class TextClassificationApp extends StatefulWidget {
  const TextClassificationApp({super.key});

  @override
  State<TextClassificationApp> createState() => _TextClassificationAppState();
}

class _TextClassificationAppState extends State<TextClassificationApp> {
  late TextEditingController _controller;
  late Classifier _classifier;
  late List<Widget> _children;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _classifier = Classifier();
    _children = [];
    _children.add(Container());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text('Text classification'),
        ),
        body: Container(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                itemCount: _children.length,
                itemBuilder: (_, index) {
                  return _children[index];
                },
              )),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.orangeAccent)),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                            hintText: 'Write some text here'),
                        controller: _controller,
                      ),
                    ),
                    TextButton(
                      child: const Text('Classify'),
                      onPressed: () {
                        final text = _controller.text;
                        final prediction = _classifier.classify(text);
                        setState(() {
                          _children.add(Dismissible(
                            key: GlobalKey(),
                            onDismissed: (direction) {},
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                color: prediction[1] > prediction[0]
                                    ? Colors.lightGreen
                                    : Colors.redAccent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Input: $text",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const Text("Output:"),
                                    Text("   Positive: ${prediction[1]}"),
                                    Text("   Negative: ${prediction[0]}"),
                                  ],
                                ),
                              ),
                            ),
                          ));
                          _controller.clear();
                        });
                      },
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}