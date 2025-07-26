import 'package:flutter/material.dart';
import 'package:food_market/controller/user_state.dart';
import 'package:food_market/view/components/custom_elevated_button.dart';
import 'package:food_market/view/pages/login_page.dart';
import 'package:food_market/view/pages/signup_page.dart';
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

  //TabController tabController = TabController(length:2 , vsync: this);

  @override
  void initState() {
    super.initState();
  }

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
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/${States.getState() == UserState.onBoarding ? "onboarding" : "onboarding2"}.png",
                      ),
                    ),
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                        ? InkWell(
                                            child: Text("Skip"),
                                            onTap: () {
                                              setState(() {
                                                States.updateState(
                                                  UserState.onReg,
                                                );
                                              });
                                            },
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
                                                curve: Curves.fastOutSlowIn,
                                              );
                                            },
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          curve: Curves.fastOutSlowIn,
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
                              onTap: () async => await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => DraggableScrollableSheet(
                                  expand: false,
                                  maxChildSize: 0.8,
                                  minChildSize: 0.2,
                                  initialChildSize: 0.3,
                                  builder: (context, scrollController) =>
                                      DefaultTabController(
                                        length: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              SingleChildScrollView(
                                                controller: scrollController,
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 20,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                              Radius.circular(
                                                                20,
                                                              ),
                                                            ),
                                                        color: Color(
                                                          0xffFFDFDF,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TabBar(
                                                dividerColor: Colors.transparent,
                                                indicatorColor: Color(0xffD61355),
                                                labelColor: Color(0XFFD61355),
                                                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                tabs: [
                                                  Tab(text: "Create Account"),
                                                  Tab(text: "Login"),
                                                ],
                                              ),
                                              Expanded(
                                                child: TabBarView(
                                                  children: [
                                                    SignupPage(
                                                      controller:
                                                          scrollController,
                                                    ),
                                                    LogInPage(
                                                      controller:
                                                          scrollController,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                ),
                              ),
                              colors: [Color(0XFFD61355), Color(0XFFFF0000)],
                              verticalPadding: 20,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Next",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
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
