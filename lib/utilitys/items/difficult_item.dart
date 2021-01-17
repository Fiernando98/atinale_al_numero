import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DifficultItem extends StatelessWidget {
  final String name;
  final int numMax;
  final int numMin;
  final Function onTapPlay;

  DifficultItem(
      {@required this.name,
      @required this.numMax,
      @required this.numMin,
      this.onTapPlay});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 15,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "[$numMin - $numMax]",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: onTapPlay,
                        icon: Icon(Icons.videogame_asset),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
