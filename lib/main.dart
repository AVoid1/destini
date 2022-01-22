import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 15,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      if (storyBrain.isFinished() == true) {
                        storyBrain.reset();
                      } else {
                        storyBrain.nextStory(1);
                      }
                    });
                  },
                  child: Text(
                    storyBrain.getChoice1(),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        if (storyBrain.isFinished() == true) {
                          storyBrain.reset();
                        } else {
                          storyBrain.nextStory(2);
                        }
                      });
                    },
                    child: Text(
                      storyBrain.getChoice2(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
