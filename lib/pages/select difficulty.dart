import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeracion_maya/models_class/difficulty.dart';
import 'package:numeracion_maya/models_class/numbers.dart';
import 'package:numeracion_maya/pages/play_page.dart';
import 'package:numeracion_maya/utilitys/items/difficult_item.dart';
import 'package:numeracion_maya/utilitys/languages.dart';
import 'package:numeracion_maya/utilitys/providers/plays_providers.dart';
import 'package:provider/provider.dart';

class SelectDifficulty extends StatefulWidget {
  final int count;

  SelectDifficulty({@required this.count});

  @override
  _SelectDifficultyState createState() => _SelectDifficultyState();
}

class _SelectDifficultyState extends State<SelectDifficulty> {
  @override
  Widget build(BuildContext context) {
    List<Difficulty> listDifficult = [
      Difficulty(
          name: getTranslation[getLanguage(context)]['Beginner'],
          numMin: 0,
          numMax: 10),
      Difficulty(
        name: getTranslation[getLanguage(context)]['Easy'],
        numMin: 10,
        numMax: 70,
      ),
      Difficulty(
        name: getTranslation[getLanguage(context)]['Normal'],
        numMin: 70,
        numMax: 300,
      ),
      Difficulty(
        name: getTranslation[getLanguage(context)]['Hard'],
        numMin: 300,
        numMax: 1000,
      ),
      Difficulty(
        name: getTranslation[getLanguage(context)]['VeryHard'],
        numMin: 1000,
        numMax: 7000,
      ),
      Difficulty(
        name: getTranslation[getLanguage(context)]['Insane'],
        numMin: 7000,
        numMax: 15000,
      ),
      Difficulty(
        name: getTranslation[getLanguage(context)]['Legend'],
        numMin: 15000,
        numMax: 100000,
      ),
      Difficulty(
        name: getTranslation[getLanguage(context)]
            ['OkWeKnowYouAreGoingtoUseYourCalculator'],
        numMin: 100000,
        numMax: 1000000,
      ),
      Difficulty(
        name: getTranslation[getLanguage(context)]['TakeYourTimeDontWorry'],
        numMin: 1000000,
        numMax: 2000000,
      )
    ];

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslation[getLanguage(context)]['SelectDifficulty'],
          style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            onPressed: Navigator.of(context).maybePop),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: listDifficult
                    .map((difficult) => DifficultItem(
                          name: difficult.name,
                          numMax: difficult.numMax,
                          numMin: difficult.numMin,
                          onTapPlay: () {
                            makePlays(
                                max: difficult.numMax, min: difficult.numMin);
                          },
                        ))
                    .toList(),
              ))
        ],
      ),
    ));
  }

  void makePlays({@required int max, @required int min}) async {
    List<Numbers> playsList = [];
    while (playsList.length != widget.count) {
      playsList.add(Numbers(
          num: Random().nextInt((max + 1) - min) + min,
          type: TypeNumber.values[Random().nextInt(2)]));
    }
    context.read<PlaysProvider>().makePlays(newList: playsList);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => PlayPage()),
    );
  }
}
