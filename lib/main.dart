import 'dart:math';
import 'package:flutter/material.dart';

// Enum to represent moves
enum Move { ROCK, PAPER, SCISSORS }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Rock Paper Scissors',
      
      
      home: RPSGame(),
    );
  }
}

class RPSGame extends StatefulWidget {
  @override
  _RPSGameState createState() => _RPSGameState();
}

class _RPSGameState extends State<RPSGame> {
  Move? playerMove;
  Move? aiMove;
  String resultMessage = '';

  final Random random = Random();

  // Function to determine AI move and result
  void playGame(Move move) {
    setState(() {
      playerMove = move;
      aiMove = Move.values[random.nextInt(3)];

      if (playerMove == aiMove) {
        resultMessage = "It's a draw!";
      } else if ((playerMove == Move.ROCK && aiMove == Move.SCISSORS) ||
          (playerMove == Move.PAPER && aiMove == Move.ROCK) ||
          (playerMove == Move.SCISSORS && aiMove == Move.PAPER)) {
        resultMessage = "You win!";
      } else {
        resultMessage = "You lose!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Rock Paper Scissors'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Choose your move:',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => playGame(Move.ROCK),
                child: Text('Rock'),
              ),
              ElevatedButton(
                onPressed: () => playGame(Move.PAPER),
                child: Text('Paper'),
              ),
              ElevatedButton(
                onPressed: () => playGame(Move.SCISSORS),
                child: Text('Scissors'),
              ),
            ],
          ),
          SizedBox(height: 50),
          if (playerMove != null && aiMove != null)
            Column(
              children: [
                Text(
                  'You played: ${playerMove.toString().split('.').last}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'AI played: ${aiMove.toString().split('.').last}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  resultMessage,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: resultMessage == "You win!"
                          ? Colors.green
                          : resultMessage == "You lose!"
                              ? Colors.red
                              : Colors.orange),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

