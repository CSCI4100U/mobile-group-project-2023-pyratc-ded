import 'package:flutter/material.dart';

class ScoresPage{

  // can be made into a diff file for initiallizing with constructors
  late String partnerName, rivalName1, timeStamp1, rivalName2, timeStamp2;
  late double infidelityScore;
  ScoresPage(this.partnerName, this.infidelityScore,
              this.rivalName1, this.timeStamp1, this.rivalName2, this.timeStamp2);
  

  Widget build(BuildContext context){
    var tweetrow =  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // clickable thing
              GestureDetector(
                onTap: () {
                  // onTap testing and GestureDetector (Can also use InkWell)
                  const snackBar = SnackBar(content: Text('Tap'));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child:
              // partnerName and infidelity score
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(partnerName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text('Infidelity Score: '
                    ),
                    SizedBox(width: 8),
                    Text(infidelityScore.toString(),
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              // rivalName and timeStamps (can be put into a different file if values arent together with partner stats)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(rivalName1.toString(),
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(timeStamp1.toString(),
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(rivalName2.toString(),
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(timeStamp2.toString(),
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              // divider
              const Divider(
                height: 20,
                thickness: 2,
                indent: 0,
                endIndent: 0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    ); 
    return tweetrow;
  } 
} 