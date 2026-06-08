import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madani/src/index.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  bool _hasLoaded = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GenericCubit<int>.withValue(0), // Auto open first tab
        ),
        BlocProvider(
          create: (context) => GenericCubit<bool>.withValue(false),
        ),
        BlocProvider(
          create: (context) {
            final bloc = NaccolBloc();
            // Load data after bloc is created
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && !_hasLoaded) {
                _hasLoaded = true;
                print('LOGAPP INFORMATION PAGE: Loading NACCOL data');
                bloc.loadNaccolData();
              }
            });
            return bloc;
          },
        ),
      ],
      child: BlocBuilder<GenericCubit<int>, int?>(
        builder: (context, state) {
          return BlocBuilder<GenericCubit<bool>, bool?>(
            builder: (context, state) {
              return BlocBuilder<NaccolBloc, NaccolState>(
                builder: (context, naccolState) {
                  return Scaffold(
                    backgroundColor: MadaniColor.white,
                    body: Column(
                      children: [
                        const StandardHeader(),
                        Expanded(
                          child: Container(
                            color: MadaniColor.white,
                            child: _buildContent(context, naccolState),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, NaccolState naccolState) {
    print('LOGAPP INFORMATION PAGE: Building content - Status: ${naccolState.status}, Data count: ${naccolState.data.length}');
    
    if (naccolState.status == NaccolStatus.loading) {
      print('LOGAPP INFORMATION PAGE: Showing loading indicator');
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (naccolState.status == NaccolStatus.error) {
      print('LOGAPP INFORMATION PAGE: Error state - ${naccolState.errorMessage}');
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 20.h),
          child: Text(
            'Error loading data: ${naccolState.errorMessage}',
            style: TextStyleMadani.textStyle.interText,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final naccolData = naccolState.data;
    print('LOGAPP INFORMATION PAGE: NACCOL data loaded - Total items: ${naccolData.length}');

    if (naccolData.isEmpty) {
      print('LOGAPP INFORMATION PAGE: No data available');
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 20.h),
          child: Text(
            'Tiada maklumat tersedia',
            style: TextStyleMadani.textStyle.interText,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Transform.translate(
        offset: Offset(0, -0.h),
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
          ),
        child: Column(
          children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Assets.media.images.jataNegaraMalaysia
                        //         .image(scale: 2.4.r),
                        //     SizedBox(width: 5.w),
                        //     Expanded(
                        //       child: Column(
                        //         children: [
                        //           Text(
                        //             'NACCOL',
                        //             style: TextStyleMadani.textStyle.interText
                        //                 .copyWith(
                        //               fontWeight: FontWeight.bold,
                        //               color: MadaniColor.black,
                        //               fontSize: 50.sp,
                        //               shadows: [
                        //                 Shadow(
                        //                   color: MadaniColor.black
                        //                       .withOpacity(0.5),
                        //                   blurRadius: 4,
                        //                   offset: const Offset(0, 4),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //           Text(
                        //             'National Action Council on Cost of Living',
                        //             style: TextStyleMadani.textStyle.interText
                        //                 .copyWith(
                        //               fontSize: 10.sp,
                        //               color: MadaniColor.black,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 40.h),
                        // Container(
                        //   alignment: Alignment.bottomLeft,
                        //   padding: const EdgeInsets.all(10.0),
                        //   width: 355.w,
                        //   height: 171.h,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20.0),
                        //     image: DecorationImage(
                        //       colorFilter: ColorFilter.mode(
                        //         MadaniColor.black.withOpacity(0.43),
                        //         BlendMode.darken,
                        //       ),
                        //       image:
                        //           Assets.media.images.maklumatBanner.provider(),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        //   child: Text.rich(
                        //     TextSpan(
                        //       children: [
                        //         TextSpan(
                        //           text: 'Majlis Tindakan Sara Hidup Negara\n',
                        //           style: TextStyleMadani.textStyle.interText
                        //               .copyWith(
                        //             color: Colors.white,
                        //             fontSize: 19.sp,
                        //             fontWeight: FontWeight.w800,
                        //           ),
                        //         ),
                        //         TextSpan(
                        //           text:
                        //               'National Action Council on Cost of Living (NACCOL)',
                        //           style: TextStyleMadani.textStyle.interText
                        //               .copyWith(
                        //             color: Colors.white,
                        //             fontSize: 11.sp,
                        //             fontWeight: FontWeight.w800,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // SizedBox(
                        //   width: 358,
                        //   child: Text(
                        //     'National Action Council on Cost of Living (NACCOL)',
                        //     style: TextStyle(
                        //       color: MadaniColor.primaryColor,
                        //       fontSize: 20,
                        //       fontFamily: 'Inter',
                        //       fontWeight: FontWeight.w600,
                        //       height: 1.2.h,
                        //     ),
                        //   ),
                        // ),
            SizedBox(
              height: 20.h,
            ),
            // Data is already sorted by sequence in cubit
            ...naccolData.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              print('LOGAPP INFORMATION PAGE: Rendering item $index - Title: ${item.tajuk}');
              return Column(
                children: [
                  maklumatDropdown(
                    index: index,
                    context,
                    title: item.tajuk,
                    desc: item.kandunganProcessed ?? item.kandungan,
                    naccolItem: item,
                  ),
                  if (index < naccolData.length - 1)
                    SizedBox(
                      height: 20.h,
                    ),
                ],
              );
            }).toList(),
            SizedBox(
              height: 50.h,
            ),                        
          ],
        ),
        ),
      ),
    );
  }

  Widget maklumatDropdown(
    BuildContext context, {
    required String title,
    required String desc,
    required int index,
    required NaccolModel? naccolItem,
    double height = 48,
  }) {
    final currentOpenedIndex = context.read<GenericCubit<int>>().state;
    final isOpened = currentOpenedIndex == index;

    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: MadaniColor.white,
        border: Border.all(
          color: isOpened
              ? (context
                      .watch<AccessibilityCubit>()
                      .state
                      .resetColor
                  ? getThemeLightColor(0)
                  : getThemeLightColor(context
                      .watch<AccessibilityCubit>()
                      .state
                      .indexColor))
              : const Color(0xFFD4D4D4),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              print('LOGAPP INFORMATION PAGE: Dropdown tapped - Index: $index, Title: $title, Currently opened: $isOpened');
              // Update the cubit state only if the tapped dropdown is different from the current open dropdown
              if (!isOpened) {
                print('LOGAPP INFORMATION PAGE: Opening dropdown $index');
                context.read<GenericCubit<int>>().update(index);
              } else {
                print('LOGAPP INFORMATION PAGE: Closing dropdown $index');
                context
                    .read<GenericCubit<int>>()
                    .update(-1); // Close the dropdown
              }
            },
            child: Container(
              width: double.infinity,
              height: height.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: MadaniColor.white,
                borderRadius: isOpened
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(11),
                        topRight: Radius.circular(11),
                      )
                    : BorderRadius.circular(11),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyleMadani.textStyle.interText.copyWith(
                      color: MadaniColor.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  isOpened
                      ? SvgPicture.asset(
                          'assets/images/arrow-close.svg',
                          width: 10.w,
                          height: 10.h,
                          colorFilter: const ColorFilter.mode(
                            MadaniColor.black,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/images/arrow-open.svg',
                          width: 10.w,
                          height: 10.h,
                          colorFilter: const ColorFilter.mode(
                            MadaniColor.black,
                            BlendMode.srcIn,
                          ),
                        ),
                ],
              ),
            ),
          ),
          // Show the dropdown content only if it is open
          if (isOpened)
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, 5.h, MediaQuery.of(context).size.width * 0.05, 15.h),
              decoration: BoxDecoration(
                color: context
                        .watch<AccessibilityCubit>()
                        .state
                        .resetColor
                    ? getThemeLightColor(0)
                    : getThemeLightColor(context
                        .watch<AccessibilityCubit>()
                        .state
                        .indexColor),
                //border: Border.all(color: const Color(0xFFA7C2FF), width: 1.0),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      if (title == 'Hubungi Kami' || naccolItem?.tajuk == 'Hubungi Kami') // Hubungi Kami section
                        Builder(
                          builder: (context) {
                            print('LOGAPP INFORMATION PAGE: Building Hubungi Kami section');
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Extract and render contact info (without iframe and buttons)
                                _buildContactInfo(desc),
                                SizedBox(height: 20.h),
                                // Extract and render buttons from HTML
                                _buildButtonsFromHtml(desc),
                                SizedBox(height: 20.h),
                                // Extract and render map iframe
                                _buildMapFromHtml(desc),
                              ],
                            );
                          },
                        )
                      else
                        desc.contains('<')
                            ? HtmlWidget(
                                desc,
                                textStyle: TextStyleMadani.textStyle.interMedium.copyWith(
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                  color: MadaniColor.black,
                                ),
                                customStylesBuilder: (_) => {'text-align': 'justify'},
                              )
                            : Text(
                                desc,
                                textAlign: TextAlign.justify,
                                style: TextStyleMadani.textStyle.interMedium.copyWith(
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                  color: MadaniColor.black,
                                ),
                              ),
                    ],
                  ),
                ),
            ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(String htmlContent) {
    // Remove iframe section and contact-buttons from HTML for contact info display
    String contactHtml = htmlContent;
    // Decode escaped HTML first
    contactHtml = contactHtml
        .replaceAll('\\u003C', '<')
        .replaceAll('\\u003E', '>')
        .replaceAll('\\/', '/');
    // Remove iframe tags and their content
    contactHtml = contactHtml.replaceAll(RegExp(r'<iframe[^>]*>.*?</iframe>', dotAll: true), '');
    contactHtml = contactHtml.replaceAll(RegExp(r'<div[^>]*class="contact-map"[^>]*>.*?</div>', dotAll: true), '');
    // Remove contact-buttons div
    contactHtml = contactHtml.replaceAll(RegExp(r'<div[^>]*class="contact-buttons"[^>]*>.*?</div>', dotAll: true), '');
    
    return contactHtml.contains('<')
        ? HtmlWidget(
            contactHtml,
            textStyle: TextStyleMadani.textStyle.interMedium.copyWith(
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: MadaniColor.black,
            ),
            customStylesBuilder: (_) => {'text-align': 'left'},
          )
        : Text(
            contactHtml,
            style: TextStyleMadani.textStyle.interMedium.copyWith(
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: MadaniColor.black,
            ),
          );
  }

  Widget _buildMapFromHtml(String htmlContent) {
    print('LOGAPP INFORMATION PAGE: Building map from HTML');
    // Extract iframe src from HTML - handle both escaped and unescaped HTML
    String decodedHtml = htmlContent
        .replaceAll('\\u003C', '<')
        .replaceAll('\\u003E', '>')
        .replaceAll('\\/', '/');
    
    final iframeRegex = RegExp('<iframe[^>]*src=["\']([^"\']+)["\']', dotAll: true);
    final match = iframeRegex.firstMatch(decodedHtml);
    
    if (match != null) {
      String? mapUrl = match.group(1);
      if (mapUrl != null && mapUrl.isNotEmpty) {
        print('LOGAPP INFORMATION PAGE: Map URL found: $mapUrl');
        // Decode URL if needed
        mapUrl = Uri.decodeComponent(mapUrl);
        
        // Create HTML with iframe for Google Maps - ensure full height
        final htmlString = '''
<!DOCTYPE html>
<html style="margin:0; padding:0; width:100%; height:100%;">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    html, body {
      width: 100%;
      height: 100%;
      overflow: hidden;
      margin: 0;
      padding: 0;
    }
    iframe {
      width: 100%;
      height: 100%;
      border: 0;
      display: block;
      margin: 0;
      padding: 0;
    }
  </style>
</head>
<body style="margin:0; padding:0; width:100%; height:100%;">
  <iframe 
    src="$mapUrl" 
    style="border:0; width:100%; height:100%; margin:0; padding:0;" 
    allowfullscreen="" 
    loading="lazy" 
    referrerpolicy="no-referrer-when-downgrade">
  </iframe>
</body>
</html>
''';
        
        return Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFD4D4D4), width: 1.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox.expand(
              child: InAppWebView(
                initialData: InAppWebViewInitialData(data: htmlString),
                initialSettings: InAppWebViewSettings(
                  javaScriptEnabled: true,
                  domStorageEnabled: true,
                  useHybridComposition: true,
                  allowsInlineMediaPlayback: true,
                  mediaPlaybackRequiresUserGesture: false,
                  transparentBackground: true,
                  supportZoom: false,
                ),
              ),
            ),
          ),
        );
      }
    }
    
    // Fallback: Show message if map URL not found
    print('LOGAPP INFORMATION PAGE: Map URL not found in HTML');
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD4D4D4), width: 1.0),
        color: Colors.grey[100],
      ),
      child: Center(
        child: Text(
          'Map tidak tersedia',
          style: TextStyleMadani.textStyle.interMedium.copyWith(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonsFromHtml(String htmlContent) {
    print('LOGAPP INFORMATION PAGE: Building buttons from HTML');
    // Decode escaped HTML first
    String decodedHtml = htmlContent
        .replaceAll('\\u003C', '<')
        .replaceAll('\\u003E', '>')
        .replaceAll('\\/', '/');

    // Extract Google Maps button href
    final googleMapsRegex = RegExp('<a[^>]*class=["\']btn-google["\'][^>]*href=["\']([^"\']+)["\']', dotAll: true);
    final googleMapsMatch = googleMapsRegex.firstMatch(decodedHtml);
    final googleMapsUrl = googleMapsMatch?.group(1) ?? 'https://maps.app.goo.gl/41Pc7qU4y8XnChUa8';
    print('LOGAPP INFORMATION PAGE: Google Maps URL: $googleMapsUrl');

    // Extract Google Maps button text
    final googleMapsTextRegex = RegExp('<a[^>]*class=["\']btn-google["\'][^>]*>(.*?)</a>', dotAll: true);
    final googleMapsTextMatch = googleMapsTextRegex.firstMatch(decodedHtml);
    String googleMapsButtonText = googleMapsTextMatch?.group(1)?.trim() ?? 'Google Maps';
    // Remove image tags and other HTML tags, keep only text
    googleMapsButtonText = googleMapsButtonText
        .replaceAll(RegExp(r'<[^>]+>'), '') // Remove all HTML tags
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .trim();
    print('LOGAPP INFORMATION PAGE: Google Maps button text: $googleMapsButtonText');

    // Extract Email button href
    final emailRegex = RegExp('<a[^>]*class=["\']btn-email["\'][^>]*href=["\']([^"\']+)["\']', dotAll: true);
    final emailMatch = emailRegex.firstMatch(decodedHtml);
    final emailUrl = emailMatch?.group(1) ?? 'mailto:secretariat.naccol@kpdn.gov.my';
    print('LOGAPP INFORMATION PAGE: Email URL: $emailUrl');

    // Extract Email button text
    final emailTextRegex = RegExp('<a[^>]*class=["\']btn-email["\'][^>]*>([^<]+)</a>', dotAll: true);
    final emailTextMatch = emailTextRegex.firstMatch(decodedHtml);
    String emailButtonText = emailTextMatch?.group(1)?.trim() ?? 'Email Kami';
    // Remove HTML entities like &nbsp; and decode other entities
    emailButtonText = emailButtonText
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .trim();
    print('LOGAPP INFORMATION PAGE: Email button text: $emailButtonText');

    return Column(
      children: [
        // Google Maps Button - White background with pink border (as shown in image)
        Container(
          width: double.infinity,
          height: 40.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFEC1C7C), // Pink border
              width: 1.5,
            ),
          ),
          child: ElevatedButton(
            onPressed: () async {
              try {
                print('LOGAPP INFORMATION PAGE: Google Maps button pressed - URL: $googleMapsUrl');
                final url = googleMapsUrl.startsWith('http') 
                    ? googleMapsUrl 
                    : 'https://maps.app.goo.gl/41Pc7qU4y8XnChUa8';
                print('LOGAPP INFORMATION PAGE: Launching Google Maps with URL: $url');
                await launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );
                print('LOGAPP INFORMATION PAGE: Google Maps launched successfully');
              } catch (e) {
                print('LOGAPP INFORMATION PAGE: Error launching Google Maps: $e');
                Fluttertoast.showToast(
                  msg: 'Couldn\'t launch Google Maps',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  backgroundColor: MadaniColor.black,
                  textColor: MadaniColor.white,
                );
                log('Error launching Google Maps: $e');
              }
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/icon-maps.svg',
                  width: 20.w,
                  height: 20.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFEC1C7C), // Pink icon
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  googleMapsButtonText,
                  style: TextStyleMadani.textStyle.interText.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFEC1C7C), // Pink text
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        // Email Us Button - Pink gradient style
        Container(
          width: double.infinity,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFEC1C7C), // Pink
                Color(0xFFD91A93), // Darker pink
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF9ED8).withOpacity(0.5),
                offset: const Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () async {
              try {
                print('LOGAPP INFORMATION PAGE: Email button pressed - URL: $emailUrl');
                await launchUrl(
                  Uri.parse(emailUrl),
                  mode: LaunchMode.externalApplication,
                );
                print('LOGAPP INFORMATION PAGE: Email launched successfully');
              } catch (e) {
                print('LOGAPP INFORMATION PAGE: Error launching email: $e');
                Fluttertoast.showToast(
                  msg: 'Couldn\'t launch email',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  backgroundColor: MadaniColor.black,
                  textColor: MadaniColor.white,
                );
                log('Error launching email: $e');
              }
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: Text(
              emailButtonText,
              style: TextStyleMadani.textStyle.interText.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
