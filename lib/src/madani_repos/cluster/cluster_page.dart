// import 'dart:developer';

// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madani/src/index.dart';
import 'package:madani/src/madani_repos/cluster/cluster_model.dart';

class ClusterPage extends StatefulWidget {
  const ClusterPage({
    super.key,
    required this.titleHeader,
    required this.shortName,
    required this.icon,
  });

  final String titleHeader;
  final String shortName;
  final SvgPicture icon;

  @override
  State<ClusterPage> createState() => _ClusterPageState();
}

class _ClusterPageState extends State<ClusterPage> {
  final ScrollController scrollController = ScrollController();
  final ScrollController _clusterScrollController = ScrollController();
  String selectedCluster = '';
  bool _isLoadingData = false;
  String _lastAlertedCluster = ''; // Track last alerted cluster to prevent duplicate alerts
  bool _hasWaitedForHomepage = false; // Track if we've waited for homepage's API call
  bool _hasLoadedInitialData = false; // Track if initial data (UMUM) has been loaded
  String _homepageCluster = ''; // Store homepage's cluster before loading UMUM
  double _scrollPositionBeforeLoad = 0.0; // Store scroll position before pagination load
  int _previousDataLength = 0; // Store previous data length to detect append
  bool _showGoUpButton = false;
  String _lastScrolledCluster = ''; // Track last scrolled cluster to prevent duplicate scrolls

  @override
  void initState() {
    super.initState();
    // Initialize with empty string - don't auto-select any kluster
    // Only select kluster when data is loaded or user clicks
    selectedCluster = '';
    _isLoadingData = false;
    _lastAlertedCluster = '';
    _hasWaitedForHomepage = false;
    _hasLoadedInitialData = false;
    _homepageCluster = '';
    
    // Add scroll listener for go up button
    scrollController.addListener(_onScroll);
    
    // Store homepage's currentCluster before loading UMUM
    // If no state exists, auto-load kluster "Umum"
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final initiativeState = context.read<InitiativeBloc>().state;
        // Always check if we need to load data
        // If currentCluster exists but data is empty, or no currentCluster and no data, load "umum" with page=0
        if (initiativeState.initiative.data.isEmpty && 
            initiativeState.getInitiativeStatus != GetInitiativeStatus.loading) {
          if (initiativeState.currentCluster.isNotEmpty) {
            // Has currentCluster but no data - load with page=0
            _homepageCluster = initiativeState.currentCluster;
            print('InitState: Has currentCluster but no data, loading cluster: ${initiativeState.currentCluster} with page=0');
            setState(() {
              selectedCluster = initiativeState.currentCluster;
              _isLoadingData = true;
            });
            context.read<InitiativeBloc>().add(GetInitiative(
              cluster: initiativeState.currentCluster,
              page: 0,
            ));
          } else {
            // No state exists - this means page was opened directly from menu
            // Auto-load kluster "Umum" if no data exists
            print('InitState: No state exists, auto-loading kluster "umum" with page=0');
            setState(() {
              selectedCluster = 'umum';
              _isLoadingData = true;
            });
            context.read<InitiativeBloc>().add(GetInitiative(
              cluster: 'umum',
              page: 0,
            ));
          }
        } else if (initiativeState.currentCluster.isNotEmpty) {
          // Has data and currentCluster - just store it
          _homepageCluster = initiativeState.currentCluster;
          print('InitState: Stored homepage cluster: $_homepageCluster');
        }
      }
    });
    
    // Automatically select Inisiatif menu (index 1) in bottom bar when this page opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
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
      }
    });
  }
  
  @override
  void didUpdateWidget(ClusterPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset flag when widget updates (e.g., when navigating with different kluster)
    if (oldWidget.shortName != widget.shortName) {
      selectedCluster = widget.shortName;
      _isLoadingData = false;
    }
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Listen to InitiativeBloc state changes and update selectedCluster if currentCluster changes
    // This ensures that when navigating from Home, ClusterPage updates with the selected cluster
    final initiativeState = context.watch<InitiativeBloc>().state;
    final currentClusterLower = initiativeState.currentCluster.toLowerCase();
    final selectedClusterLower = selectedCluster.toLowerCase();
    
    if (initiativeState.currentCluster.isNotEmpty && 
        currentClusterLower != selectedClusterLower &&
        currentClusterLower != _lastAlertedCluster.toLowerCase()) {
      // Always use currentCluster from state when it changes (e.g., from Utama page)
      // This ensures UI reflects the correct kluster selection immediately
      _lastAlertedCluster = initiativeState.currentCluster; // Mark as alerted
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          // Update selectedCluster
          setState(() {
            selectedCluster = initiativeState.currentCluster;
            _isLoadingData = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    _clusterScrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    try {
      final shouldShow = scrollController.hasClients && 
                         scrollController.offset > 200;
      if (shouldShow != _showGoUpButton) {
        setState(() {
          _showGoUpButton = shouldShow;
        });
      }
    } catch (e) {
      print('Error in scroll listener: $e');
    }
  }

  void _scrollToTop() {
    try {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    } catch (e) {
      print('Error scrolling to top: $e');
    }
  }

  void _scrollClusterToCenter(int itemIndex) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_clusterScrollController.hasClients) return;

      const estimatedChipWidth = 240.0; // Width of cluster card
      const chipSpacing = 15.0; // Right margin

      // Calculate scroll offset to center the item
      // For item at index 0, offset should be 0 (already centered by padding)
      // For item at index 1, need to scroll by (chipWidth + spacing)
      final centerOffset = (estimatedChipWidth + chipSpacing) * itemIndex;

      _clusterScrollController.animateTo(
        centerOffset.clamp(
          0.0,
          _clusterScrollController.position.maxScrollExtent,
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
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
        return MadaniColor.black;
    }
  }

  String _getTabImagePath(String shortName) {
    switch (shortName.toUpperCase()) {
      case 'UMUM':
        return Assets.images.iMTabUmum.path;
      case 'KESIHATAN':
        return Assets.images.iMTabKesihatan.path;
      case 'MAKANAN':
        return Assets.images.iMTabMakanan.path;
      case 'PENDAPATAN':
        return Assets.images.iMTabPendapatan.path;
      case 'PENDIDIKAN':
        return Assets.images.iMTabPendidikan.path;
      case 'PENGANGKUTAN':
        return Assets.images.iMTabPengangkutan.path;
      case 'PERUMAHAN':
        return Assets.images.iMTabPerumahan.path;
      case 'UTILITI':
        return Assets.images.iMTabUtiliti.path;
      default:
        return Assets.images.iMTabUmum.path;
    }
  }

  String _cleanDescription(String description) {
    try {
      // Remove HTML tags
      String cleaned = description.replaceAll(RegExp(r'<[^>]*>'), '');
      
      // Remove HTML entities
      cleaned = cleaned
          .replaceAll('&nbsp;', ' ')
          .replaceAll('&lt;', '<')
          .replaceAll('&gt;', '>')
          .replaceAll('&amp;', '&')
          .replaceAll('&quot;', '"')
          .replaceAll('&#39;', "'")
          .replaceAll('\\/', '/');
      
      // Remove "Keterangan:" and everything before it (case insensitive)
      final keteranganIndex = cleaned.toLowerCase().indexOf('keterangan:');
      if (keteranganIndex != -1) {
        cleaned = cleaned.substring(keteranganIndex + 'keterangan:'.length).trim();
      }
      
      // Clean up multiple spaces and newlines
      cleaned = cleaned.replaceAll(RegExp(r'\s+'), ' ').trim();
      
      return cleaned;
    } catch (e) {
      return description;
    }
  }

  Widget _buildInisiatifCard({
    required String category,
    required String title,
    required String description,
    required Color categoryColor,
    required VoidCallback onTap,
  }) {
    // Category is already processed (Utama for non-main clusters), just format it
    final categoryText = category.isNotEmpty
        ? category[0].toUpperCase() + category.substring(1).toLowerCase()
        : category;
    
    final cleanedDescription = _cleanDescription(description);

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Box with category and title
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 15.h),
                decoration: BoxDecoration(
                  color: MadaniColor.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: categoryColor,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category text
                    Text(
                      categoryText.toUpperCase(),
                      style: TextStyleMadani.textStyle.interText.copyWith(
                        fontSize: 16.sp,
                        color: categoryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 4.h),
                    // Title
                    Text(
                      title,
                      style: TextStyleMadani.textStyle.interText.copyWith(
                        fontSize: 20.sp,
                        color: MadaniColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            // Description outside box
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Text(
                cleanedDescription,
                style: TextStyleMadani.textStyle.interText.copyWith(
                  fontSize: 18.sp,
                  color: MadaniColor.black.withOpacity(0.7),
                  height: 1.5,
                ),
              ),
            ),
            // Add extra space at bottom to prevent button from covering text
            SizedBox(height: 10.h),
          ],
        ),
        // Floating arrow button at bottom right (near description)
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 30.w, // Match homepage size
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
                  size: 20.sp, // Match homepage size
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClusterCard(ClusterModel cluster, bool isSelected, int itemIndex) {
    final cardColor = _getCategoryColor(cluster.shortName);
    final titleText = cluster.shortName.isNotEmpty
        ? cluster.shortName[0].toUpperCase() +
            cluster.shortName.substring(1).toLowerCase()
        : cluster.shortName;

    // Use grey for inactive cards, category color for active cards
    final borderColor = isSelected ? cardColor : Colors.grey;
    final textColor = isSelected ? cardColor : Colors.grey;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCluster = cluster.shortName.toLowerCase();
        });
        context.read<InitiativeBloc>().add(GetInitiative(
          cluster: cluster.shortName.toLowerCase(),
          page: 0,
        ));
        // Scroll will be handled by BlocBuilder's auto-scroll logic
      },
      child: Container(
        width: 240.w,
        height: 60.h,
        margin: EdgeInsets.only(right: 15.w),
        decoration: BoxDecoration(
          color: MadaniColor.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: isSelected ? 1 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: isSelected ? Colors.grey.withOpacity(1) : Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              ),
          ],
        ),
        child: Row(
          children: [
            // Text Section (Left)
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: 6.w, top: 2.h, bottom: 2.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      titleText,
                      style: TextStyleMadani.textStyle.interText.copyWith(
                        fontSize: 20.sp,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
            // Image Section (Right)
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: isSelected
                    ? Image.asset(
                        _getTabImagePath(cluster.shortName),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          0.2126, 0.7152, 0.0722, 0, 0, // Red channel
                          0.2126, 0.7152, 0.0722, 0, 0, // Green channel
                          0.2126, 0.7152, 0.0722, 0, 0, // Blue channel
                          0, 0, 0, 1, 0, // Alpha channel (unchanged)
                        ]),
                        child: Image.asset(
                          _getTabImagePath(cluster.shortName),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Listen to InitiativeBloc state changes at build level to catch currentCluster updates
    return BlocListener<InitiativeBloc, InitiativeState>(
      listener: (context, state) {
        // Detect pagination append by checking if data length increased and we have saved scroll position
        final isDataAppended = state.initiative.data.length > _previousDataLength && _previousDataLength > 0;
        final isPaginationAppend = isDataAppended && _scrollPositionBeforeLoad > 0;
        
        // Restore scroll position after pagination append
        if (isPaginationAppend && 
            state.getInitiativeStatus == GetInitiativeStatus.initial) {
          print('LOGAPP CLUSTER PAGE: Detected append - previous length: $_previousDataLength, current length: ${state.initiative.data.length}, attempting to restore scroll position: $_scrollPositionBeforeLoad');
          
          // Update previous data length first
          _previousDataLength = state.initiative.data.length;
          
          // Wait for list to render, then restore scroll position
          // Use SchedulerBinding to ensure we restore after frame is rendered
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Multiple delays to ensure list is fully rendered
            Future.delayed(const Duration(milliseconds: 150), () {
              if (mounted && scrollController.hasClients) {
                final maxScroll = scrollController.position.maxScrollExtent;
                print('LOGAPP CLUSTER PAGE: First attempt - maxScroll: $maxScroll, saved position: $_scrollPositionBeforeLoad');
                if (maxScroll > 0) {
                  final targetPosition = _scrollPositionBeforeLoad.clamp(0.0, maxScroll);
                  scrollController.jumpTo(targetPosition);
                  print('LOGAPP CLUSTER PAGE: Scroll restored to: $targetPosition, maxScroll: $maxScroll');
                } else {
                  // Retry with longer delay
                  Future.delayed(const Duration(milliseconds: 200), () {
                    if (mounted && scrollController.hasClients) {
                      final maxScroll = scrollController.position.maxScrollExtent;
                      print('LOGAPP CLUSTER PAGE: Retry attempt - maxScroll: $maxScroll');
                      if (maxScroll > 0) {
                        final targetPosition = _scrollPositionBeforeLoad.clamp(0.0, maxScroll);
                        scrollController.jumpTo(targetPosition);
                        print('LOGAPP CLUSTER PAGE: Scroll restored (retry) to: $targetPosition, maxScroll: $maxScroll');
                      } else {
                        // Last retry
                        Future.delayed(const Duration(milliseconds: 300), () {
                          if (mounted && scrollController.hasClients) {
                            final maxScroll = scrollController.position.maxScrollExtent;
                            if (maxScroll > 0) {
                              final targetPosition = _scrollPositionBeforeLoad.clamp(0.0, maxScroll);
                              scrollController.jumpTo(targetPosition);
                              print('LOGAPP CLUSTER PAGE: Scroll restored (final retry) to: $targetPosition');
                            }
                          }
                        });
                      }
                    }
                  });
                }
              }
            });
          });
        } else if (!isDataAppended && state.initiative.data.isNotEmpty) {
          // Update previous data length for first load
          _previousDataLength = state.initiative.data.length;
        }
        
        // Handle kluster activation for first load only (not pagination)
        if (!isDataAppended &&
            state.currentCluster.isNotEmpty && 
            state.initiative.data.isNotEmpty &&
            state.getInitiativeStatus == GetInitiativeStatus.initial) {
          final currentClusterLower = state.currentCluster.toLowerCase();
          final selectedClusterLower = selectedCluster.toLowerCase();
          
          if (currentClusterLower != selectedClusterLower) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  selectedCluster = state.currentCluster;
                  _isLoadingData = false;
                  _hasLoadedInitialData = true;
                });
              }
            });
          }
        }
      },
      child: Builder(
        builder: (context) {
          // Removed auto-load on scroll - using button instead
          // scrollController.addListener(() {
          //   if (scrollController.position.pixels ==
          //           scrollController.position.maxScrollExtent &&
          //       context.read<InitiativeBloc>().state.initiative.hasNextPage) {
          //     context.read<InitiativeBloc>().add(GetInitiative(
          //         cluster: selectedCluster,
          //         page:
          //             context.read<InitiativeBloc>().state.initiative.currentPage + 1));
          //   }
          // });

          // Use Container instead of Scaffold to avoid hiding bottom navigation bar
          // Bottom navigation bar is managed by MainPageMadani Scaffold
          return Container(
      color: MadaniColor.white,
      child: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              // Standard Header
              SliverPersistentHeader(
                pinned: true,
                delegate: _StandardHeaderDelegate(),
              ),
              // Cluster Carousel Section
              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: Offset(0, -40.h),
                  child: Container(
                    color: const Color(0xFFEFEFEF),
                    padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                          child: Text(
                            'Pilihan Kluster',
                            textAlign: TextAlign.center,
                            style: TextStyleMadani.textStyle.interText.copyWith(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: MadaniColor.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                           SizedBox(
                             height: 60.h,
                             child: LayoutBuilder(
                               builder: (context, constraints) {
                                 final screenWidth = constraints.maxWidth;
                                 const estimatedChipWidth = 240.0; // Width of cluster card
                                 final centerPadding = (screenWidth - estimatedChipWidth) / 2;

                                 return BlocBuilder<InitiativeBloc, InitiativeState>(
                                   builder: (context, state) {
                                     // Use state.currentCluster if available (from Utama page), otherwise use selectedCluster
                                     // But if no data loaded, don't select any kluster
                                     final displayCluster = (state.currentCluster.isNotEmpty && state.initiative.data.isNotEmpty)
                                         ? state.currentCluster
                                         : (state.initiative.data.isNotEmpty ? selectedCluster : '');

                                     // Auto-scroll to selected item (only if not already scrolled)
                                     if (displayCluster.isNotEmpty && _lastScrolledCluster != displayCluster) {
                                       final selectedIndex = clusterModel.indexWhere(
                                         (cluster) => cluster.shortName.toLowerCase() == displayCluster.toLowerCase()
                                       );
                                       if (selectedIndex >= 0) {
                                         _lastScrolledCluster = displayCluster;
                                         WidgetsBinding.instance.addPostFrameCallback((_) {
                                           _scrollClusterToCenter(selectedIndex);
                                         });
                                       }
                                     } else if (clusterModel.isNotEmpty && _lastScrolledCluster.isEmpty) {
                                       // Auto-center first item on initial load if no selection
                                       _lastScrolledCluster = 'initial';
                                       WidgetsBinding.instance.addPostFrameCallback((_) {
                                         _scrollClusterToCenter(0);
                                       });
                                     }

                                     return ListView.builder(
                                       controller: _clusterScrollController,
                                       scrollDirection: Axis.horizontal,
                                       padding: EdgeInsets.symmetric(horizontal: centerPadding),
                                       itemCount: clusterModel.length,
                                       itemBuilder: (context, index) {
                                         final cluster = clusterModel[index];
                                         final isSelected = displayCluster.isNotEmpty &&
                                             cluster.shortName.toLowerCase() == displayCluster.toLowerCase();
                                         return _buildClusterCard(cluster, isSelected, index);
                                       },
                                     );
                                   },
                                 );
                               },
                             ),
                           ),
                      ],
                    ),
                  ),
                ),
              ),
              // Content List Section
              SliverToBoxAdapter(
                child: Container(
                  color: MadaniColor.white,
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.1, 10.h, MediaQuery.of(context).size.width * 0.1, 100.h), // Add extra padding for bottom navigation bar
                  child: BlocBuilder<InitiativeBloc, InitiativeState>(
                    builder: (context, state) {
                      // Debug: Print state in BlocBuilder
                      print('BlocBuilder: currentCluster="${state.currentCluster}", data.length=${state.initiative.data.length}, status="${state.getInitiativeStatus}", selectedCluster="$selectedCluster"');
                      
                      // Use state.currentCluster if available and has data, otherwise use selectedCluster
                      // But if no data loaded, don't select any kluster (empty string)
                      final displayCluster = (state.currentCluster.isNotEmpty && state.initiative.data.isNotEmpty)
                          ? state.currentCluster 
                          : (state.initiative.data.isNotEmpty ? selectedCluster : '');
                      
                      print('BlocBuilder: displayCluster="$displayCluster"');
                      
                      // IMPORTANT: Don't trigger any API calls or state updates during build
                      // All state updates are handled by BlocListener
                      
                      // Check if this is a pagination load (page > 1)
                      final isPaginationLoad = state.initiative.currentPage > 1;
                      
                      // Show loading indicator only when loading first page, not pagination
                      final isLoadingFirstPage = state.getInitiativeStatus == GetInitiativeStatus.loading && 
                          !isPaginationLoad;

                      // Reset loading flag when data is loaded or error
                      if (_isLoadingData && 
                          state.getInitiativeStatus == GetInitiativeStatus.completed &&
                          state.currentCluster.toLowerCase() == selectedCluster.toLowerCase()) {
                        _isLoadingData = false;
                      }
                      
                      if (_isLoadingData && state.getInitiativeStatus == GetInitiativeStatus.error) {
                        _isLoadingData = false;
                      }

                      // Show loading indicator only when loading first page, not pagination
                      if (isLoadingFirstPage) {
                        return SizedBox(
                          height: 200.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      
                      // Show empty message if no data and not loading
                      if (state.initiative.data.isEmpty && 
                          state.getInitiativeStatus != GetInitiativeStatus.loading) {
                        return SizedBox(
                          height: 200.h,
                          child: Center(
                            child: Text(
                              'Tiada data. Sila pilih kluster untuk melihat inisiatif.',
                              style: TextStyleMadani.textStyle.interText.copyWith(
                                fontSize: 16.sp,
                                color: MadaniColor.grey,
                              ),
                            ),
                          ),
                        );
                      }

                      // Display data if currentCluster matches displayCluster and data is available
                      // This ensures filtered data from Utama is correctly displayed
                      // If currentCluster is set and has data, show it
                      if (state.currentCluster.isNotEmpty && 
                          state.currentCluster.toLowerCase() == displayCluster.toLowerCase() &&
                          state.getInitiativeStatus == GetInitiativeStatus.loading) {
                        return SizedBox(
                          height: 200.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      // Show empty message if no data for display kluster
                      if (state.initiative.data.isEmpty && 
                          state.currentCluster.toLowerCase() == displayCluster.toLowerCase() &&
                          state.getInitiativeStatus == GetInitiativeStatus.completed) {
                        return SizedBox(
                          height: 200.h,
                          child: Center(
                            child: Text(
                              'Tiada data untuk kluster ini',
                              style: TextStyleMadani.textStyle.interText.copyWith(
                                fontSize: 16.sp,
                                color: MadaniColor.grey,
                              ),
                            ),
                          ),
                        );
                      }
                      
                      // Only display data if it matches the currentCluster
                      // This ensures filtered data from Utama is correctly displayed
                      // Compare using lowercase to ensure consistency
                      // If currentCluster is set but doesn't match displayCluster, show loading
                      if (state.currentCluster.isNotEmpty && 
                          state.currentCluster.toLowerCase() != displayCluster.toLowerCase()) {
                        return SizedBox(
                          height: 200.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      
                      // Debug: Show what data is being displayed
                      if (state.currentCluster.isNotEmpty && state.initiative.data.isNotEmpty) {
                        // Data exists and matches currentCluster, will be displayed below
                      }

                      final categoryColor = _getCategoryColor(displayCluster.toUpperCase());
                      final displayClusterName = _isMainCluster(displayCluster) 
                          ? displayCluster 
                          : 'Utama';
                      final categoryName = displayClusterName.isNotEmpty
                          ? displayClusterName[0].toUpperCase() +
                              displayClusterName.substring(1).toLowerCase()
                          : displayClusterName;

                      // Check if there's next page - button should hide when no more pages
                      // API uses 0-based for request (page=0, page=1...) but returns 1-based for currentPage
                      // So if we sent page=1 and got currentPage=1, it means we're still on page 1 (which is page 0 in 0-based)
                      // We need to check if we've loaded all data by comparing data.length with total
                      final hasLoadedAllData = state.initiative.data.length >= state.initiative.total;
                      final hasNextPageFromAPI = state.initiative.hasNextPage;
                      // Hide button if we've loaded all data OR API says no next page
                      final hasNextPage = !hasLoadedAllData && hasNextPageFromAPI;
                      final isLoadingMore = state.getInitiativeStatus == GetInitiativeStatus.loading && 
                          state.initiative.data.isNotEmpty;
                      
                      // Debug: Print pagination info
                      print('LOGAPP CLUSTER PAGE: hasNextPage: $hasNextPage, hasLoadedAllData: $hasLoadedAllData, hasNextPageFromAPI: $hasNextPageFromAPI, currentPage: ${state.initiative.currentPage}, lastPage: ${state.initiative.lastPage}, data.length: ${state.initiative.data.length}, total: ${state.initiative.total}');

                      return Column(
                        children: [
                          ListView.separated(
                            key: ValueKey('initiative_list_${state.currentCluster}'),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => Divider(
                              height: 30.h,
                              thickness: 1,
                              color: Colors.grey[300],
                            ),
                            itemCount: state.initiative.data.length,
                            itemBuilder: (context, i) {
                              final data = state.initiative.data[i];
                              return _buildInisiatifCard(
                                  category: categoryName,
                                  title: data.name,
                                  description: data.description,
                                  categoryColor: categoryColor,
                                  onTap: () {
                                    final id = data.detailArticleId;
                                    if (id.isEmpty) {
                                      return;
                                    }
                                    context
                                        .read<InitiativeBloc>()
                                        .add(GetInitiativeDetails(id));

                                    Navigator.of(context).pushNamed(
                                      MadaniRoutes.klusterDetailRoute,
                                      arguments: {
                                        'appBarTitle': widget.titleHeader,
                                        'category': categoryName,
                                      },
                                    );
                                  },
                                );
                            },
                          ),
                          // Tunjuk Lagi Button - Show only if there's next page and not loading
                          if (hasNextPage && !isLoadingMore && state.initiative.data.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(top: 50.h, bottom: 10.h),
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
                                    // Save current scroll position and data length before loading next page
                                    if (scrollController.hasClients) {
                                      _scrollPositionBeforeLoad = scrollController.position.pixels;
                                      _previousDataLength = state.initiative.data.length;
                                      print('LOGAPP CLUSTER PAGE: Saving scroll position: $_scrollPositionBeforeLoad, current data length: $_previousDataLength');
                                    }
                                    
                                    // Load next page - use currentCluster to maintain same kluster
                                    final clusterToLoad = state.currentCluster.isNotEmpty 
                                        ? state.currentCluster 
                                        : (selectedCluster.isNotEmpty ? selectedCluster : displayCluster);
                                    
                                    // API returns currentPage as 1-based (1, 2, 3...), but we use 0-based (0, 1, 2...)
                                    // So if API returns currentPage=1, we sent page=0, next should be page=1
                                    final nextPage = state.initiative.currentPage;
                                    
                                    context.read<InitiativeBloc>().add(GetInitiative(
                                      cluster: clusterToLoad,
                                      page: nextPage,
                                    ));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(Colors.transparent),
                                    shadowColor:
                                        WidgetStateProperty.all(Colors.transparent),
                                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
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
                          // Show loading indicator when loading more - subtle and smooth
                          if (isLoadingMore)
                            Padding(
                              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                              child: AnimatedOpacity(
                                opacity: isLoadingMore ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 200),
                                child: const Center(
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
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
          // Floating Back Button - Hidden/Disabled
          // Positioned(
          //   top: 180.h,
          //   left: 15.w,
          //   child: SafeArea(
          //     child: Container(
          //       decoration: BoxDecoration(
          //         color: MadaniColor.white,
          //         shape: BoxShape.circle,
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black.withOpacity(0.2),
          //             blurRadius: 8,
          //             offset: const Offset(0, 2),
          //           ),
          //         ],
          //       ),
          //       child: IconButton(
          //         icon: Icon(
          //           Icons.arrow_back_ios_new,
          //           color: MadaniColor.black,
          //           size: 20.r,
          //         ),
          //         onPressed: () {
          //           try {
          //             // Check route history length to determine if we can go back
          //             final homepageState = HomepageStartPage.of(context);
          //             final routeHistoryLength = homepageState.madaniRoutes.routeHistory.length;
          //             
          //             if (routeHistoryLength > 1) {
          //               // Has previous route, go back to previous page
          //               HomepageStartPage.of(context).exit(context);
          //             } else {
          //               // No previous page in HomepageStartPage, go to Utama (index 0)
          //               // First exit from current page
          //               Navigator.of(context).pop();
          //               // Then change navigation to Utama after pop completes
          //               WidgetsBinding.instance.addPostFrameCallback((_) {
          //                 try {
          //                   // Access BottomBarCubit from root navigator context
          //                   final rootContext = Navigator.of(context, rootNavigator: true).context;
          //                   if (rootContext.mounted) {
          //                     rootContext.read<BottomBarCubit>().changeNavigation(index: 0);
          //                   }
          //                 } catch (e) {
          //                   // If root context fails, try current context
          //                   try {
          //                     context.read<BottomBarCubit>().changeNavigation(index: 0);
          //                   } catch (_) {
          //                     // If both fail, navigation will stay at current state
          //                   }
          //                 }
          //               });
          //             }
          //           } catch (e) {
          //             // Fallback: pop and change to Utama
          //             try {
          //               Navigator.of(context).pop();
          //               WidgetsBinding.instance.addPostFrameCallback((_) {
          //                 try {
          //                   final rootContext = Navigator.of(context, rootNavigator: true).context;
          //                   if (rootContext.mounted) {
          //                     rootContext.read<BottomBarCubit>().changeNavigation(index: 0);
          //                   }
          //                 } catch (_) {}
          //               });
          //             } catch (_) {
          //               // If all fails, just pop
          //               Navigator.of(context).pop();
          //             }
          //           }
          //         },
          //       ),
          //     ),
          //   ),
          // ),
          // Floating Go Up Button
          if (_showGoUpButton)
            Positioned(
              bottom: 20.h,
              right: 20.w,
              child: GestureDetector(
                onTap: _scrollToTop,
                child: SvgPicture.asset(
                  'assets/images/go-up.svg',
                  width: 48.w,
                  height: 48.h,
                ),
              ),
            ),
        ],
      ),
          );
        },
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
