import 'package:flutter/material.dart';
import 'package:food_market/controller/user_state.dart';
import 'package:food_market/view/components/custom_bottom_sheet.dart';
import 'package:food_market/view/components/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController();
  int selectedIndex = 0;
  List content = [
    {
      "title": "Hello World\nHello World",
      "body":
          "Now eat well, Now eat well, Now eat well, Now eat well, Now eat well, Now eat well, Now eat well,",
    },
    {
      "title": "Select the\nFavorities Menu",
      "body":
          "don't leave the house, don't leave the house, don't leave the house, don't leave the house, don't leave the house, ",
    },
    {
      "title": "Select the\nFavorities Menu",
      "body":
          "Now eat well, don't leave the house,You can choose your favorite food only with one click",
    },
    {
      "title": "Good food at a cheap price",
      "body": "You can eat at expensive restaurants with affordable price",
    },
  ];

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/Pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                  child: States.getState() == UserState.onBoarding
                      ? Image.asset(
                          key: ValueKey("onboarding1"),
                          "assets/images/onboarding.png",
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          key: ValueKey("onboarding2"),
                          "assets/images/onboarding2.png",
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: States.getState() == UserState.onBoarding
                    ? [
                        Expanded(
                          child: PageView.builder(
                            itemCount: content.length, // ??
                            controller: pageController,
                            physics: NeverScrollableScrollPhysics(),
                            onPageChanged: (value) => setState(() {
                              selectedIndex = value;
                            }),
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      // ??
                                      content[index]["title"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    content[index]["body"],
                                    textAlign: TextAlign.center,
                                  ), // ??
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 250),
                                    transitionBuilder:
                                        (
                                          Widget child,
                                          Animation<double> animation,
                                        ) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                    child: selectedIndex == 0
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: InkWell(
                                              child: Text("Skip"),
                                              onTap: () {
                                                setState(() {
                                                  States.updateState(
                                                    UserState.onReg,
                                                  );
                                                });
                                              },
                                            ),
                                          )
                                        : IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_rounded,
                                            ),
                                            onPressed: () {
                                              pageController.previousPage(
                                                duration: Duration(
                                                  milliseconds: 500,
                                                ),
                                                curve: Curves.linear,
                                              );
                                            },
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: SmoothPageIndicator(
                                  controller: pageController,
                                  count: content.length,
                                  effect: const WormEffect(
                                    dotColor: Colors.grey,
                                    activeDotColor: Color(0xffD61355),
                                    dotHeight: 16,
                                    dotWidth: 16,
                                    type: WormType.normal,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward),
                                    onPressed: () {
                                      if (selectedIndex == 3) {
                                        setState(() {
                                          States.updateState(UserState.onReg);
                                        });
                                      } else {
                                        pageController.nextPage(
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.linear,
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]
                    : [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            // ??
                            "Hi there ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Text("on Reg", textAlign: TextAlign.center),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 100,
                            ),
                            child: CustomElevatedButton(
                              onTap: () {
                                _scaffoldKey.currentState!
                                    .showBottomSheet(
                                      (context) => Container(
                                        height: MediaQuery.of(context).size.height * 0.75,
                                        color: Colors.white,
                                        child: CustomBottomSheet()
                                      ),
                                    );
                              },
                              colors: [Color(0XFFD61355), Color(0XFFFF0000)],
                              verticalPadding: 20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Next",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
