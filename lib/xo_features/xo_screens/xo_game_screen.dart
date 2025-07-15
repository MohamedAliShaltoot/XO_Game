import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xo_game/elevatedbutton.dart';
import 'package:xo_game/xo_features/models/players_model.dart';

class XoGameScreen extends StatefulWidget {
  static const String routeName='XoGame';
   const XoGameScreen({super.key});

  @override
  State<XoGameScreen> createState() => _XoGameScreenState();
}

class _XoGameScreenState extends State<XoGameScreen> {
    List<String> boardState=[
      "", "", "",
      "", "", "",
      "", "", "",
    ];
    int counter=1;
    int score1=0;
    int score2=0;

  @override
  Widget build(BuildContext context) {
    PlayersModel model=ModalRoute.of(context)!.settings.arguments as PlayersModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: const Color.fromARGB(255, 223, 222, 217),
          backgroundColor: const Color.fromARGB(255, 6, 37, 62),
          title: Shimmer.fromColors(
            
            baseColor: Colors.red,
            highlightColor: Colors.amber,
            child: const Text(
              "XO Game",
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 30, ),
            ),
          ),
        ),
        body: Column(
          children: [
             Expanded(
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       Text(
                        model.player1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style:
                            const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$score1",
                        style:
                            const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       Text(
                        model.player2,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        style:
                            const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$score2",
                        style:
                            const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevBun(label: boardState[0],onCleck: onBoardClick,index: 0,),
                  ElevBun(label:boardState[1],onCleck: onBoardClick,index: 1,),
                  ElevBun(label: boardState[2],onCleck: onBoardClick,index: 2,),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                     ElevBun(label: boardState[3],onCleck: onBoardClick,index: 3,),
                  ElevBun(label:boardState[4],onCleck: onBoardClick,index: 4,),
                  ElevBun(label: boardState[5],onCleck: onBoardClick,index: 5,),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                     ElevBun(label: boardState[6],onCleck: onBoardClick,index: 6,),
                  ElevBun(label:boardState[7],onCleck: onBoardClick,index: 7,),
                  ElevBun(label: boardState[8],onCleck: onBoardClick,index: 8,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onBoardClick(index){
    if(boardState[index].isNotEmpty){
      return;
    }
    if(counter.isOdd){
       boardState[index]='X';
      // score1+=2;
       bool win= checkWin("X");
       if(win){
         score1+=10;
         resetBoard();
       }
    }else{
      boardState[index]='O';
     // score2+=2;
       bool win= checkWin("O");
       if(win){
         score2+=10;
         resetBoard();
       }
    }
   counter++;
   if(counter==10){
    resetBoard();
   }
    setState(() {});
  }
  resetBoard(){
    boardState=[
      "", "", "",
      "", "", "",
      "", "", "",
    ];
    counter=1;
  }

  bool checkWin(String symbol){
    // check row
    for(int i=0; i<9; i+=3){
       if(boardState[i]==symbol &&boardState[i+1]==symbol&&boardState[i+2]==symbol ) {
      return true;
    }
    }

    //check column
    for(int i=0;i<3;i++){
      if(boardState[i]==symbol &&boardState[i+3]==symbol&&boardState[i+6]==symbol ) {
      return true;
    }
    }
    //check diagonal
    if(boardState[0]==symbol &&boardState[4]==symbol&&boardState[8]==symbol ) {
      return true;
    }
    if(boardState[2]==symbol &&boardState[4]==symbol&&boardState[6]==symbol ) {
      return true;
    }
    return false;
  }

}
