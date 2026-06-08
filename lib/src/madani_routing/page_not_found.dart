import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madani/src/index.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Page Not Found',
          style: TextStyleMadani.textStyle.interAppbar,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.media.images.pageNotFound.image(
              width: MediaQuery.sizeOf(context).width *
                  0.5, // Adjust image size as needed
            ),
            SizedBox(
                height: 20.h), // Add some space between the image and the text
            Text(
              'Sorry, the page you are looking for could not be found.',
              textAlign: TextAlign.center,
              style: TextStyleMadani.textStyle.title,
            ),
          ],
        ),
      ),
    );
  }
}
