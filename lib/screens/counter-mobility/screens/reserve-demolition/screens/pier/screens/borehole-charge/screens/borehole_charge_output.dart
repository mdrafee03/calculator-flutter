import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../../../../../router/route_const.dart';
import '../../../../../../../../../shared/widgets/top_header.dart';
import '../../../../../../../widgets/placement_of_charges.dart';
import '../../../../../../../widgets/summary_of_calculation.dart';
import '../../../../../../../widgets/time_requirement.dart';

import '../models/borehole_charge.dart';

class BoreholeChargeOutput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BoreholeCharge _model = ModalRoute.of(context).settings.arguments;
    final AppBar appbar = AppBar(
      title: Text("Abutment Charge"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.list),
          onPressed: () {
            Navigator.popUntil(
              context,
              ModalRoute.withName(reserveDemolitionChildren),
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
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              TopHeader('Demolition of pier by borehole charge'),
              SummaryOfCalculation(),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "a. No of holes require one row = ${_model.noOfHolesPerRow} Nos",
                    ),
                    Text(
                      "b. No of rows = ${_model.row} Nos",
                    ),
                    Text(
                      "c. Total no of holes = ${_model.totalNoOfholes} Nos",
                    ),
                    Text(
                      "d. Depth of hole = ${_model.depthOfHole}''",
                    ),
                    Text(
                      "e. Distance between rows of borehole = ${_model.depthOfHole}''",
                    ),
                    Text(
                      "f. Depth of explosive to be filled in borehole = ${_model.depthOfExplosiveToBeFilled}''",
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "g. Dia of borehole",
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_model.chargeAndTimeCalucation.length > 1)
                                Text(
                                    "(1) 2.0'' dia borehole will be filled with mud up to initial ${_model.depthOfExplosiveToBeFilled}'' depth"),
                              for (int i = 0;
                                  i < _model.chargeAndTimeCalucation.length;
                                  i++)
                                Text(
                                    "(${_model.chargeAndTimeCalucation.length > 1 ? i + 2 : i + 1}) ${_model.chargeAndTimeCalucation[i].dia}'' dia borehole to be filled with explosive up to initial ${_model.chargeAndTimeCalucation[i].depth}'' depth")
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "h. Charge required in one hole = ${_model.totalCharge.toStringAsFixed(2)} oz PE",
                    ),
                    Text(
                      "j. Total Charge require for one pier = ${_model.totalChargeRequiredOnePier.toStringAsFixed(2)} lb PE",
                    ),
                    Text(
                      "k. Total amount of charge require for demoliton of ${_model.noOfPier} piers = ${_model.totalChargeRequired.toStringAsFixed(2)} lb PE",
                      style: TextStyle(
                        color: Color(0xFF00008B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              TimeRequirement(),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0;
                            i < _model.chargeAndTimeCalucation.length;
                            i++)
                          Text(
                              "${String.fromCharCode(97 + i)}. Time require for making ${_model.chargeAndTimeCalucation[i].timeDepth} inch borehole = ${_model.chargeAndTimeCalucation[i].time.toStringAsFixed(2)} minute")
                      ],
                    ),
                    Text(
                        "    (Auth: ERPB 1964, Section 26, Note (i) and serial 5)"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${String.fromCharCode(97 + _model.chargeAndTimeCalucation.length)}. Total time requirement for demolition of ${_model.noOfPier} piers = ${_model.totalTimeRequired.toStringAsFixed(2)} hr",
                      style: TextStyle(
                        color: Color(0xFF00008B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              PlacementOfCharges(),
              Container(
                child: Image.asset(
                  'assets/images/reserve-demolition/borehole1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: Image.asset(
                  'assets/images/reserve-demolition/borehole2.png',
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
