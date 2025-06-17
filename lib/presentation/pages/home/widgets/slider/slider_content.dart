import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lol_app/app/utils/responsive.dart';
import 'package:lol_app/domain/models/breakpoint.dart';
import 'package:lol_app/domain/models/champions_data_model.dart';
import 'package:lol_app/presentation/pages/home/widgets/slider/slider_card_content.dart';
import 'package:lol_app/presentation/pages/home/widgets/slider/slider_empty_state.dart';

class SliderContent extends StatefulWidget {
  const SliderContent({super.key, required this.championList});
  final List<ChampionData> championList;

  @override
  State<SliderContent> createState() => _SliderContentState();
}

class _SliderContentState extends State<SliderContent> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return widget.championList.isEmpty
        ? const SliderEmptyState()
        : _SliderPageView(
            championList: widget.championList,
            selectedIndex: selectedIndex,
            onPageChanged: (val) => setState(() => selectedIndex = val),
          );
  }
}

class _SliderPageView extends StatefulWidget {
  final List<ChampionData> championList;
  final int selectedIndex;
  final ValueChanged<int> onPageChanged;

  const _SliderPageView({
    required this.championList,
    required this.selectedIndex,
    required this.onPageChanged,
  });

  @override
  State<_SliderPageView> createState() => _SliderPageViewState();
}

class _SliderPageViewState extends State<_SliderPageView> {
  late PageController _controller;
  late BreakpointConfig _config;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  void _handlePointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      final delta = event.scrollDelta.dy;

      if (delta > 0) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else if (delta < 0) {
        _controller.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _config = ResponsiveUtils.getConfig(constraints.maxWidth);

        _controller = PageController(viewportFraction: _config.viewport);

        return Listener(
          onPointerSignal: _handlePointerSignal,
          child: PageView.builder(
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            padEnds: constraints.maxWidth < 600,
            itemCount: widget.championList.length,
            onPageChanged: widget.onPageChanged,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final champion = widget.championList[index];
              final scale = widget.selectedIndex == index ? 1.0 : _config.scale;
              return SliderCard(
                champion: champion,
                scale: scale,
                config: _config,
              );
            },
          ),
        );
      },
    );
  }
}
