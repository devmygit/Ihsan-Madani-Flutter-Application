import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:madani/src/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:madani/src/madani_repos/cluster/cluster_model.dart';
import 'package:madani/src/madani_repos/homepage/homepage_start_page.dart';
import 'package:madani/src/utils/common_fn.dart';

// Diagonal Background Painter for category section
class DiagonalBackgroundPainter extends CustomPainter {
  final Color backgroundColor;
  
  DiagonalBackgroundPainter({required this.backgroundColor});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.85)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant DiagonalBackgroundPainter oldDelegate) => 
      oldDelegate.backgroundColor != backgroundColor;
}

class MadaniHomePage extends StatefulWidget {
  const MadaniHomePage({super.key});

  @override
  State<MadaniHomePage> createState() => _MadaniHomePageState();
}

class _MadaniHomePageState extends State<MadaniHomePage> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  String? _visibleVideoUrl;
  
  // Jumlah banner yang akan dipaparkan di UI
  final int maxBannerDisplay = 5;
  
  // PageController untuk banner auto-scroll
  PageController? _bannerPageController;
  Timer? _bannerTimer;
  int _currentBannerIndex = 0;
  
  // PageController untuk carian popular auto-scroll
  PageController? _popularSearchPageController;
  Timer? _popularSearchTimer;
  int _currentPopularSearchIndex = 0;
  
  // PageController untuk infografik auto-scroll
  PageController? _infographicPageController;
  Timer? _infographicTimer;
  int _currentInfographicIndex = 0;
  
  // Flag to track if user clicked a category (to prevent auto-navigation from hydrated state)
  bool _userClickedCategory = false;

  @override
  void initState() {
    super.initState();
    _bannerPageController = PageController();
    _popularSearchPageController = PageController();
    _infographicPageController = PageController();
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _bannerPageController?.dispose();
    _popularSearchTimer?.cancel();
    _popularSearchPageController?.dispose();
    _infographicTimer?.cancel();
    _infographicPageController?.dispose();
    super.dispose();
  }

  void _startBannerAutoScroll(int bannerCount) {
    _bannerTimer?.cancel();
    if (bannerCount <= 1) return;
    
    _bannerTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      try {
        if (_bannerPageController != null && _bannerPageController!.hasClients) {
          final currentPage = _bannerPageController!.page?.round() ?? _currentBannerIndex;
          final nextIndex = (currentPage + 1) % bannerCount;
          setState(() {
            _currentBannerIndex = nextIndex;
          });
          _bannerPageController!.animateToPage(
            nextIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      } catch (e) {
        log('Error in banner auto-scroll: $e');
      }
    });
  }

  void _startPopularSearchAutoScroll(int popularSearchCount) {
    _popularSearchTimer?.cancel();
    if (popularSearchCount <= 1) return;
    
    _popularSearchTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      try {
        if (_popularSearchPageController != null && _popularSearchPageController!.hasClients) {
          final nextIndex = (_currentPopularSearchIndex + 1) % popularSearchCount;
          _popularSearchPageController!.animateToPage(
            nextIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      } catch (e) {
        log('Error in popular search auto-scroll: $e');
      }
    });
  }

  void _startInfographicAutoScroll(int infographicCount) {
    _infographicTimer?.cancel();
    if (infographicCount <= 1) return;
    
    _infographicTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      try {
        if (_infographicPageController != null && _infographicPageController!.hasClients) {
          final currentPage = _infographicPageController!.page?.round() ?? _currentInfographicIndex;
          final nextIndex = (currentPage + 1) % infographicCount;
          setState(() {
            _currentInfographicIndex = nextIndex;
          });
          _infographicPageController!.animateToPage(
            nextIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      } catch (e) {
        log('Error in infographic auto-scroll: $e');
      }
    });
  }

  void _showInfographicZoomDialog(BuildContext context, String imageUrl) {
    try {
      showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (BuildContext dialogContext) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: Stack(
                children: [
                  Center(
                    child: InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 4.0,
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    right: 20.w,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      log('Error showing infographic zoom dialog: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MultiBlocListener(
        listeners: [
          BlocListener<InitiativeBloc, InitiativeState>(
            listener: (context, state) {
              log('${state.getInitiativeStatus}');
              if (state.getInitiativeStatus == GetInitiativeStatus.loading) {
                // Only show loading if user clicked a category
                if (_userClickedCategory) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) {
                      return const AlertDialog(
                        content: Row(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(width: 20),
                            Text("Loading..."),
                          ],
                        ),
                      );
                    },
                  );
                }
              }
              // Only navigate if user clicked a category and state is completed
              if (state.getInitiativeStatus == GetInitiativeStatus.completed && _userClickedCategory) {
                final cluster = clusterModel.firstWhere(
                  (el) => el.shortName.toLowerCase() == state.currentCluster,
                  orElse: () => ClusterModel(
                      clusterId: '',
                      clusterTitle: '',
                      shortName: '',
                      clusterIcon: '',
                      clusterImg: ''),
                );
                if (cluster.shortName.isNotEmpty) {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pop();
                  
                  // Change to Inisiatif tab (index 1) - this will show ClusterPage
                  // ClusterPage will automatically reload with the selected cluster from state
                  try {
                    final rootContext = Navigator.of(context, rootNavigator: true).context;
                    if (rootContext.mounted) {
                      rootContext.read<BottomBarCubit>().changeNavigation(index: 1);
                    }
                  } catch (e) {
                    try {
                      context.read<BottomBarCubit>().changeNavigation(index: 1);
                    } catch (_) {
                      // If can't access BottomBarCubit, ignore
                    }
                  }
                  
                  // No need to push route - ClusterPage already exists in HomepageStartPage
                  // It will automatically reload with the selected cluster from InitiativeBloc state
                } else {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pop();
                }
                // Reset flag after navigation
                _userClickedCategory = false;
              }
              if (state.getInitiativeStatus == GetInitiativeStatus.error && _userClickedCategory) {
                Navigator.of(context, rootNavigator: true).pop();
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        'Please Try Again later...',
                        style: TextStyleMadani.textStyle.interText
                            .copyWith(color: MadaniColor.white),
                      ),
                    ),
                  );
                // Reset flag after error
                _userClickedCategory = false;
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: MadaniColor.white,
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<HomeBloc>().add(GetBanner());
              // context.read<HomeBloc>().add(GetAnnoucement()); // Removed - API not used
              // context.read<HomeBloc>().add(GetPoster()); // Removed - API not used
            },
            child: Stack(
              children: [
                CustomScrollView(
                  primary: true,
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _StandardHeaderDelegate(),
                    ),
                    // Section 1: Category with Diagonal Background
                    SliverToBoxAdapter(
                      child: Transform.translate(
                        offset: Offset(0, -40.h),
                        child: LayoutBuilder(
                        builder: (context, constraints) {
                        // Calculate approximate height needed for content
                        final screenWidth = constraints.maxWidth;
                        final cardHeight = (screenWidth - 10.w - 6.w) / 2 / 1.111; // Based on grid aspect ratio (2 columns, height reduced by 10%)
                        final gridHeight = (cardHeight * 4) + (5.0 * 3); // 4 rows + spacing (8 items / 2 columns = 4 rows)
                        final titleHeight = 0.h; // Approximate title height
                        final sectionHeight = -30.h + titleHeight + 24.h + gridHeight + 10.h + 20.h; // All spacing + title (reduced)
                        
                        return Container(
                          height: sectionHeight,
                          child: Stack(
                            children: [
                              // Diagonal split background
                              Positioned.fill(
                                child: CustomPaint(
                                  painter: DiagonalBackgroundPainter(
                                    backgroundColor: context
                                            .watch<AccessibilityCubit>()
                                            .state
                                            .resetColor
                                        ? getThemePrimaryColor(0)
                                        : getThemePrimaryColor(context
                                            .watch<AccessibilityCubit>()
                                            .state
                                            .indexColor),
                                  ),
                                ),
                              ),
                              // Content
                              Column(
                                children: [
                                  SizedBox(height: 10.h),
                                  // Large centered title
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                      child: Text(
                                        'Saya mencari inisiatif mengikut kategori..',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyleMadani.textStyle.interText
                                            .copyWith(
                                          fontSize: 25.sp,
                                          color: MadaniColor.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  // 2 columns Grid of category cards
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 15.0,
                                        crossAxisSpacing: 12.0,
                                        childAspectRatio: 1.111, // Height reduced by 10% (1.0 / 0.9)
                                      ),
                                      itemCount: clusterModel.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        final cluster = clusterModel[index];
                                        // Convert to sentence case (only first letter uppercase)
                                        final titleText = cluster.shortName.isNotEmpty
                                            ? cluster.shortName[0].toUpperCase() +
                                                cluster.shortName.substring(1).toLowerCase()
                                            : cluster.shortName;
                                        return categoryCard(
                                          onTap: () {
                                            // Set flag to indicate user clicked a category
                                            _userClickedCategory = true;
                                            final clusterValue = cluster.shortName.toLowerCase();
                                            context.read<InitiativeBloc>().add(
                                                GetInitiative(cluster: clusterValue));
                                          },
                                          title: titleText,
                                          image: AssetImage(cluster.clusterImg),
                                          color: _getCategoryColor(cluster.shortName),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                      ),
                    ),
                      // Section 2: Sorotan Terkini with theme light color Background
                      SliverToBoxAdapter(
                        child: Container(
                          color: context
                                  .watch<AccessibilityCubit>()
                                  .state
                                  .resetColor
                              ? getThemeLightColor(0)
                              : getThemeLightColor(context
                                  .watch<AccessibilityCubit>()
                                  .state
                                  .indexColor),
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                  child: Text(
                                  'Sorotan Terkini',
                                  textAlign: TextAlign.center,
                                  style: TextStyleMadani.textStyle.interAppbar
                                      .copyWith(
                                    fontSize: 30.sp,
                                    color: MadaniColor.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ),
                              SizedBox(height: 15.h),
                              BlocBuilder<HomeBloc, HomeState>(
                                builder: (context, state) {
                                  print('LOGAPP: Total banner dalam state: ${state.banner.data.length}');
                                  print('LOGAPP: Banner IDs dalam state: ${state.banner.data.map((e) => e.id).toList()}');
                                  
                                  // Limit jumlah banner yang dipaparkan
                                  final displayedBanners = state.banner.data.take(maxBannerDisplay).toList();
                                  
                                  if (displayedBanners.isEmpty) {
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 180.h,
                                      margin: EdgeInsets.only(right: 15.w),
                                      decoration: BoxDecoration(
                                        color: MadaniColor.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Tiada Sorotan Terkini',
                                          style: TextStyleMadani
                                              .textStyle.interAppbar,
                                        ),
                                      ),
                                    );
                                  }

                                  // Start auto-scroll when banners are available
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    _startBannerAutoScroll(displayedBanners.length);
                                  });

                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 600.h,
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            PageView.builder(
                                          controller: _bannerPageController,
                                          onPageChanged: (index) {
                                            setState(() {
                                              _currentBannerIndex = index;
                                            });
                                            // Restart timer when user manually scrolls
                                            _startBannerAutoScroll(displayedBanners.length);
                                          },
                                          itemCount: displayedBanners.length,

                                          itemBuilder: (context, i) {
                                            final data = displayedBanners[i];
                                            return Container(
                                              width: MediaQuery.sizeOf(context).width,
                                              padding: EdgeInsets.only(
                                                top: 30.h, 
                                                left: MediaQuery.of(context).size.width * 0.1, 
                                                right: MediaQuery.of(context).size.width * 0.1
                                              ),
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  // Main box with background theme color
                                                  Container(
                                                    margin: EdgeInsets.only(top: 20.h),
                                                    decoration: BoxDecoration(
                                                      color: context
                                                              .watch<AccessibilityCubit>()
                                                              .state
                                                              .resetColor
                                                          ? getThemePrimaryColor(0)
                                                          : getThemePrimaryColor(context
                                                              .watch<AccessibilityCubit>()
                                                              .state
                                                              .indexColor),
                                                      borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        // Title and Description section
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 40.h, left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1, bottom: 15.h),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              // Title
                                                              Text(
                                                                data.title,
                                                                style: TextStyleMadani.textStyle.interText.copyWith(
                                                                  fontSize: 16.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: MadaniColor.white,
                                                                ),
                                                                //maxLines: 2,
                                                                //overflow: TextOverflow.ellipsis,
                                                              ),
                                                              SizedBox(height: 8.h),
                                                              // Description
                                                              Text(
                                                                data.description,
                                                                style: TextStyleMadani.textStyle.interText.copyWith(
                                                                  fontSize: 16.sp,
                                                                  color: MadaniColor.white.withOpacity(0.9),
                                                                ),
                                                                maxLines: 5,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        // Image at bottom
                                                        Expanded(
                                                          child: ClipRRect(
                                                            borderRadius: const BorderRadius.only(
                                                              bottomLeft: Radius.circular(12),
                                                              bottomRight: Radius.circular(12),
                                                            ),
                                                            child: data.media?.fileUrl != null && data.media!.fileUrl.isNotEmpty
                                                                ? CachedNetworkImage(
                                                                    imageUrl: data.media!.fileUrl,
                                                                    alignment: Alignment.topCenter,
                                                                    fit: BoxFit.cover,
                                                                    width: double.infinity,
                                                                    height: double.infinity,
                                                                  )
                                                                : Container(
                                                                    color: Colors.grey[300],
                                                                  ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // Small logo at top left - positioned outside the box
                                                  if (data.logo?.fileUrl != null && data.logo!.fileUrl.isNotEmpty)
                                                    Positioned(
                                                      top: -5.h,
                                                      left: 15.w,
                                                      child: Container(
                                                        padding: EdgeInsets.all(5.w),
                                                        decoration: BoxDecoration(
                                                          color: MadaniColor.white,
                                                          borderRadius: BorderRadius.circular(8),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.black.withOpacity(0.2),
                                                              blurRadius: 8,
                                                              offset: const Offset(0, 2),
                                                              spreadRadius: 1,
                                                            ),
                                                          ],
                                                        ),
                                                        child: CachedNetworkImage(
                                                          imageUrl: data.logo!.fileUrl,
                                                          width: 100.w,
                                                          height: 40.h,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  // Small floating circular button with arrow icon at bottom right - positioned in front of image
                                                  if (data.url != null && data.url!.isNotEmpty)
                                                    Positioned(
                                                      bottom: 10.h,
                                                      right: 15.w,
                                                      child: InkWell(
                                                        onTap: () {
                                                          MadaniUtils.launchURL(url: data.url!);
                                                        },
                                                        borderRadius: BorderRadius.circular(50),
                                                        child: Container(
                                                          width: 30.w,
                                                          height: 30.w,
                                                          decoration: BoxDecoration(
                                                            color: MadaniColor.white,
                                                            shape: BoxShape.circle,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors.black.withOpacity(0.2),
                                                                blurRadius: 8,
                                                                offset: const Offset(0, 2),
                                                                spreadRadius: 1,
                                                              ),
                                                            ],
                                                          ),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.arrow_forward,
                                                              color: const Color(0xFFEC1C7C),
                                                              size: 20.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                            // Left Arrow
                                            _buildNavArrow(
                                              isLeft: true,
                                              onTap: () {
                                                if (_bannerPageController != null && _bannerPageController!.hasClients) {
                                                  _bannerPageController!.previousPage(
                                                    duration: const Duration(milliseconds: 300),
                                                    curve: Curves.easeInOut,
                                                  );
                                                }
                                              },
                                            ),
                                            // Right Arrow
                                            _buildNavArrow(
                                              isLeft: false,
                                              onTap: () {
                                                if (_bannerPageController != null && _bannerPageController!.hasClients) {
                                                  _bannerPageController!.nextPage(
                                                    duration: const Duration(milliseconds: 300),
                                                    curve: Curves.easeInOut,
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Indicators
                                      SizedBox(height: 15.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(
                                          displayedBanners.length,
                                          (index) => GestureDetector(
                                            onTap: () {
                                              try {
                                                if (_bannerPageController != null && _bannerPageController!.hasClients) {
                                                  _bannerPageController!.animateToPage(
                                                    index,
                                                    duration: const Duration(milliseconds: 300),
                                                    curve: Curves.easeInOut,
                                                  );
                                                  // Restart timer when user clicks indicator
                                                  _startBannerAutoScroll(displayedBanners.length);
                                                }
                                              } catch (e) {
                                                log('Error navigating to banner page: $e');
                                              }
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                                              width: index == _currentBannerIndex ? 24.w : 8.w,
                                              height: index == _currentBannerIndex ? 8.h : 8.w, // Circle for inactive (width == height)
                                              decoration: BoxDecoration(
                                                color: index == _currentBannerIndex
                                                    ? const Color(0xFFEC1C7C)
                                                    : Colors.white,
                                                borderRadius: BorderRadius.circular(
                                                  index == _currentBannerIndex ? 4 : 4.w, // Rounded rectangle for active, circle for inactive
                                                ),
                                                border: index != _currentBannerIndex
                                                    ? Border.all(
                                                        color: const Color(0xFFEC1C7C).withOpacity(0.3),
                                                        width: 1,
                                                      )
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(height: 40.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Section 3: Carian Popular with White Background

                    SliverToBoxAdapter(
                      child: Container(
                        color: MadaniColor.white,
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.h, bottom: 100.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                child: Text(
                                'Carian Popular',
                                textAlign: TextAlign.center,
                                style: TextStyleMadani.textStyle.interAppbar
                                    .copyWith(
                                  fontSize: 30.sp,
                                  color: MadaniColor.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ),
                            SizedBox(height: 20.h),
                            BlocBuilder<HomeBloc, HomeState>(
                              builder: (context, state) {
                                print('LOGAPP: Total popular searches dalam state: ${state.popularSearches.data.length}');
                                print('LOGAPP: Popular searches nids dalam state: ${state.popularSearches.data.map((e) => e.nid).toList()}');
                                print('LOGAPP: Popular searches sequences dalam state: ${state.popularSearches.data.map((e) => e.sequence).toList()}');
                                
                                if (state.popularSearches.data.isEmpty) {
                                  return Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 150.h,
                                    margin: EdgeInsets.only(right: 15.w),
                                    decoration: BoxDecoration(
                                      color: MadaniColor.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.grey[300]!),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Tiada Carian Popular',
                                        style: TextStyleMadani
                                            .textStyle.interAppbar,
                                      ),
                                    ),
                                  );
                                }
                                // Start auto-scroll when popular searches are available
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  _startPopularSearchAutoScroll(state.popularSearches.data.length);
                                });

                                return Column(
                                  children: [
                                    SizedBox(

                                      height: 280.h,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          PageView.builder(
                                            controller: _popularSearchPageController,
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentPopularSearchIndex = index;
                                              });
                                              // Restart timer when user manually scrolls
                                              _startPopularSearchAutoScroll(state.popularSearches.data.length);

                                        },
                                        itemCount: state.popularSearches.data.length,
                                        itemBuilder: (context, i) {
                                          final inisiatif = state.popularSearches.data[i];
                                          // Guna urlButtonName untuk label kategori
                                          final categoryName = inisiatif.urlButtonName ?? 'Umum';
                                          final borderColor = _getCategoryColor(categoryName);
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // Card
                                              Padding(
                                                // Add padding here to simulate the original parent padding
                                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                                child: InkWell(
                                                  onTap: () {
                                                    // Use nid if available, otherwise use id
                                                    final id = (inisiatif.nid != null && inisiatif.nid!.isNotEmpty) 
                                                        ? inisiatif.nid! 
                                                        : inisiatif.id;
                                                    
                                                    print('LOGAPP HOMEPAGE: Opening article detail - UUID: ${inisiatif.uuid}, nid: ${inisiatif.nid}, id: ${inisiatif.id}, Using: $id');
                                                    
                                                    context
                                                        .read<InitiativeBloc>()
                                                        .add(GetInitiativeDetails(id));

                                                    // Use HomeStartPage navigator explicitly to ensure detail page is pushed to correct navigator
                                                    try {
                                                      final homeStartPageState = context.findAncestorStateOfType<HomeStartPageState>();
                                                      if (homeStartPageState != null && homeStartPageState.mounted) {
                                                        Navigator.of(homeStartPageState.context).pushNamed(
                                                          MadaniRoutes.klusterDetailRoute,
                                                          arguments: {
                                                            'appBarTitle': 'Inisiatif',
                                                            'category': categoryName,
                                                            'fromHomepage': true, // Flag to indicate navigation from homepage
                                                          },
                                                        );
                                                      } else {
                                                        // Fallback to default navigator if HomeStartPageState not found
                                                        Navigator.of(context).pushNamed(
                                                          MadaniRoutes.klusterDetailRoute,
                                                          arguments: {
                                                            'appBarTitle': 'Inisiatif',
                                                            'category': categoryName,
                                                            'fromHomepage': true,
                                                          },
                                                        );
                                                      }
                                                    } catch (e) {
                                                      // Fallback to default navigator if error
                                                      Navigator.of(context).pushNamed(
                                                        MadaniRoutes.klusterDetailRoute,
                                                        arguments: {
                                                          'appBarTitle': 'Inisiatif',
                                                          'category': categoryName,
                                                          'fromHomepage': true,
                                                        },
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(context).width,
                                                    decoration: BoxDecoration(
                                                      color: MadaniColor.white,
                                                      borderRadius: BorderRadius.circular(12),
                                                      border: Border.all(color: borderColor, width: 2),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(12.w),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          // Category label dengan background putih
                                                          Container(
                                                            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 4.h),
                                                            decoration: BoxDecoration(
                                                              color: MadaniColor.white,
                                                              borderRadius: BorderRadius.circular(4),
                                                            ),
                                                            child: Text(
                                                              categoryName.toUpperCase(),
                                                              style: TextStyleMadani.textStyle.interText.copyWith(
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight.bold,
                                                                color: borderColor,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 8.h),
                                                          // Title
                                                          Text(
                                                            inisiatif.name,
                                                            style: TextStyleMadani.textStyle.interText.copyWith(
                                                              fontSize: 16.sp,
                                                              fontWeight: FontWeight.bold,
                                                              color: MadaniColor.black,
                                                            ),
                                                            maxLines: 3,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 8.h),
                                              // Description di luar box
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                                child: Container(
                                                  width: MediaQuery.sizeOf(context).width,
                                                  child: Text(
                                                    inisiatif.description,
                                                    style: TextStyleMadani.textStyle.interText.copyWith(
                                                      fontSize: 16.sp,
                                                      color: MadaniColor.black.withOpacity(0.7),
                                                    ),
                                                    maxLines: 5,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                            // Left Arrow - aligned with item card
                                            Positioned(
                                              top: 0,
                                              bottom: 200.h,
                                              left: MediaQuery.of(context).size.width * 0.1 - 22.w,
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (_popularSearchPageController != null && _popularSearchPageController!.hasClients) {
                                                      _popularSearchPageController!.previousPage(
                                                        duration: const Duration(milliseconds: 300),
                                                        curve: Curves.easeInOut,
                                                      );
                                                    }
                                                  },
                                                  behavior: HitTestBehavior.translucent,
                                                  child: Container(
                                                    width: 45.r,
                                                    height: 45.r,
                                                    color: Colors.transparent,
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      width: 25.r,
                                                      height: 25.r,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      padding: EdgeInsets.all(1.r),
                                                      child: RotatedBox(
                                                        quarterTurns: 2,
                                                        child: SvgPicture.asset(
                                                          'assets/images/arrow-right.svg',
                                                          colorFilter: const ColorFilter.mode(
                                                            Colors.grey,
                                                            BlendMode.srcIn,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // Right Arrow - aligned with item card
                                            Positioned(
                                              top: 0,
                                              bottom: 200.h,
                                              right: MediaQuery.of(context).size.width * 0.1 - 22.w,
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (_popularSearchPageController != null && _popularSearchPageController!.hasClients) {
                                                      _popularSearchPageController!.nextPage(
                                                        duration: const Duration(milliseconds: 300),
                                                        curve: Curves.easeInOut,
                                                      );
                                                    }
                                                  },
                                                  behavior: HitTestBehavior.translucent,
                                                  child: Container(
                                                    width: 45.r,
                                                    height: 45.r,
                                                    color: Colors.transparent,
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      width: 25.r,
                                                      height: 25.r,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      padding: EdgeInsets.all(1.r),
                                                      child: SvgPicture.asset(
                                                        'assets/images/arrow-right.svg',
                                                        colorFilter: const ColorFilter.mode(
                                                          Colors.grey,
                                                          BlendMode.srcIn,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // Floating arrow button at bottom right
                                            Positioned(
                                              bottom: 0,
                                              right: MediaQuery.of(context).size.width * 0.1,
                                              child: InkWell(
                                                onTap: () {
                                                  final currentIndex = _currentPopularSearchIndex;
                                                  if (currentIndex < state.popularSearches.data.length) {
                                                    final inisiatif = state.popularSearches.data[currentIndex];
                                                    final categoryName = inisiatif.urlButtonName ?? 'Umum';
                                                    final id = (inisiatif.nid != null && inisiatif.nid!.isNotEmpty)
                                                        ? inisiatif.nid!
                                                        : inisiatif.id;
                                                    context.read<InitiativeBloc>().add(GetInitiativeDetails(id));
                                                    try {
                                                      final homeStartPageState = context.findAncestorStateOfType<HomeStartPageState>();
                                                      if (homeStartPageState != null && homeStartPageState.mounted) {
                                                        Navigator.of(homeStartPageState.context).pushNamed(
                                                          MadaniRoutes.klusterDetailRoute,
                                                          arguments: {
                                                            'appBarTitle': 'Inisiatif',
                                                            'category': categoryName,
                                                            'fromHomepage': true,
                                                          },
                                                        );
                                                      }
                                                    } catch (e) {
                                                      log('Error navigating to detail: $e');
                                                    }
                                                  }
                                                },
                                                borderRadius: BorderRadius.circular(50),
                                                child: Container(
                                                  width: 30.w,
                                                  height: 30.w,
                                                  decoration: BoxDecoration(
                                                    color: MadaniColor.white,
                                                    shape: BoxShape.circle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black.withOpacity(0.2),
                                                        blurRadius: 8,
                                                        offset: const Offset(0, 2),
                                                        spreadRadius: 1,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.arrow_forward,
                                                      color: const Color(0xFFEC1C7C),
                                                      size: 20.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    // Indicators
                                    SizedBox(height: 15.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                        state.popularSearches.data.length,
                                        (index) => GestureDetector(
                                          onTap: () {
                                            try {
                                              if (_popularSearchPageController != null && _popularSearchPageController!.hasClients) {
                                                _popularSearchPageController!.animateToPage(
                                                  index,
                                                  duration: const Duration(milliseconds: 300),
                                                  curve: Curves.easeInOut,
                                                );
                                                // Restart timer when user clicks indicator
                                                _startPopularSearchAutoScroll(state.popularSearches.data.length);
                                              }
                                            } catch (e) {
                                              log('Error navigating to popular search page: $e');
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                                            width: index == _currentPopularSearchIndex ? 24.w : 8.w,
                                            height: index == _currentPopularSearchIndex ? 8.h : 8.w, // Circle for inactive (width == height)
                                            decoration: BoxDecoration(
                                              color: index == _currentPopularSearchIndex
                                                  ? const Color(0xFFEC1C7C)
                                                  : Colors.white,
                                              borderRadius: BorderRadius.circular(
                                                index == _currentPopularSearchIndex ? 4 : 4.w, // Rounded rectangle for active, circle for inactive
                                              ),
                                              border: index != _currentPopularSearchIndex
                                                  ? Border.all(
                                                      color: const Color(0xFFEC1C7C).withOpacity(0.3),
                                                      width: 1,
                                                    )
                                                  : null,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Section 4: Infografik with theme light color Background

                    SliverToBoxAdapter(
                      child: Container(
                        color: context
                                .watch<AccessibilityCubit>()
                                .state
                                .resetColor
                            ? getThemeLightColor(0)
                            : getThemeLightColor(context
                                .watch<AccessibilityCubit>()
                                .state
                                .indexColor),
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                child: Text(
                                'Infografik',
                                textAlign: TextAlign.center,
                                style: TextStyleMadani.textStyle.interAppbar
                                    .copyWith(
                                  fontSize: 30.sp,
                                  color: MadaniColor.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ),
                            SizedBox(height: 15.h),
                            BlocBuilder<HomeBloc, HomeState>(
                              builder: (context, state) {
                                print('LOGAPP: Total infografik dalam state: ${state.infographics.data.length}');
                                print('LOGAPP: Infografik IDs dalam state: ${state.infographics.data.map((e) => e.id).toList()}');
                                
                                // Limit jumlah infografik yang dipaparkan
                                final displayedInfographics = state.infographics.data.take(maxBannerDisplay).toList();
                                
                                if (displayedInfographics.isEmpty) {
                                  return Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 180.h,
                                    margin: EdgeInsets.only(right: 15.w),
                                    decoration: BoxDecoration(
                                      color: MadaniColor.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Tiada Infografik',
                                        style: TextStyleMadani
                                            .textStyle.interAppbar,
                                      ),
                                    ),
                                  );
                                }

                                // Start auto-scroll when infographics are available
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  _startInfographicAutoScroll(displayedInfographics.length);
                                });

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 400.h,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          PageView.builder(
                                            controller: _infographicPageController,
                                            onPageChanged: (index) {
                                              if (mounted) {
                                                setState(() {
                                                  _currentInfographicIndex = index;
                                                });
                                            // Restart timer when user manually scrolls
                                            _startInfographicAutoScroll(displayedInfographics.length);
                                          }
                                        },
                                        itemCount: displayedInfographics.length,
                                          itemBuilder: (context, i) {
                                            final data = displayedInfographics[i];
                                            return Padding(
                                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                              child: Container(
                                                width: MediaQuery.sizeOf(context).width,
                                                decoration: BoxDecoration(
                                                  color: context
                                                          .watch<AccessibilityCubit>()
                                                          .state
                                                          .resetColor
                                                      ? getThemePrimaryColor(0)
                                                      : getThemePrimaryColor(context
                                                          .watch<AccessibilityCubit>()
                                                          .state
                                                          .indexColor),
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(5),
                                                  child: data.media?.fileUrl != null && data.media!.fileUrl.isNotEmpty
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            _showInfographicZoomDialog(context, data.media!.fileUrl);
                                                          },
                                                          child: CachedNetworkImage(
                                                            imageUrl: data.media!.fileUrl,
                                                            alignment: Alignment.topCenter,
                                                            fit: BoxFit.cover,
                                                            width: double.infinity,
                                                            height: double.infinity,
                                                          ),
                                                        )
                                                      : Container(
                                                          color: Colors.grey[300],
                                                        ),
                                                ),
                                              ),
                                            );
                                          },
                                      ),
                                            // Left Arrow
                                            _buildNavArrow(
                                              isLeft: true,
                                              onTap: () {
                                                if (_infographicPageController != null && _infographicPageController!.hasClients) {
                                                  if (mounted) {
                                                    setState(() {
                                                      _currentInfographicIndex = (_currentInfographicIndex - 1).clamp(0, displayedInfographics.length - 1);
                                                    });
                                                    _infographicPageController!.previousPage(
                                                      duration: const Duration(milliseconds: 300),
                                                      curve: Curves.easeInOut,
                                                    );
                                                  }
                                                }
                                              },
                                            ),
                                            // Right Arrow
                                            _buildNavArrow(
                                              isLeft: false,
                                              onTap: () {
                                                if (_infographicPageController != null && _infographicPageController!.hasClients) {
                                                  if (mounted) {
                                                    setState(() {
                                                      _currentInfographicIndex = (_currentInfographicIndex + 1).clamp(0, displayedInfographics.length - 1);
                                                    });
                                                    _infographicPageController!.nextPage(
                                                      duration: const Duration(milliseconds: 300),
                                                      curve: Curves.easeInOut,
                                                    );
                                                  }
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    // Indicators
                                    SizedBox(height: 15.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                        displayedInfographics.length,
                                        (index) => GestureDetector(
                                          onTap: () {
                                            try {
                                              if (_infographicPageController != null && _infographicPageController!.hasClients) {
                                                setState(() {
                                                  _currentInfographicIndex = index;
                                                });
                                                _infographicPageController!.animateToPage(
                                                  index,
                                                  duration: const Duration(milliseconds: 300),
                                                  curve: Curves.easeInOut,
                                                );
                                                // Restart timer when user clicks indicator
                                                _startInfographicAutoScroll(displayedInfographics.length);
                                              }
                                            } catch (e) {
                                              log('Error navigating to infografik page: $e');
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                                            width: index == _currentInfographicIndex ? 24.w : 8.w,
                                            height: index == _currentInfographicIndex ? 8.h : 8.w, // Circle for inactive (width == height)
                                            decoration: BoxDecoration(
                                              color: index == _currentInfographicIndex
                                                  ? const Color(0xFFEC1C7C)
                                                  : Colors.white,
                                              borderRadius: BorderRadius.circular(
                                                index == _currentInfographicIndex ? 4 : 4.w, // Rounded rectangle for active, circle for inactive
                                              ),
                                              border: index != _currentInfographicIndex
                                                  ? Border.all(
                                                      color: const Color(0xFFEC1C7C).withOpacity(0.3),
                                                      width: 1,
                                                    )
                                                  : null,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(height: 40.h),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              const AccessibilityContainer(),
            ],
          ),
        ),
        ),
      );
    });
  }

  Widget dynamicMakluman({
    required String title,
    required String subtitle,
    required String url,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: constraints.maxHeight,
          ),
          child: Container(
            width: 400.w,
            decoration: BoxDecoration(
              color: MadaniColor.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF2E4049),
                      fontSize: 14,
                      fontFamily: 'Shippori Mincho',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  url.isEmpty
                      ? Text(
                          subtitle,
                          textAlign: TextAlign.justify,
                          style: TextStyleMadani.textStyle.interMedium.copyWith(
                            fontWeight: FontWeight.w100,
                          ),
                        )
                      : VideoPlayerWidget(videoUrl: url),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget clusterIcon(
      {required String name,
      required SvgPicture icon,
      required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Platform.isIOS ? 80.w : 75.w,
        height: 71.h,
        decoration: BoxDecoration(
            color: MadaniColor.headerColor.withOpacity(0.15),
            border: Border.all(color: MadaniColor.blue.withOpacity(0.7)),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFF1A1E9E), Color(0xFF977805)],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              height: 5.h,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: MadaniColor.black,
                fontSize: 8.5.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildClusterIcons(BuildContext context, List<ClusterModel> clusters) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: clusters
          .map((cluster) => clusterIcon(
                name: cluster.shortName,
                icon: SvgPicture.asset(
                  cluster.clusterIcon,
                  width: 28.w,
                  height: 28.h,
                  colorFilter: ColorFilter.mode(
                    context.watch<AccessibilityCubit>().state.resetColor
                        ? MadaniColor.black
                        : accesibilityColor(context
                            .watch<AccessibilityCubit>()
                            .state
                            .indexColor),
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {
                  context
                      .read<InitiativeBloc>()
                      .add(GetInitiative(cluster: cluster.shortName.toLowerCase()));
                  // Navigator.of(context).pushNamed(
                  //   MadaniRoutes.klusterRoute,
                  //   arguments: {
                  //     'title': cluster.clusterTitle,
                  //     'icon': SvgPicture.asset(
                  //       cluster.clusterIcon,
                  //       colorFilter: const ColorFilter.mode(
                  //         MadaniColor.black,
                  //         BlendMode.srcIn,
                  //       ),
                  //       width: 60.r,
                  //     ),
                  //   },
                  // );
                },
              ))
          .toList(),
    );
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
        return context
                .watch<AccessibilityCubit>()
                .state
                .resetColor
            ? getThemePrimaryColor(0)
            : getThemePrimaryColor(context
                .watch<AccessibilityCubit>()
                .state
                .indexColor);
    }
  }

  Widget categoryCard({
    required VoidCallback? onTap,
    required String title,
    required ImageProvider image,
    Color? color,
  }) {
    final cardColor = color ?? MadaniColor.black;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: MadaniColor.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title inside the box - centered, only font color
            Padding(
              padding: EdgeInsets.only(top: 12.h, left: 8.w, right: 8.w, bottom: 0.h),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyleMadani.textStyle.interText.copyWith(
                  fontSize: 13.sp,
                  color: cardColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Image below title - full bleed, no white space, fill entire bottom area
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -10.h,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Image(
                            image: image,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight + 10.h,
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

  Widget _buildNavArrow({required bool isLeft, required VoidCallback onTap}) {
    // Calculate position based on the 10% horizontal padding used in layout
    // We want the arrow to be in the gutter, positioned 13.w from the content box edge
    final horizontalPadding = MediaQuery.of(context).size.width * 0.1;
    final arrowOffset = horizontalPadding - 22.w;

    return Positioned(
      top: 0,
      bottom: 0,
      left: isLeft ? arrowOffset : null,
      right: isLeft ? null : arrowOffset,
      child: Center(
        child: GestureDetector(
          onTap: () {
            print('LOGAPP: Nav arrow tapped - isLeft: $isLeft');
            onTap();
          },
          behavior: HitTestBehavior.translucent, // Ensure touches on transparent area are captured
          child: Container(
            width: 45.r, // Increased touch target size
            height: 45.r,
            color: Colors.transparent, // Transparent hit area
            alignment: Alignment.center,
            child: Container(
              width: 25.r,
              height: 25.r,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(1.r),
              child: isLeft 
                  ? RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(
                        'assets/images/arrow-right.svg',
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/images/arrow-right.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StandardHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return StandardHeader(
      onFaqTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(FaqRoutes.initialRoute);
      },
    );
  }

  @override
  double get maxExtent => 180.h; // Compact header with button

  @override
  double get minExtent => 180.h; // Compact header with button

  @override
  bool shouldRebuild(_StandardHeaderDelegate oldDelegate) => false;
}
