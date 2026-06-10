import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:madani/src/index.dart';
import 'package:madani/src/madani_repos/homepage/homepage_start_page.dart';
import 'package:madani/src/madani_repos/question_page/question_start_page.dart';
import 'package:madani/src/utils/common_fn.dart';

List<InitiativeDetailOption> option = [
  InitiativeDetailOption(
      id: 0,
      name: 'Kumpulan Sasar',
      iconPath: Assets.images.contentSasar.path,
      activeIconPath: Assets.images.contentSasarAktif.path),
  InitiativeDetailOption(
      id: 1,
      name: 'Syarat Permohonan',
      iconPath: Assets.images.contentSyarat.path,
      activeIconPath: Assets.images.contentSyaratAktif.path),
  InitiativeDetailOption(
      id: 2,
      name: 'Kadar Bantuan',
      iconPath: Assets.images.contentKadar.path,
      activeIconPath: Assets.images.contentKadarAktif.path),
  InitiativeDetailOption(
      id: 3,
      name: 'FAQ',
      iconPath: Assets.images.contentFaq.path,
      activeIconPath: Assets.images.contentFaqAktif.path),
  InitiativeDetailOption(
      id: 4,
      name: 'Agensi Pelaksana',
      iconPath: Assets.images.contentAgensi.path,
      activeIconPath: Assets.images.contentAgensiAktif.path),
];

class ClusterDetailsPage extends StatefulWidget {
  const ClusterDetailsPage({
    super.key,
    required this.titleHeader,
    this.category = '',
    this.fromHomepage = false,
    this.fromResultPage = false,
  });
  final String titleHeader;
  final String category;
  final bool fromHomepage;
  final bool fromResultPage;

  @override
  State<ClusterDetailsPage> createState() => _ClusterDetailsPageState();
}

class _ClusterDetailsPageState extends State<ClusterDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _tabKeys = {};

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _isMainCluster(String clusterName) {
    final upperName = clusterName.toUpperCase();
    switch (upperName) {
      case 'UMUM':
      case 'KESIHATAN':
      case 'MAKANAN':
      case 'PENDAPATAN':
      case 'PENDIDIKAN':
      case 'PENGANGKUTAN':
      case 'PERUMAHAN':
      case 'UTILITI':
        return true;
      default:
        return false;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category.toUpperCase()) {
      case 'UMUM':
        return const Color(0xFF1E40AF); // Blue
      case 'KESIHATAN':
        return const Color(0xFF115E59); // Dark Teal/Green
      case 'MAKANAN':
        return const Color(0xFFB91C1C); // Red
      case 'PENDAPATAN':
        return const Color(0xFF01A7AC); // Teal
      case 'PENDIDIKAN':
        return const Color(0xFF6B21A8); // Purple
      case 'PENGANGKUTAN':
        return const Color(0xFFB91C1C); // Red
      case 'PERUMAHAN':
        return const Color(0xFFD34502); // Orange
      case 'UTILITI':
        return const Color(0xFF00ACD0); // Light Blue/Cyan
      default:
        return const Color(0xFF1E40AF); // Default blue
    }
  }

  Text buildHyperlinkedText(String text) {
    final RegExp urlRegExp = RegExp(r'\b(https?://\S+)\b');
    final matches = urlRegExp.allMatches(text);
    if (matches.isEmpty) {
      return Text(
        text,
        textAlign: TextAlign.justify,
        style: TextStyleMadani.textStyle.interText
            .copyWith(color: MadaniColor.blue),
      );
    }

    List<TextSpan> textSpans = [];
    int previousEnd = 0;

    for (RegExpMatch match in matches) {
      if (match.start > previousEnd) {
        textSpans.add(TextSpan(
          text: text.substring(previousEnd, match.start),
          style: TextStyleMadani.textStyle.interText.copyWith(),
        ));
      }
      textSpans.add(TextSpan(
        text: match.group(0),
        style: TextStyleMadani.textStyle.interText.copyWith(
            color: MadaniColor.blue,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid,
            decorationColor: MadaniColor.blue),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            MadaniUtils.launchURL(url: match.group(0) ?? '');
          },
      ));
      previousEnd = match.end;
    }

    if (previousEnd < text.length) {
      textSpans.add(TextSpan(
        text: text.substring(previousEnd),
        style: TextStyleMadani.textStyle.interText.copyWith(),
      ));
    }

    return Text.rich(
      textAlign: TextAlign.justify,
      TextSpan(
        children: textSpans,
        style: TextStyleMadani.textStyle.interText.copyWith(),
      ),
    );
  }

  String buildHrefTag(String text) {
    final RegExp urlRegExp = RegExp(
        r'(https?://\S+\.com(?:/\S*)?|https?://\S+\.my(?:/\S*)?|www\.\S+\.com(?:/\S*)?|www\.\S+\.my(?:/\S*)?)');
    final matches = urlRegExp.allMatches(text);
    if (matches.isEmpty) {
      return text;
    }

    String modifiedText = text;
    int offset = 0;

    for (RegExpMatch match in matches) {
      final url = match.group(0);
      final start = match.start + offset;
      final end = match.end + offset;

      // Check if the URL starts with "http://" or "https://", if not, prepend "http://"
      final urlWithScheme = url!.startsWith("http") ? url : "http://$url";

      final linkTag = '<a href="$urlWithScheme">$url</a>';
      modifiedText = modifiedText.replaceRange(start, end, linkTag);

      // Update offset for next match
      offset += linkTag.length - (end - start);

      // Find the position of the nearest "<" before the replaced URL
      final previousOpeningTagIndex = modifiedText.lastIndexOf("<", start);
      // Find the position of the nearest ">" after the replaced URL
      final nextClosingTagIndex = modifiedText.indexOf(">", end);

      if (previousOpeningTagIndex != -1 && nextClosingTagIndex != -1) {
        // Check if the text between the nearest "<" and ">" contains "</li></ul>"
        final tagSubstring = modifiedText.substring(
            previousOpeningTagIndex, nextClosingTagIndex + 1);
        if (tagSubstring.contains("</li></ul>")) {
          // Insert the anchor end tag just before the "</li></ul>" tag
          modifiedText =
              '${modifiedText.substring(0, nextClosingTagIndex)}</a>${modifiedText.substring(nextClosingTagIndex)}';
          // Update offset for the added end tag
          offset += 4; // Length of '</a>'
        }
      }
    }

    return modifiedText;
  }

  void _scrollToTab(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;

      final key = _tabKeys[index];
      if (key?.currentContext != null) {
        final RenderBox box = key!.currentContext!.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero, ancestor: context.findRenderObject());
        // We can't really get list view relative position easily without the list view key
        // But we can verify if we can get the position relative to viewport using the Scrollable
        
        // Easier approach: Calculate offset based on known item width if fixed, or rely on ensureVisible if inside SingleChildScrollView
        // But this is horizontal list inside vertical scroll.
        
        // Let's rely on scrollable.ensureVisible is good but we want centering.
        // We need tab's offset inside the configured scroll view.
       
        // Implementation similar to ResultPage:
        final screenWidth = MediaQuery.of(context).size.width;
        // We need to find the RenderObject of the scroll view
        final RenderBox? scrollBox = context.findAncestorRenderObjectOfType<RenderObject>() as RenderBox?; // This might find the parent scaffold
        
        // Since we attached controller to ListView, we can calculate.
        // However, basic "center this item" logic needs item position relative to start of list.
        
        // Let's capture the position of this item in the global coordinate system
        // And compare with the global position of the ListView.
        
        // We can use Scrollable.ensureVisible with alignment 0.5 for centering!
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: 0.5, // 0.5 means center
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider<GenericCubit<int>>(
      create: (context) => GenericCubit<int>.withValue(0),
      child: Scaffold(
        backgroundColor: MadaniColor.white,
        body: Stack(
          children: [
            Column(
              children: [
                // Standard Header
                StandardHeader(
                  onFaqTap: () {
                    Navigator.of(context, rootNavigator: true).pushNamed(FaqRoutes.initialRoute);
                  },
                ),
                // Main Content
                Expanded(
                  child: BlocBuilder<InitiativeBloc, InitiativeState>(
                  builder: (context, initiativeState) {
                    if (initiativeState.detailInitiativeStatus == DetailInitiativeStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (initiativeState.detailInitiativeStatus == DetailInitiativeStatus.error) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(24.w),
                          child: Text(
                            'Gagal memuatkan kandungan. Sila cuba lagi.',
                            textAlign: TextAlign.center,
                            style: TextStyleMadani.textStyle.interText.copyWith(
                              fontSize: 16.sp,
                              color: MadaniColor.black,
                            ),
                          ),
                        ),
                      );
                    }
                    
                    final rawClusterName = initiativeState.initiativeDetail.cluster.isNotEmpty
                        ? initiativeState.initiativeDetail.cluster
                        : (widget.category.isNotEmpty ? widget.category : 'UMUM');
                    final displayClusterName = _isMainCluster(rawClusterName) 
                        ? rawClusterName 
                        : 'Utama';
                    final categoryName = displayClusterName.toUpperCase();
                    final categoryColor = _getCategoryColor(rawClusterName.toUpperCase());
                    
                    return BlocBuilder<GenericCubit<int>, int?>(
                      builder: (context, tabState) {
                        final selectedTab = tabState ?? 0;
                        
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Transform.translate(
              offset: Offset(0, -0.h),
              child: Padding(
                            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.1, 30.h, MediaQuery.of(context).size.width * 0.1, 25.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                // Header Box with Category and Title (Orange border)
                            Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 15.h),
                                  decoration: BoxDecoration(
                                    color: MadaniColor.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: categoryColor, // Orange border
                                      width: 2,
                                  ),
                                  ),
                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      // Category text
                                        Text(
                                        categoryName,
                                        style: TextStyleMadani.textStyle.interText.copyWith(
                                          fontSize: 14.sp,
                                          color: categoryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      SizedBox(height: 8.h),
                                      // Title
                                      Text(
                                        initiativeState.initiativeDetail.name,
                                        style: TextStyleMadani.textStyle.interText.copyWith(
                                          fontSize: 18.sp,
                                          color: MadaniColor.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                              ),
                                      ],
                                    ),
                                  ),
                                SizedBox(height: 20.h),
                                
                                // Tab Navigation and Content in White Box
                            Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    color: MadaniColor.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      // Tab Navigation
                                        SizedBox(
                                        height: 80.h,
                                        child: ListView.builder(
                                          controller: _scrollController,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: option.length,
                                          itemBuilder: (context, index) {
                                            final opt = option[index];
                                            final isSelected = selectedTab == opt.id;
                                            // Assign key
                                            if (!_tabKeys.containsKey(opt.id)) {
                                              _tabKeys[opt.id] = GlobalKey();
                                            }
                                            
                                            return GestureDetector(
                                              onTap: () {
                                                context.read<GenericCubit<int>>().update(opt.id);
                                                _scrollToTab(opt.id);
                                              },
                                child: Container(
                                                key: _tabKeys[opt.id],
                                                margin: EdgeInsets.only(right: 10.w),
                                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 10.h),
                                  decoration: BoxDecoration(
                                                  color: isSelected ? const Color(0xFFEC1C7C) : Colors.grey[300],
                                                  borderRadius: BorderRadius.circular(8),
                                  ),
                                    child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                                    // Use active icon if available, otherwise use regular icon with color filter
                                                    opt.activeIconPath != null && isSelected
                                                        ? SvgPicture.asset(
                                                            opt.activeIconPath!,
                                                            width: 24.r,
                                                            height: 24.r,
                                                          )
                                                        : SvgPicture.asset(
                                                            opt.iconPath,
                                                            width: 24.r,
                                                            height: 24.r,
                                                            colorFilter: ColorFilter.mode(
                                                              isSelected ? Colors.white : Colors.grey[700]!,
                                                              BlendMode.srcIn,
                                                            ),
                                                          ),
                                                    SizedBox(height: 6.h),
                                                Text(
                                                      opt.name,
                                                      style: TextStyleMadani.textStyle.interText.copyWith(
                                                        fontSize: 16.sp,
                                                        color: isSelected ? Colors.white : Colors.grey[700],
                                                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      
                                      // Tab Content with #F2F6FF background
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 15.h),
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
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: _buildTabContent(
                                          context,
                                          selectedTab,
                                          initiativeState.initiativeDetail,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                
                                // Keterangan Section (without box)
                                _buildSectionWithoutBox(
                                  context,
                                  '',
                                  initiativeState.initiativeDetail.body ?? initiativeState.initiativeDetail.description,
                                ),
                                SizedBox(height: 100.h), // Extra padding for fixed bottom bar
                              ],
                            ),
                          ),
                        ),
                      );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          
          // Fixed Bottom Action Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: MadaniColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: BlocBuilder<InitiativeBloc, InitiativeState>(
                builder: (context, initiativeState) {
                  return Row(
                    children: [
                      // Button Kembali
                      Expanded(
                        child: Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFEC1C7C), // Pink border
                              width: 2,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (widget.fromResultPage) {
                                if (Navigator.of(context, rootNavigator: true).canPop()) {
                                  Navigator.of(context, rootNavigator: true).pop();
                                } else {
                                  Navigator.of(context).pop();
                                }
                                return;
                              }
                              
                              if (widget.fromHomepage) {
                                try {
                                  final rootContext = Navigator.of(context, rootNavigator: true).context;
                                  if (rootContext.mounted) {
                                    rootContext.read<BottomBarCubit>().changeNavigation(index: 0);
                                  }
                                } catch (e) {
                                  try {
                                    context.read<BottomBarCubit>().changeNavigation(index: 0);
                                  } catch (_) {}
                                }
                                
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  try {
                                    final rootContext = Navigator.of(context, rootNavigator: true).context;
                                    final homeStartPageState = rootContext.findAncestorStateOfType<HomeStartPageState>();
                                    if (homeStartPageState != null && homeStartPageState.mounted) {
                                      Navigator.of(homeStartPageState.context).pop();
                                    } else {
                                      Navigator.of(context).pop();
                                    }
                                  } catch (e) {
                                    Navigator.of(context).pop();
                                  }
                                });
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(MadaniColor.white),
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
                                Assets.images.btnBack.svg(
                                  width: 18.r,
                                  height: 18.r,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Kembali',
                                  style: TextStyleMadani.textStyle.interText.copyWith(
                                    fontSize: 15.sp,
                                    color: const Color(0xFFEC1C7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      SizedBox(width: 15.w),
                      
                      // Button Mohon Bantuan
                      Expanded(
                        child: (initiativeState.initiativeDetail.fieldPautanTambahan != null &&
                                initiativeState.initiativeDetail.fieldPautanTambahan!.isNotEmpty)
                            ? Container(
                                height: 45.h,
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
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    try {
                                      final url = initiativeState.initiativeDetail.fieldPautanTambahan;
                                      if (url != null && url.isNotEmpty) {
                                        MadaniUtils.launchURL(url: url);
                                      } else {
                                        Navigator.of(context).pushNamed(QuestionPageRoutes.initialRoute);
                                      }
                                    } catch (e) {
                                      Navigator.of(context).pushNamed(QuestionPageRoutes.initialRoute);
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
                                    initiativeState.initiativeDetail.fieldPautanTambahanLabel ?? 'Mohon Bantuan',
                                    style: TextStyleMadani.textStyle.interText.copyWith(
                                      fontSize: 15.sp,
                                      color: MadaniColor.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            : Container(
                                height: 45.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey[300],
                                ),
                                child: Center(
                                  child: Text(
                                    'Tiada Pautan',
                                    style: TextStyleMadani.textStyle.interText.copyWith(
                                      fontSize: 15.sp,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildTabContent(BuildContext context, int selectedTab, InitiativeModel detail) {
    String? content;
    switch (selectedTab) {
      case 0: // Kumpulan Sasar
        content = detail.tabKumpulanSasar;
        break;
      case 1: // Syarat Permohonan
        content = detail.tabSyaratPermohonan;
        break;
      case 2: // Kadar Bantuan
        content = detail.tabKadarBantuan;
        break;
      case 3: // FAQ
        content = detail.tabFaq ?? detail.faqs;
        // Don't use buildHrefTag if content already has HTML tags (like <a> tags)
        // buildHrefTag is only for plain text URLs
        break;
      case 4: // Agensi Pelaksana
        content = detail.tabAgensiPelaksana;
        break;
      default:
        content = null;
    }
    
    // Check if content is empty or null
    if (content == null || content.isEmpty || content.trim().isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text(
            'Tiada Maklumat',
            style: TextStyleMadani.textStyle.interText.copyWith(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
        ),
      );
    }
    
    return _buildTabContentFromHtml(content);
  }

  Widget _buildTabContentFromHtml(String htmlContent) {
    if (htmlContent.contains('<')) {
      return HtmlWidget(
        htmlContent,
        textStyle: TextStyleMadani.textStyle.interText.copyWith(fontSize: 16.sp),
        customStylesBuilder: (_) => {'text-align': 'justify'},
        onTapUrl: (url) {
          MadaniUtils.launchURL(url: url);
          return true;
        },
      );
    } else {
      return Text(
        htmlContent,
        style: TextStyleMadani.textStyle.interText.copyWith(fontSize: 16.sp),
        textAlign: TextAlign.justify,
      );
    }
  }

  Widget _buildSection(BuildContext context, String title, String content, Color categoryColor) {
    if (content.isEmpty || content == 'Tiada maklumat') {
      return const SizedBox();
    }
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 15.h),
                                                    decoration: BoxDecoration(
                                                      color: MadaniColor.white,
        borderRadius: BorderRadius.circular(12),
                                                      ),
                                                      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
          if (title.isNotEmpty) ...[
                                                          Text(
              title,
              style: TextStyleMadani.textStyle.interText.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: MadaniColor.black,
              ),
            ),
            SizedBox(height: 12.h),
          ],
          content.contains('<')
              ? HtmlWidget(
                  content,
                  textStyle: TextStyleMadani.textStyle.interText.copyWith(fontSize: 14.sp),
                  customStylesBuilder: (_) => {'text-align': 'justify'},
                )
              : Text(
                  content,
                  style: TextStyleMadani.textStyle.interText.copyWith(
                    fontSize: 14.sp,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
    );
  }

  Widget _buildSectionWithoutBox(BuildContext context, String title, String content) {
    if (content.isEmpty || content == 'Tiada maklumat') {
      return const SizedBox();
    }
    
    return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
        if (title.isNotEmpty) ...[
                                                Text(
            title,
            style: TextStyleMadani.textStyle.interText.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: MadaniColor.black,
            ),
          ),
          SizedBox(height: 12.h),
        ],
        content.contains('<')
            ? HtmlWidget(
                content,
                textStyle: TextStyleMadani.textStyle.interText.copyWith(fontSize: 14.sp),
                customStylesBuilder: (_) => {'text-align': 'justify'},
              )
            : Text(
                content,
                style: TextStyleMadani.textStyle.interText.copyWith(
                  fontSize: 14.sp,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
      ],
    );
  }

  String _extractSectionFromBody(String body, String sectionName) {
    try {
      if (body.isEmpty) return '';
      
      // Extract section from HTML body
      // Escape special regex characters in sectionName
      final escapedSectionName = RegExp.escape(sectionName);
      final sectionPattern = RegExp(
        '<strong>$escapedSectionName:</strong>.*?(?=<strong>|</p>|\$)',
        caseSensitive: false,
        dotAll: true,
      );
      
      final match = sectionPattern.firstMatch(body);
      if (match != null) {
        String section = match.group(0) ?? '';
        // Remove the section name tag
        final escapedNameForReplace = RegExp.escape(sectionName);
        section = section.replaceAll(RegExp('<strong>$escapedNameForReplace:</strong>', caseSensitive: false), '');
        section = section.replaceAll(RegExp('<br>', caseSensitive: false), '\n');
        section = section.replaceAll(RegExp('</p>', caseSensitive: false), '');
        section = section.replaceAll(RegExp('<p>', caseSensitive: false), '');
        return section.trim();
      }
      
      return '';
    } catch (e) {
      return '';
    }
  }
}
