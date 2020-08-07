import 'package:intl/intl.dart';

class Util{
  static String appID = "ed60fcfbd110ee65c7150605ea8aceea";

  static getFormattedDate(DateTime dateTime){

    return new DateFormat.yMMMMEEEEd().format(dateTime);
  }
}