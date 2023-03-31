// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import '../constants/enums.dart';
import '../service/admob_service.dart';
import '../stores/all_store.dart';
import '../utils/colors.dart';

class AnswersWidget extends StatefulWidget {
  const AnswersWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AnswersWidget> createState() => _AnswersWidgetState();
}

class _AnswersWidgetState extends State<AnswersWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createInterstitialAd();
    _createRewardedAd();
  }

  int INTERSTITAL_AD_LIMIT = 5;
  int REWARED_AD_LIMIT = 8;
  RewardedAd? _rewardedAd;
  InterstitialAd? _interstitialAd;
  final _crossAxisCount = 36;

  final _itemCount = 7;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final ratio = w / h;
    final viewModel = Provider.of<AllStore>(context);
    void anwerOnPressed() {
      if (viewModel.isCounterStarted && !viewModel.isCounterFinished) {
        print(
            "isCounterStarted ${viewModel.isCounterStarted}&& !isCounterFinished ${!viewModel.isCounterFinished}");
        frogOnPressed();
      }
    }

    return SizedBox(
      child: StaggeredGridView.countBuilder(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: _crossAxisCount,
        itemCount: _itemCount,
        itemBuilder: (BuildContext context, int index) =>
            Center(child: Observer(builder: (_) {
          return AnimatedContainer(
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
              color: (viewModel.noteIndex % 7 == index)
                  ? correctAnswerBackgroundColor
                  : wrongAnswerBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: TouchableOpacity(
                //enableFeedback: false,
                activeOpacity: 0.1,
                onTap: () {
                  if (viewModel.noteIndex % 7 == index) {
                    if (viewModel.durationPreferences ==
                        DurationPreferences.NONE) {
                      viewModel.changeScore();
                      viewModel.updateRandomIndex();
                      anwerOnPressed();
                    } else if (viewModel.durationPreferences ==
                        DurationPreferences.TWENTY) {
                      viewModel.changeScore20s();
                      viewModel.updateRandomIndex();
                      anwerOnPressed();
                    } else if (viewModel.durationPreferences ==
                        DurationPreferences.MINUTE) {
                      viewModel.changeScore1m();
                      viewModel.updateRandomIndex();
                      anwerOnPressed();
                    } else if (viewModel.durationPreferences ==
                        DurationPreferences.FIVE_MIN) {
                      viewModel.changeScore5m();
                      viewModel.updateRandomIndex();
                      anwerOnPressed();
                    }
                  }

                  //TODO: buraya bak
                },
                child: Container(
                  width: w / 3.2,
                  decoration: BoxDecoration(
                    color: answerBackgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      viewModel.defaultList[index],
                      style: TextStyle(
                          color: answerTextColor,
                          fontSize: 35,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )),
          );
        })),
        staggeredTileBuilder: (int index) => StaggeredTile.count(
            index == (_itemCount - 1) ? _crossAxisCount : 12,
            ratio >= 0.5 ? 8 : 9),
      ),
    );
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

  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: AdMobService.rewardedAdUnitId!,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) => setState(() => _rewardedAd = ad),
          onAdFailedToLoad: (error) => setState(() => _rewardedAd = null),
        ));
  }

  void frogOnPressed() {
    var random = Random().nextInt(INTERSTITAL_AD_LIMIT);
    var random2 = Random().nextInt(REWARED_AD_LIMIT);
    if (random == 0) {
      showInterstitialAd();
    } else if (random2 == 0) {
      showRewardedAd();
    }
  }

  void showInterstitialAd() {
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

  void showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createRewardedAd();
        },
      );
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          debugPrint('User earned reward of $reward');
        },
      );
      _rewardedAd = null;
    }
  }
}
