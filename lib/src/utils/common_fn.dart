import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:madani/src/index.dart';
import 'package:url_launcher/url_launcher.dart';

class MadaniUtils {
  MadaniUtils._internal();

  static void launchURL({required String url}) async {
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView);
    } on HttpException catch(e){
      log('Error launching $url: $e');
    } 
    catch (e) {
      Fluttertoast.showToast(
        msg: 'couldn\'t launch $url',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: MadaniColor.black,
        textColor: MadaniColor.white,
      );
      log('Error launching $url: $e');
      throw HttpException(message: 'Could not launch $url');
    }
  }
}
