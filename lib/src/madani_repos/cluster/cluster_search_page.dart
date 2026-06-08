import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madani/src/index.dart';
import 'package:madani/src/madani_repos/homepage/homepage_start_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  String _searchText = '';
  final ScrollController scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;
  bool _showGoUpButton = false;
  // Separate state for search results - independent from cluster page
  Pagination<InitiativeModel> _searchResults = Pagination<InitiativeModel>.initial();

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

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.animateTo(1.0, curve: Curves.easeInOut);
    
    // Listen to text changes for close button visibility
    _controller.addListener(() {
      setState(() {
        _hasText = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    _animationController.dispose();
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

  // Function to handle back button press - use rootNavigator since SearchPage is pushed with rootNavigator
  void _handleBackButton() {
    try {
      // SearchPage is pushed using rootNavigator: true, so pop from rootNavigator
      if (Navigator.of(context, rootNavigator: true).canPop()) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    } catch (e) {
      // If rootNavigator fails, try current context navigator as fallback
      try {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      } catch (_) {
        // If still fails, ignore
      }
    }
  }

  // Function to handle search button press
  void _performSearch() {
    try {
      final searchValue = _controller.text.trim();
      setState(() {
        _searchText = searchValue;
      });
      
      // Show loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return const AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Memproses..."),
              ],
            ),
          );
        },
      );
      
      if (searchValue.isNotEmpty) {
        context.read<InitiativeBloc>().add(
              SearchInitiative(searchValue),
            );
      } else {
        // Clear search results if search is empty
        setState(() {
          _searchResults = Pagination<InitiativeModel>.initial();
        });
        // Close dialog immediately if search is empty
        Navigator.of(context, rootNavigator: true).pop();
      }
    } catch (e) {
      // Close dialog on error
      if (Navigator.of(context, rootNavigator: true).canPop()) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitiativeBloc, InitiativeState>(
      listener: (context, state) {
        // Capture search results and store in local state when search completes
        if (state.getInitiativeStatus == GetInitiativeStatus.completed) {
          setState(() {
            _searchResults = state.initiative;
          });
          // Close loading dialog
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop();
          }
        } else if (state.getInitiativeStatus == GetInitiativeStatus.error) {
          // Close loading dialog on error
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop();
          }
        }
      },
      builder: (context, state) {
        // Use Scaffold for fullscreen to hide bottom navigation bar
        return Scaffold(
          backgroundColor: MadaniColor.white,
          body: Stack(
            children: [
              CustomScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                slivers: [
                  // App Bar with Back Button
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
                      onPressed: _handleBackButton,
                    ),
                    centerTitle: true,
                    title: Text(
                      'Carian Inisiatif',
                      style: TextStyleMadani.textStyle.interAppbar.copyWith(
                        color: MadaniColor.white,
                      ),
                    ),
                  ),
                  // Search Box Section
                  SliverToBoxAdapter(
                    child: Transform.translate(
                      offset: Offset(0, -0.h),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.1, 20.h, MediaQuery.of(context).size.width * 0.1, 15.h),
                      child: Column(
                        children: [
                          AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return Container(
                                width: double.infinity,
                                height: 56.h,
                                transform: Matrix4.translationValues(
                                  -MediaQuery.of(context).size.width + (MediaQuery.of(context).size.width * _animationController.value),
                                  0.0,
                                  0.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20.0,
                                        child: IconButton(
                                          icon: const Icon(Icons.search),
                                          color: MadaniColor.black,
                                          onPressed: () {},
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: TextFormField(
                                            controller: _controller,
                                            decoration: const InputDecoration(
                                              hintText: 'Carian Inisiatif',
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(horizontal: 20.0),
                                            ),
                                            onTapOutside: (value) {
                                              FocusScope.of(context).unfocus();
                                            },
                                            onFieldSubmitted: (value) {
                                              _performSearch();
                                            },
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: _hasText,
                                        child: SizedBox(
                                          width: 40.0,
                                          child: IconButton(
                                            icon: const Icon(Icons.close_rounded),
                                            color: MadaniColor.black,
                                            onPressed: () {
                                              _controller.clear();
                                              setState(() {
                                                _searchText = '';
                                                _hasText = false;
                                                _searchResults = Pagination<InitiativeModel>.initial();
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 15.h),
                          // Search Button
                          SizedBox(
                            width: double.infinity,
                            height: 56.h,
                            child: GestureDetector(
                              onTap: _performSearch,
                              child: Container(
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
                                child: Center(
                                  child: Text(
                                    'Cari',
                                    style: TextStyleMadani.textStyle.interMedium.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: MadaniColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          if (_searchText.isNotEmpty && _controller.text.isNotEmpty)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Hasil Carian : ',
                                          style: TextStyleMadani.textStyle.interText
                                              .copyWith(
                                            color: MadaniColor.grey3,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        TextSpan(
                                          text: _searchText.toUpperCase(),
                                          style: TextStyleMadani.textStyle.interText
                                              .copyWith(
                                            color: context
                                                    .watch<AccessibilityCubit>()
                                                    .state
                                                    .resetColor
                                                ? getThemePrimaryColor(0)
                                                : getThemePrimaryColor(context
                                                    .watch<AccessibilityCubit>()
                                                    .state
                                                    .indexColor),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '${_searchResults.total} hasil ditemui',
                                    style: TextStyleMadani.textStyle.interText.copyWith(
                                      color: MadaniColor.grey2,
                                    ),
                                  )
                                ],
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
                      child: _searchResults.data.isEmpty
                          ? SizedBox(
                              height: 200.h,
                              child: Center(
                                child: Text(
                                  'Tiada hasil ditemui',
                                  style: TextStyleMadani.textStyle.interText.copyWith(
                                    fontSize: 16.sp,
                                    color: MadaniColor.grey,
                                  ),
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) => Divider(
                                    height: 30.h,
                                    thickness: 1,
                                    color: Colors.grey[300],
                                  ),
                                  itemCount: _searchResults.data.length,
                                  itemBuilder: (context, i) {
                                    final data = _searchResults.data[i];
                                    final categoryColor = _getCategoryColor(data.cluster);
                                    final displayClusterName = _isMainCluster(data.cluster) 
                                        ? data.cluster 
                                        : 'Utama';
                                    final categoryName = displayClusterName.isNotEmpty
                                        ? displayClusterName[0].toUpperCase() +
                                            displayClusterName.substring(1).toLowerCase()
                                        : displayClusterName;
                                    
                                    return AnimatedOpacity(
                                      opacity: 1.0,
                                      duration: const Duration(milliseconds: 0),
                                      child: _buildInisiatifCard(
                                        category: categoryName,
                                        title: data.name,
                                        description: data.description,
                                        categoryColor: categoryColor,
                                        onTap: () {
                                          // Use nid if available, otherwise use id
                                          final id = (data.nid != null && data.nid!.isNotEmpty) 
                                              ? data.nid! 
                                              : data.id;
                                          if (id.isNotEmpty) {
                                            context
                                                .read<InitiativeBloc>()
                                                .add(GetInitiativeDetails(id));

                                            Navigator.of(context).pushNamed(
                                              MadaniRoutes.klusterDetailRoute,
                                              arguments: {
                                                'appBarTitle': displayClusterName,
                                                'category': categoryName,
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
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
    );
  }
}
