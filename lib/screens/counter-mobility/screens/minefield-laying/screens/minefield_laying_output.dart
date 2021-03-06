import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../router/route_const.dart';
import '../../../../../shared/widgets/top_header.dart';
import '../../../../../shared/widgets/section_heading.dart';
import '../models/moon_lit.dart';
import '../models/minefield_laying.dart';

class MinefieldLayingOutput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MinefieldLaying _model = ModalRoute.of(context).settings.arguments;
    final AppBar appbar = AppBar(
      title: Text("Minefield Laying"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.list),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              minefieldLayingList,
              ModalRoute.withName(counterMobilityScreen),
            );
          },
        ),
        if (Platform.isAndroid)
          Builder(builder: (BuildContext ctx) {
            return IconButton(
              icon: const Icon(Icons.file_download),
              onPressed: () => _model.savePDF(ctx),
            );
          }),
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () => _model.sharePDF(),
        ),
      ],
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TopHeader('Summary of the minefield laying calculation'),
              SectionHeading('1. ', 'Strips'),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "a. Number of Strips = ${_model.numberOfStrips}",
                    ),
                    Text(
                      "b. Number of Anti-Tank Strips = ${_model.numberOfAntiTankStrips}",
                    ),
                    Text(
                      "c. Number of Mixed Strips = ${_model.numberOfMixedStrip}",
                    ),
                  ],
                ),
              ),
              SectionHeading('2. ', 'Mines'),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "a. Number of Anti-Tank Mines = ${_model.antiTankMines}",
                    ),
                    Text(
                      "b. Number of Anti-Personnel Mines = ${_model.antiPersonnelMines}",
                    ),
                  ],
                ),
              ),
              SectionHeading('3. ', 'Stores'),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "a. Long Pickets = ${_model.longPicket}",
                    ),
                    Text(
                      "b. Short Pickets = ${_model.shortPicket}",
                    ),
                    Text(
                      "c. Barbed Wire = ${_model.barbedWire}",
                    ),
                    Text(
                      "d. Perimeter Sign Posting = ${_model.perimeterSignPosting}",
                    ),
                    Text(
                      "e. Tracing Tape = ${_model.tracingTape}",
                    ),
                  ],
                ),
              ),
              SectionHeading('4. ', 'Transport'),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "a. For Anti-Tank Mines = ${_model.totalLorryForAntiTankMine}x 3-ton lorry",
                    ),
                    Text(
                      "b. For Anti-Personnel Mines = ${_model.totalLorryForAntiPersonnelMine}x 3-ton lorry",
                    ),
                    Text(
                      "c. For Perimeter Fencing = ${_model.totalLorryForStores}x 3-ton lorry",
                    ),
                    Wrap(
                      children: [
                        Text("d. For Personnel "),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "= ${_model.totalLorryForPersonnel}x 3-ton lorry",
                            ),
                            Text("= 1x 1/4-ton Jeep"),
                            Text("= 1x 1-ton pickup"),
                            Text("= 1x Ambulance"),
                          ],
                        )
                      ],
                    ),
                    Text(
                      "e. Total 3-ton Require = ${_model.totalTransportRequired}",
                    ),
                    Wrap(
                      children: [
                        Text("f. Total Other Vehicles Require"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("= 1x 1/4-ton Jeep"),
                            Text("= 1x 1-ton pickup"),
                            Text("= 1x Ambulance"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SectionHeading('5. ', 'Time'),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "a. Start Time = ${_model.hourFormat(_model.lastLight)} D-Day (${MoonLit.listOfMoonlit.firstWhere((option) => option.value == _model.dDay).title})",
                    ),
                    Text(
                      "b. Completion Time = ${_model.timeRequired.completionTime}",
                    ),
                    Text(
                      "c. Total Time Require = ${_model.timeRequired.timeRequiredInMinutes}",
                    ),
                  ],
                ),
              ),
              SectionHeading('6. ', 'Layout of Conventional Minefield'),
              Container(
                child: Image.asset(
                  'assets/images/minefield_layout.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
