import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BoardButton.dart';

class XOBoard extends StatefulWidget {
  @override
  XOBoardState createState() => XOBoardState();
}

class XOBoardState extends State<XOBoard> {
  int playingCount = 0;
  int XScore = 0;
  int OScore = 0;
  List<String> boardStatus = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Column(
          children: [
            Text('player 1 (X)        player 2 (O)',style: TextStyle(fontSize: 25),),
            SizedBox(height: 15,),
            Text('${playingCount % 2 == 0 ? 'X' : 'O'} turn',style: TextStyle(fontSize: 25),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('player 1 $XScore'),
                Text('player 2 $OScore'),
              ],
            ),
          ],
        )),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BoardButton(boardStatus[0], 0, onPlayerClick),
              BoardButton(boardStatus[1], 1, onPlayerClick),
              BoardButton(boardStatus[2], 2, onPlayerClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoardButton(boardStatus[3], 3, onPlayerClick),
              BoardButton(boardStatus[4], 4, onPlayerClick),
              BoardButton(boardStatus[5], 5, onPlayerClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BoardButton(boardStatus[6], 6, onPlayerClick),
              BoardButton(boardStatus[7], 7, onPlayerClick),
              BoardButton(boardStatus[8], 8, onPlayerClick),
            ],
          ),
        ),
      ],
    );
  }

  void onPlayerClick(int position) {
    if (boardStatus[position].isNotEmpty) return;
    setState(() {
      if (playingCount % 2 == 0) {
        boardStatus[position] = 'X';
      } else {
        boardStatus[position] = 'O';
      }

      playingCount++;
      checkWinner('X');
      checkWinner('O');
      if (playingCount == 9) {
        resetGame();
      }
    });
  }

  void checkWinner(String player) {
    if (boardStatus[0] == player &&
        boardStatus[1] == player &&
        boardStatus[2] == player) {
      playerWon(player);
    } else if (boardStatus[3] == player &&
        boardStatus[4] == player &&
        boardStatus[5] == player) {
      playerWon(player);
    } else if (boardStatus[6] == player &&
        boardStatus[7] == player &&
        boardStatus[8] == player) {
      playerWon(player);
    } else if (boardStatus[0] == player &&
        boardStatus[3] == player &&
        boardStatus[6] == player) {
      playerWon(player);
    } else if (boardStatus[1] == player &&
        boardStatus[4] == player &&
        boardStatus[7] == player) {
      playerWon(player);
    } else if (boardStatus[2] == player &&
        boardStatus[5] == player &&
        boardStatus[8] == player) {
      playerWon(player);
    } else if (boardStatus[0] == player &&
        boardStatus[4] == player &&
        boardStatus[8] == player) {
      playerWon(player);
    } else if (boardStatus[2] == player &&
        boardStatus[4] == player &&
        boardStatus[6] == player) {
      playerWon(player);
    }
  }

  void playerWon(String player) {
    if(playingCount=='X')
      {
        XScore+=1;

      }
    else
      OScore+=1;
    resetGame();
  }

  resetGame() {
    setState(() {
      playingCount = 0;
      boardStatus = ['', '', '', '', '', '', '', '', ''];
    });
  }
}
