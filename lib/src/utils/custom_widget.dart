import 'dart:async';
import 'dart:math';
import 'dart:developer' as dev;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:madani/src/index.dart';
import 'package:madani/src/utils/common_fn.dart';
import 'package:pod_player/pod_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({
    super.key,
    required this.url,
    required this.title,
    required this.subtitle,
    required this.rightImage,
    required this.date,
    required this.buttonName,
    required this.buttonUrl,
  });

  final String url;
  final String title;
  final String subtitle;
  final String rightImage;
  final String date;
  final String buttonName;
  final String buttonUrl;

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  void didUpdateWidget(HomeBanner oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.url != widget.url) {
      dev.log('execute');
      Timer.periodic(const Duration(minutes: 10), (t) {
        context.read<HomeBloc>().add(GetBanner());
        t.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(minHeight: 242.h, maxHeight: 242.h),
      width: MediaQuery.of(context).size.width,
      // height: 242.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200.w,
              child: Padding(
                padding: EdgeInsets.only(top: 4.h, left: 15.w, bottom: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.media.images.jataNegaraMalaysia
                            .image(scale: 5.2.r),
                        SizedBox(
                          width: 10.h,
                        ),
                        CachedNetworkImage(
                          imageUrl: widget.url,

                          width: 70.w,
                          height: 70.h,
                          placeholder: (context, url) => Container(
                            width: 40.w,
                            height: 40.h,
                            color: MadaniColor.white,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error, color: Colors.red),
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    Text(
                      widget.title,
                      style: TextStyleMadani.textStyle.subtitle
                          .copyWith(fontSize: 11.sp, color: MadaniColor.grey3),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      widget.subtitle,
                      style: TextStyleMadani.textStyle.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 25.h),
                    // const Spacer(),
                    widget.buttonUrl.isEmpty
                        ? const SizedBox.shrink()
                        : ElevatedButton.icon(
                            onPressed: () {
                              MadaniUtils.launchURL(url: widget.buttonUrl);
                            },
                            icon: widget.buttonName != 'Takwim'
                                ? Assets.media.icons.muatTurun.svg(
                                    colorFilter: const ColorFilter.mode(
                                        MadaniColor.white, BlendMode.srcIn),
                                    width: 15.r,
                                    height: 15.r,
                                  )
                                : Icon(
                                    Icons.calendar_month_outlined,
                                    size: 20.r,
                                    color: MadaniColor.white,
                                  ),
                            label: Text(widget.buttonName,
                                style: TextStyleMadani.textStyle.interText
                                    .copyWith(color: MadaniColor.white)),
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                context
                                        .watch<AccessibilityCubit>()
                                        .state
                                        .resetColor
                                    ? getThemePrimaryColor(0)
                                    : accesibilityColor(context
                                        .watch<AccessibilityCubit>()
                                        .state
                                        .indexColor),
                              ),
                              minimumSize: WidgetStateProperty.all<Size>(
                                  Size(120.w, 26.h)),
                              elevation: WidgetStateProperty.all(3),
                            ),
                          ),
                    // Text(
                    //   date,
                    //   style: TextStyleMadani.textStyle.interText.copyWith(
                    //     fontSize: 11.sp,
                    //     fontWeight: FontWeight.w600,
                    //     color: MadaniColor.grey3,
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ClipPath(
                  clipper: OvalLeftBorderClipper(),
                  child: Container(
                    // constraints: BoxConstraints(maxHeight: 242.h),
                    color: context
                            .watch<AccessibilityCubit>()
                            .state
                            .resetColor
                        ? getThemePrimaryColor(0)
                        : getThemePrimaryColor(context
                            .watch<AccessibilityCubit>()
                            .state
                            .indexColor),
                    foregroundDecoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(widget.rightImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchStick extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SearchStick(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SearchStick oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class ClusterCard extends StatelessWidget {
  final String title;
  final String description;
  final void Function()? onPressed;

  const ClusterCard({
    super.key,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
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
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LayoutBuilder(
                    builder: (ctx, con) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 36.h,
                          minWidth: 350.w,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: context
                                    .watch<AccessibilityCubit>()
                                    .state
                                    .resetColor
                                ? getThemePrimaryColor(0)
                                : accesibilityColor(context
                                    .watch<AccessibilityCubit>()
                                    .state
                                    .indexColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(7)),
                            gradient: context
                                    .watch<AccessibilityCubit>()
                                    .state
                                    .resetColor
                                ? LinearGradient(
                                    colors: [
                                      getThemePrimaryColor(0),
                                      getThemePrimaryColor(0),
                                      getThemeGradientDarkColor(0),
                                    ],
                                  )
                                : LinearGradient(
                                    tileMode: TileMode.mirror,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      accesibilityColor(context
                                          .watch<AccessibilityCubit>()
                                          .state
                                          .indexColor),
                                      accesibilityColor(context
                                          .watch<AccessibilityCubit>()
                                          .state
                                          .indexColor),
                                      getThemeGradientDarkColor(context
                                          .watch<AccessibilityCubit>()
                                          .state
                                          .indexColor),
                                    ],
                                  ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              title,
                              style:
                                  TextStyleMadani.textStyle.interText.copyWith(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  description.contains('</')
                      ? HtmlWidget(
                          description,
                          customStylesBuilder: (element) => {
                            'text-align': 'justify',
                          },
                        )
                      : Text(
                          description,
                          textAlign: TextAlign.justify,
                          style: TextStyleMadani.textStyle.interText.copyWith(),
                        ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0xFFFDCA0A),
                        ),
                        elevation: WidgetStateProperty.all<double>(5),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'MAKLUMAT LANJUT',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}

Color accesibilityColor(int index) {
  switch (index) {
    case 0:
      return const Color(0xFF17477B);
    case 1:
      return const Color(0xFFFFC107);
    case 2:
      return const Color(0xFFFF0000);
    case 3:
      return const Color(0xFF189771);
    default:
      return Colors.transparent;
  }
}

// Helper function to get dark theme color based on accessibility color index
Color getThemeDarkColor(int index) {
  switch (index) {
    case 0:
      return const Color(0xFF13097A); // Dark blue
    case 1:
      return const Color(0xFFB8860B); // Dark yellow/gold
    case 2:
      return const Color(0xFF8B0000); // Dark red
    case 3:
      return const Color(0xFF006400); // Dark green
    default:
      return const Color(0xFF13097A); // Default dark blue
  }
}

// Helper function to get light theme color based on accessibility color index
Color getThemeLightColor(int index) {
  switch (index) {
    case 0:
      return const Color(0xFFE9F2FC); // Light blue
    case 1:
      return const Color(0xFFFFF8DC); // Light yellow/cream
    case 2:
      return const Color(0xFFFFE4E1); // Light red/pink
    case 3:
      return const Color(0xFFE0F7E0); // Light green
    default:
      return const Color(0xFFE9F2FC); // Default light blue
  }
}

// Helper function to get primary theme color based on accessibility color index
Color getThemePrimaryColor(int index) {
  switch (index) {
    case 0:
      return const Color(0xFF2E3192); // Primary blue
    case 1:
      return const Color(0xFFFFC107); // Primary yellow
    case 2:
      return const Color(0xFFFF0000); // Primary red
    case 3:
      return const Color(0xFF189771); // Primary green
    default:
      return const Color(0xFF2E3192); // Default primary blue
  }
}

// Helper function to get gradient dark color based on accessibility color index
Color getThemeGradientDarkColor(int index) {
  switch (index) {
    case 0:
      return const Color(0xFF091D4A); // Dark blue gradient
    case 1:
      return const Color(0xFF8B6914); // Dark yellow gradient
    case 2:
      return const Color(0xFF6B0000); // Dark red gradient
    case 3:
      return const Color(0xFF004D2E); // Dark green gradient
    default:
      return const Color(0xFF091D4A); // Default dark blue gradient
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  YoutubePlayerController? _youtubeController;
  bool _isYouTube = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    dev.log('Received video URL: ${widget.videoUrl}');
    _isYouTube = _isYoutubeLink(widget.videoUrl);

    if (_isYouTube) {
      // Initialize the YouTube player
      final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
      if (videoId != null && videoId.isNotEmpty) {
        _youtubeController = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
            showLiveFullscreenButton: false,
          ),
        );
        dev.log('YouTube Player initialized with videoId: $videoId');
      } else {
        dev.log('Invalid YouTube URL');
      }
    } else {
      // Initialize Chewie for non-YouTube videos
      _initializeVideoPlayer();
    }
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      await _videoPlayerController!.initialize();

      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController!,
          autoPlay: false,
          looping: true,
        );
        _isInitialized = true;
        dev.log('Non-YouTube video player initialized.');
      });
    } on HttpException catch (e) {
      dev.log('Failed to initialize video player: $e');
    } catch (error) {
      dev.log('Failed to initialize video player: $error');
      throw VideoInitializeException(
          message: 'Failed to initialize video player');
    }
  }

  @override
  void dispose() {
    // Dispose controllers only if they are initialized
    if (_isYouTube && _youtubeController != null) {
      _youtubeController!.dispose();
      dev.log('YouTube Player controller disposed.');
    } else if (_videoPlayerController != null && _chewieController != null) {
      _videoPlayerController!.dispose();
      _chewieController!.dispose();
      dev.log('Video player and Chewie controller disposed.');
    }

    super.dispose();
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _youtubeController!.pause();
    super.deactivate();
  }

  bool _isYoutubeLink(String url) {
    return url.contains('youtube.com') || url.contains('youtu.be');
  }

  @override
  Widget build(BuildContext context) {
    if (_isYouTube && _youtubeController != null) {
      return YoutubePlayerBuilder(
        onEnterFullScreen: () {
          dev.log('videoId Checking: ${_youtubeController?.initialVideoId}');
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          // if (_isYouTube) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => FullScreenYouTubePage(
          //         videoUrl: widget.videoUrl,
          //         youtubeController: _youtubeController,
          //       ),
          //     ),
          //   );
          // }
        },
        builder: (context, player) {
          return Column(
            children: [
              SizedBox(
                height: 250,
                width: MediaQuery.sizeOf(context).width,
                child: player,
              ),
            ],
          );
        },
        player: YoutubePlayer(
          controller: _youtubeController!,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          onReady: () {
            dev.log('YouTube Player is ready.');
          },
        ),
      );
    } else if (_isInitialized && _chewieController != null) {
      return Chewie(controller: _chewieController!);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}

class FullScreenYouTubePage extends StatelessWidget {
  final String videoUrl;
  final YoutubePlayerController? youtubeController;

  const FullScreenYouTubePage(
      {super.key, required this.videoUrl, this.youtubeController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FullScreenYouTubePlayer(videoUrl: videoUrl),
    );
  }
}

class FullScreenYouTubePlayer extends StatefulWidget {
  final String videoUrl;
  final YoutubePlayerController? youtubeController;

  const FullScreenYouTubePlayer(
      {super.key, required this.videoUrl, this.youtubeController});

  @override
  State<FullScreenYouTubePlayer> createState() =>
      _FullScreenYouTubePlayerState();
}

class _FullScreenYouTubePlayerState extends State<FullScreenYouTubePlayer> {
  // YoutubePlayerController? _youtubeController;

  @override
  void initState() {
    super.initState();
    // Initialize YouTube Player
    // final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    // if (videoId != null && videoId.isNotEmpty) {
    //   _youtubeController = YoutubePlayerController(
    //     initialVideoId: videoId,
    //     flags: const YoutubePlayerFlags(
    //       autoPlay: true,
    //       mute: false,
    //     ),
    //   );
    // }
  }

  @override
  void dispose() {
    widget.youtubeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: widget.youtubeController != null
          ? YoutubePlayerBuilder(
              builder: (p0, p1) {
                return SizedBox(
                  width: MediaQuery.sizeOf(p0).width,
                  height: MediaQuery.sizeOf(p0).height,
                  child: p1,
                );
              },
              player: YoutubePlayer(
                controller: widget.youtubeController!,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
                onReady: () {
                  debugPrint('YouTube Player is ready.');
                },
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class AccessibilityContainer extends StatelessWidget {
  const AccessibilityContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final containerHeight = 180.0;
    // Calculate center position vertically if topAccessibility is 0 or not set
    final topPosition = context.watch<AccessibilityCubit>().state.topAccessibility == 0
        ? (screenHeight - containerHeight) / 2
        : context.watch<AccessibilityCubit>().state.topAccessibility;
    
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      right: context.watch<AccessibilityCubit>().state.hide ? -700 : 0,
      top: topPosition,
      child: Container(
        width: 220,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.h),
              topLeft: Radius.circular(10.h)),
          color: MadaniColor.white,
          boxShadow: [
            BoxShadow(
              color: MadaniColor.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(1, 3),
            ),
            BoxShadow(
              color: MadaniColor.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(-1, -3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 50,
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.h),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Pilihan W3C',
                    style: TextStyleMadani.textStyle.title
                        .copyWith(color: MadaniColor.white),
                  ),
                  SizedBox(width: 50.w),
                  IconButton(
                    onPressed: () => context
                        .read<AccessibilityCubit>()
                        .openAccessibility(true),
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    color: MadaniColor.white,
                  ),
                  SizedBox(width: 6.w),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => context
                        .read<AccessibilityCubit>()
                        .resetColors(reset: true),
                    child: const SizedBox(
                      width: 27,
                      height: 25,
                      child: Icon(Icons.refresh),
                    ),
                  ),
                  ...List.generate(4, (index) {
                    final isSelected =
                        context.read<AccessibilityCubit>().state.indexColor ==
                            index;
                    return GestureDetector(
                      onTap: () {
                        context.read<AccessibilityCubit>().colorIndex(i: index);
                        context
                            .read<AccessibilityCubit>()
                            .resetColors(reset: false);
                      },
                      child: Container(
                        width: 27,
                        height: 25,
                        decoration: BoxDecoration(
                          color: accesibilityColor(index),
                          border: context
                                  .read<AccessibilityCubit>()
                                  .state
                                  .resetColor
                              ? null
                              : isSelected
                                  ? Border.all(color: Colors.black, width: 2)
                                  : null,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Text(
              'Kanta Pembesar',
              style: TextStyleMadani.textStyle.interText.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            GestureDetector(
              onTap: () {
                final isAktif =
                    context.read<AccessibilityCubit>().state.magnifierHide;
                final screenWidth = MediaQuery.sizeOf(context).width;
                final screenHeight = MediaQuery.sizeOf(context).height;
                
                // Set initial position if magnifier is being activated and position is 0
                if (isAktif && 
                    context.read<AccessibilityCubit>().state.draggingX == 0 &&
                    context.read<AccessibilityCubit>().state.draggingY == 0) {
                  // Set to center of screen
                  context.read<AccessibilityCubit>().initialDragging(
                    dx: screenWidth / 2,
                    dy: screenHeight / 2,
                  );
                }
                
                context.read<AccessibilityCubit>().toggleAktif(aktif: !isAktif);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 29,
                width: context.read<AccessibilityCubit>().state.magnifierHide
                    ? 125
                    : 100,
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
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: MadaniColor.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          context.read<AccessibilityCubit>().state.magnifierHide
                              ? 'Tidak Aktif'
                              : 'Aktif',
                          style: TextStyleMadani.textStyle.interText.copyWith(
                            color: MadaniColor.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 25,
                      width: 50,
                      decoration: BoxDecoration(
                        color: MadaniColor.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context
                                  .watch<AccessibilityCubit>()
                                  .state
                                  .resetColor
                              ? getThemePrimaryColor(0)
                              : getThemePrimaryColor(context
                                  .watch<AccessibilityCubit>()
                                  .state
                                  .indexColor), // Border color
                          width: 2, // Border width
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          height: 21,
                          width: 21,
                          decoration: BoxDecoration(
                            color: context
                                    .read<AccessibilityCubit>()
                                    .state
                                    .magnifierHide
                                ? MadaniColor.white
                                : (context
                                        .watch<AccessibilityCubit>()
                                        .state
                                        .resetColor
                                    ? getThemePrimaryColor(0)
                                    : getThemePrimaryColor(context
                                        .watch<AccessibilityCubit>()
                                        .state
                                        .indexColor)), // Indicator color
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // DropdownButton<TextSize>(
            //   value: context.watch<AccessibilityCubit>().state.textSize,
            //   onChanged: (TextSize? newValue) {
            //     context
            //         .read<AccessibilityCubit>()
            //         .chooseText(size: newValue ?? TextSize.normal);
            //   },
            //   items: <TextSize>[
            //     TextSize.normal,
            //     TextSize.sederhana,
            //     TextSize.besar,
            //   ].map<DropdownMenuItem<TextSize>>(
            //     (TextSize value) {
            //       return DropdownMenuItem<TextSize>(
            //         value: value,
            //         child: Text(
            //           value.name.capitalize(),
            //           style: TextStyleMadani.textStyle.interText.copyWith(
            //             color: MadaniColor.black.withOpacity(.5),
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            //       );
            //     },
            //   ).toList(),
            // ),
          ],
        ),
      ),
    );
  }
}
