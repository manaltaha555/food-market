import 'package:flutter/material.dart';
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
                child: Image.asset(
                  "assets/images/${selectedIndex == 4 ? "onboarding2" : "onboarding"}.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (value) => setState(() {
                  selectedIndex = value;
                }),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          content[index]["title"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Text(content[index]["body"], textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: 
                selectedIndex == 0
                    ? Text("Skip")
                    : IconButton(
                        icon: Icon(Icons.arrow_back_rounded),
                        onPressed: () {
                          pageController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear,
                          );
                        },
                      ),
                ),
                Expanded(
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
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
