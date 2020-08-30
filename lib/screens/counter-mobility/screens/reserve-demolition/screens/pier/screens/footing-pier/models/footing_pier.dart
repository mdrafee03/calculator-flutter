class FootingPier {
  double width;
  double thickness;
  int noOfPier;

  double get explosivePerCharge {
    int factor = thickness <= 6 ? 10 : 20;
    return factor * thickness;
  }

  int get totalNoOfCharge {
    return (width / thickness).ceil();
  }

  double get amountOfChargePerPier {
    return explosivePerCharge * totalNoOfCharge;
  }

  double get totalAmountOfCharge {
    return amountOfChargePerPier * noOfPier;
  }

  double get outerCharges {
    return thickness / 2 * 12;
  }

  double get innerCharges {
    return thickness * 12;
  }

  double get totalTimeRequired {
    int timePerSection = width <= 20 ? 2 : 3;
    return (noOfPier * timePerSection / 4) >= 1
        ? (noOfPier * timePerSection / 4)
        : 1;
  }
}
