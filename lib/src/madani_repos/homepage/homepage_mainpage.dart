// import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:madani/src/index.dart';

class MainPageMadani extends StatelessWidget {
  MainPageMadani({super.key});

  @override
  Widget build(BuildContext context) {
    // Get InitiativeBloc from root level (main.dart) to share across all pages
    // This ensures HomeStartPage and HomepageStartPage use the same InitiativeBloc instance
    InitiativeBloc? rootInitiativeBloc;
    try {
      rootInitiativeBloc = context.read<InitiativeBloc>();
    } catch (e) {
      // If not available, create new instance
      rootInitiativeBloc = null;
    }
    
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomBarCubit>(
          create: (context) => BottomBarCubit(),
        ),
        // Provide InitiativeBloc at MainPageMadani level so both HomeStartPage and HomepageStartPage can use it
        if (rootInitiativeBloc != null)
          BlocProvider<InitiativeBloc>.value(
            value: rootInitiativeBloc,
          )
        else
          BlocProvider<InitiativeBloc>(
            create: (context) => InitiativeBloc(),
          ),
      ],
      child: BlocConsumer<BottomBarCubit, BottomBarState>(
        listener: (context, state) {
          // When Utama menu is clicked (index 0), reset to main screen
          if (state.counter > 0 && state.index == 0) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              try {
                // Find HomeStartPageState and reset navigation to main screen
                final homeStartPageState = context.findAncestorStateOfType<HomeStartPageState>();
                if (homeStartPageState != null && homeStartPageState.mounted) {
                  homeStartPageState.resetToMainScreen();
                }
              } catch (e) {
                // If can't access UtamaStartPageState, ignore
              }
            });
          }
          if (state.counter > 0 && state.index == 1) {}
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
              children: [
                LazyLoadIndexedStack(
                  index: state.index,
                  children: const [
                    HomeStartPage(
                      startPage: HomeRoutes.madaniHome,
                    ),
                    const HomepageStartPage(
                      startPage: MadaniRoutes.initiativeRoute,
                    ),
                    InformationPage(),
                  ],
                ),
                context.watch<AccessibilityCubit>().state.magnifierHide
                    ? const SizedBox.shrink()
                    : Positioned(
                        left: context
                                .watch<AccessibilityCubit>()
                                .state
                                .draggingX -
                            100,
                        top: context
                                .watch<AccessibilityCubit>()
                                .state
                                .draggingY -
                            100,
                        child: Listener(
                          onPointerMove: (moveEvent) {
                            final screenWidth = MediaQuery.sizeOf(context).width;
                            final screenHeight = MediaQuery.sizeOf(context).height;
                            final magnifierSize = 200.0;
                            final edgeOffset = 0; // 40% offset from screen edges
                            
                            // Calculate min and max positions with 40% offset from edges
                            final minX = screenWidth * edgeOffset;
                            final maxX = screenWidth * (1 - edgeOffset);
                            final minY = screenHeight * edgeOffset;
                            final maxY = screenHeight * (1 - edgeOffset);
                            
                            double newPositionX =
                                context.read<AccessibilityCubit>().state.draggingX +
                                    moveEvent.delta.dx;
                            double newPositionY =
                                context.read<AccessibilityCubit>().state.draggingY +
                                    moveEvent.delta.dy;

                            // Constrain X position within 40% offset from edges
                            if (newPositionX > maxX) {
                              context.read<AccessibilityCubit>().draggingPositionX(
                                  x: maxX);
                            } else if (newPositionX < minX) {
                              context.read<AccessibilityCubit>().draggingPositionX(
                                  x: minX);
                            } else {
                              context.read<AccessibilityCubit>()
                                  .draggingPositionX(x: newPositionX);
                            }

                            // Constrain Y position within 40% offset from edges
                            if (newPositionY > maxY) {
                              context.read<AccessibilityCubit>().draggingPositionY(
                                  y: maxY);
                            } else if (newPositionY < minY) {
                              context.read<AccessibilityCubit>().draggingPositionY(
                                  y: minY);
                            } else {
                              context.read<AccessibilityCubit>()
                                  .draggingPositionY(y: newPositionY);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey, // Border color
                                width: 2, // Border width
                              ),
                            ),
                            child: RawMagnifier(
                              size: const Size(200, 200),
                              magnificationScale: 2,
                              decoration: const MagnifierDecoration(
                                  shape: CircleBorder()),
                              child: Container(),
                            ),
                          ),
                        ),
                      ),
                const AccessibilityContainer()
              ],
              ),
            ),
            bottomNavigationBar: NavigationBottomBar(
              currentIndex:
                  context.select((BottomBarCubit cubit) => cubit.state.index),
              items: [
                NavigationBarItem(
                  iconPath: Assets.images.menuUtama.path,
                  activeIconPath: Assets.images.menuUtamaActive.path,
                  label: 'Utama',
                ),
                NavigationBarItem(
                  iconPath: Assets.images.menuInisiatif.path,
                  activeIconPath: Assets.images.menuInisiatifActive.path,
                  label: 'Inisiatif',
                ),
                NavigationBarItem(
                  iconPath: Assets.images.menuNaccol.path,
                  activeIconPath: Assets.images.menuNaccolActive.path,
                  label: 'NACCOL',
                ),
              ],
              onTap: (value) {
                context.read<BottomBarCubit>().changeNavigation(index: value);
              },
            ),
          );
        },
      ),
    );
  }
}
