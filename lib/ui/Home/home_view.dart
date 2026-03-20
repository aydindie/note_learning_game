// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobx/mobx.dart' show reaction, ReactionDisposer;
import 'package:provider/provider.dart';

import '../../constants/enums.dart';
import '../../constants/strings.dart';
import '../../controller/language_controller.dart';
import '../../service/admob_service.dart';
import '../../stores/all_store.dart';
import '../../utils/colors.dart';
import '../../widgets/anwers_widget.dart';
import '../../widgets/countdown_timer.dart';
import '../../widgets/question_widget.dart';
import '../../widgets/top_iconbuttons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BannerAd? _banner;
  InterstitialAd? _interstitialAd;
  ReactionDisposer? _gameOverReaction;
  bool _reactionSetUp = false;

  @override
  void initState() {
    super.initState();
    _createBannerAd();
    _createInterstitialAd();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_reactionSetUp) {
      _reactionSetUp = true;
      final viewModel = Provider.of<AllStore>(context, listen: false);
      _gameOverReaction = reaction(
        (_) => viewModel.isCounterFinished,
        (bool finished) {
          if (finished) {
            _showInterstitialAd();
          }
        },
      );
    }
  }

  @override
  void dispose() {
    _gameOverReaction?.call();
    _banner?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<LanguageController>();
    final noteViewModel = Provider.of<AllStore>(context);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 15.0).copyWith(top: 20),
          child: Center(
            child: Column(
              children: [
                const TopIconButtons(),
                SizedBox(
                  height: w / h > 0.5 ? h * 0.01 : h * 0.02,
                ),
                Observer(builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Observer(
                        builder: (_) {
                          return Container(
                            child: scoreBar(
                                h,
                                w,
                                currentScoreBackgroundColor,
                                noteViewModel.durationPreferences ==
                                        DurationPreferences.NONE
                                    ? "${"score".tr()}: ${noteViewModel.score}"
                                    : noteViewModel.durationPreferences ==
                                            DurationPreferences.TWENTY
                                        ? "${"score".tr()}: ${noteViewModel.score20s}"
                                        : noteViewModel.durationPreferences ==
                                                DurationPreferences.MINUTE
                                            ? "${"score".tr()}: ${noteViewModel.score1m}"
                                            : noteViewModel
                                                        .durationPreferences ==
                                                    DurationPreferences.FIVE_MIN
                                                ? "${"score".tr()}: ${noteViewModel.score5m}"
                                                : "score".tr()),
                          );
                        },
                      ),
                      Container(
                        child: noteViewModel.durationPreferences ==
                                DurationPreferences.NONE
                            ? const SizedBox(
                                height: 0,
                              )
                            : noteViewModel.durationPreferences ==
                                    DurationPreferences.TWENTY
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Observer(
                                        builder: (_) {
                                          return scoreBar(
                                              h,
                                              w,
                                              bestScoreBackgroundColor,
                                              "${"best_score".tr()}: ${noteViewModel.best20sScore}");
                                        },
                                      ),
                                    ],
                                  )
                                : noteViewModel.durationPreferences ==
                                        DurationPreferences.MINUTE
                                    ? Observer(
                                        builder: (_) {
                                          return scoreBar(
                                              h,
                                              w,
                                              bestScoreBackgroundColor,
                                              "${"best_score".tr()}: ${noteViewModel.best1mScore}");
                                        },
                                      )
                                    : noteViewModel.durationPreferences ==
                                            DurationPreferences.FIVE_MIN
                                        ? Observer(
                                            builder: (_) {
                                              return scoreBar(
                                                  h,
                                                  w,
                                                  bestScoreBackgroundColor,
                                                  "${"best_score".tr()}: ${noteViewModel.best5mScore}");
                                            },
                                          )
                                        : null,
                      ),
                    ],
                  );
                }),

                SizedBox(
                  height: w / h > 0.5 ? h * 0.01 : h * 0.02,
                ),

                Observer(builder: (_) {
                  return const CountdownTimer();
                }),
                SizedBox(
                  height: w / h > 0.5 ? h * 0.01 : h * 0.015,
                ),

                QuestionWidget(
                  viewModel: noteViewModel,
                ),
                SizedBox(
                  height: w / h > 0.5 ? h * 0.01 : h * 0.015,
                ),

                const AnswersWidget(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _banner == null
          ? Container()
          : Container(
              margin: const EdgeInsets.only(),
              height: 52,
              child: AdWidget(ad: _banner!),
            ),
    );
  }

  Row scoreBar(
    double h,
    double w,
    Color color,
    String text,
  ) {
    return Row(
      children: [
        Container(
          height: h * 0.06,
          decoration: BoxDecoration(
            border: Border.all(
                color: color == Colors.black ? Colors.white : Colors.black,
                width: 1),
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: w / h > 0.5 ? 16 : 20,
                      fontWeight: FontWeight.w400,
                      color:
                          color == Colors.black ? Colors.white : Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Image.asset(
                    clefAsset,
                    color: color == Colors.black ? Colors.white : Colors.black,
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  //==============Create Ads================
  void _createBannerAd() {
    _banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdMobService.bannerAdUnitId!,
        listener: AdMobService.bannerListener,
        request: const AdRequest())
      ..load();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdMobService.interstitialUnitAdId!,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) => _interstitialAd = ad,
          onAdFailedToLoad: (LoadAdError error) => _interstitialAd = null,
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    }
  }
}
