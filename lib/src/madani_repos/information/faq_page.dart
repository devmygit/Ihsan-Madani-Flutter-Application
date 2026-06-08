import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:madani/src/index.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  bool _hasLoaded = false;

  @override
  void initState() {
    super.initState();
    log('FAQ PAGE: initState called');
    // Load FAQs when page is first opened - only once
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_hasLoaded) {
        _hasLoaded = true;
        log('FAQ PAGE: Loading FAQs');
        // Get or create FaqBloc from parent context
        final faqBloc = context.read<FaqBloc>();
        faqBloc.add(GetFaqs());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MadaniColor.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: context
                    .watch<AccessibilityCubit>()
                    .state
                    .resetColor
                ? getThemeDarkColor(0)
                : getThemeDarkColor(context
                    .watch<AccessibilityCubit>()
                    .state
                    .indexColor), // Dark theme color
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: MadaniColor.white,
              ),
              onPressed: () => FaqStartPage.of(context).exit(context),
            ),
            centerTitle: true,
            title: Text(
              'Soalan Lazim (FAQ)',
              style: TextStyleMadani.textStyle.interAppbar.copyWith(
                color: MadaniColor.white,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: Offset(0, -0.h),
              child: Container(
                color: MadaniColor.white,
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.1, 20.h, MediaQuery.of(context).size.width * 0.1, 100.h),
              child: BlocBuilder<GenericCubit<int>, int?>(
                builder: (context, state) {
                  return BlocBuilder<FaqBloc, FaqState>(
                    builder: (context, faqState) {
                      // Show loading indicator only when loading first page, not pagination
                      final isLoadingFirstPage = faqState.status == FaqStatus.loading && 
                          faqState.faqs.data.isEmpty;
                      
                      if (isLoadingFirstPage) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      
                      if (faqState.status == FaqStatus.error && faqState.faqs.data.isEmpty) {
                        return Center(
                          child: Text(
                            'Error loading FAQs: ${faqState.errorMessage}',
                            style: TextStyleMadani.textStyle.interText,
                          ),
                        );
                      }

                      final faqs = faqState.faqs.data;
                      print('LOGAPP FAQ PAGE: Current state - currentPage: ${faqState.faqs.currentPage}, total items: ${faqs.length}, hasNextPage: ${faqState.faqs.hasNextPage}');
                      
                      if (faqs.isEmpty) {
                        return Center(
                          child: Text(
                            'Tiada Soalan Lazim tersedia',
                            style: TextStyleMadani.textStyle.interText,
                          ),
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          Text(
                            'Untuk membantu anda, kami telah menyenaraikan semua soalan lazim di bawah. Jika anda tidak menemui maklumat yang anda cari atau mempunyai sebarang soalan tambahan, anda boleh menghubungi pasukan sokongan pelanggan kami.',
                            textAlign: TextAlign.justify,
                            style: TextStyleMadani.textStyle.interText.copyWith(
                              fontSize: 16.sp,
                              color: MadaniColor.black,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          ...faqs.asMap().entries.map((entry) {
                            final index = entry.key;
                            final faq = entry.value;
                            return Column(
                              children: [
                                faqDropdown(
                                  context,
                                  index: index,
                                  title: faq.title,
                                  body: faq.bodyProcessed ?? faq.body,
                                ),
                                SizedBox(height: 20.h),
                              ],
                            );
                          }),
                          // Tunjuk Lagi Button - Show only if there's next page
                          if (faqState.faqs.hasNextPage && 
                              faqState.status != FaqStatus.loading)
                            Padding(
                              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                              child: Container(
                                width: double.infinity,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
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
                                    // API returns currentPage as 1-based (1, 2, 3...), but we use 0-based (0, 1, 2...)
                                    // Convert API's 1-based currentPage to our 0-based: currentPage0Based = currentPage - 1
                                    // Then next page = currentPage0Based + 1 = (currentPage - 1) + 1 = currentPage
                                    final nextPage = faqState.faqs.currentPage; // API currentPage=1 means we sent page=0, so next is page=1
                                    print('LOGAPP FAQ PAGE: Tunjuk Lagi clicked - API currentPage (1-based): ${faqState.faqs.currentPage}, Next page (0-based): $nextPage');
                                    context.read<FaqBloc>().add(
                                      GetFaqs(page: nextPage),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(Colors.transparent),
                                    shadowColor:
                                        WidgetStateProperty.all(Colors.transparent),
                                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Tunjuk Lagi',
                                    style: TextStyleMadani.textStyle.interText.copyWith(
                                      fontSize: 18.sp,
                                      color: MadaniColor.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          // Show loading indicator when loading more
                          if (faqState.status == FaqStatus.loading && 
                              faqs.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
                ),
            ),
          ),
        ],
      ),
    );
  }

  Widget faqDropdown(
    BuildContext context, {
    required String title,
    required String body,
    required int index,
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
              if (!isOpened) {
                context.read<GenericCubit<int>>().update(index);
              } else {
                context.read<GenericCubit<int>>().update(-1);
              }
            },
            child: Container(
              width: double.infinity,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: Text(
                        title,
                        maxLines: null,
                        softWrap: true,
                        style: TextStyleMadani.textStyle.interText.copyWith(
                          color: MadaniColor.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: isOpened
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
                  ),
                ],
              ),
            ),
          ),
          if (isOpened)
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.1, 5.h, MediaQuery.of(context).size.width * 0.1, 15.h),
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
                borderRadius: BorderRadius.circular(11),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (body.contains('<'))
                      HtmlWidget(
                        body,
                        textStyle: TextStyleMadani.textStyle.interMedium.copyWith(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          color: MadaniColor.black,
                        ),
                        customStylesBuilder: (_) => {'text-align': 'justify'},
                      )
                    else
                      Text(
                        body,
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
}

