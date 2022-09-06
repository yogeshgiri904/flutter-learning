import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/pages/customAppBar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:action_slider/action_slider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final color = secondaryFont;
  final oprations = [
    'Kotak Bank',
    'SBI',
    'Canera Bank',
    'PNB',
    'IndusInd Bank'
  ];

  var checkedOpBtns;
  var moneySend = 0;
  @override
  Widget build(BuildContext context) {
    const invalidSnackBar =
        SnackBar(content: Text('Please first select a payment bank.'));
    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDark = (brightness == Brightness.dark) ? true : false;
    return SingleChildScrollView(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        CustomAppBar(),
        welcomePage(),
        Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: Container(
            height: 8.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      checkedOpBtns = index;
                    });
                  },
                  child: customLightBtn(
                      borderColor: Colors.white,
                      color: checkedOpBtns == index
                          ? Colors.amber
                          : Color.fromARGB(63, 155, 39, 176),
                      text: oprations[index],
                      height: 1.h,
                      // icon: Icon(Icons.add),
                      margin:
                          EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                      padding: EdgeInsets.symmetric(horizontal: 7.w)),
                );
              },
              itemCount: oprations.length,
            ),
          ),
        ),
        Container(
          height: 55.h,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: customCardView(
                      height: 30.h,
                      weight: 50.w,
                      icon: Icon(
                        Icons.qr_code_2,
                        size: 30.w,
                      ),
                      primaryText: 'Pay',
                      secondaryText: 'yogesh@axis',
                      button: GestureDetector(
                        onTap: () {
                          checkedOpBtns != null
                              ? showModalBottomSheet(
                                  elevation: 3,
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return Container(
                                        decoration: BoxDecoration(
                                          color: isDark == true
                                              ? Colors.black
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        height: 40.h,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: ListView(
                                                  children: [
                                                    Text(
                                                      "Pay using ${oprations[checkedOpBtns]}",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              secondaryFont,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const Text(
                                                      "yogesh@axis",
                                                      style: TextStyle(
                                                        color: Colors.blueGrey,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 6.h,
                                                    ),
                                                    Center(
                                                        child: Text(
                                                      'Rs. 30,000.00',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              secondaryFont,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 8.w),
                                                    ))
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Center(
                                                child: customSliderBtn(),
                                              )
                                            ],
                                          ),
                                        ));
                                  },
                                )
                              : ScaffoldMessenger.of(context)
                                  .showSnackBar(invalidSnackBar);

                          // BottomSheet(onClosing: () {
                          //   setState(() {
                          //     moneySend = 1;
                          //   });
                          // }, builder: (context) {
                          //   return Container(
                          //     child: Text('send'),
                          //   );
                          // });
                          setState(() {
                            moneySend = moneySend == 0 ? 1 : 0;
                          });
                        },
                        child: customLightBtn(
                            borderColor: Colors.greenAccent,
                            color: Color.fromARGB(100, 105, 240, 175),
                            icon: Icon(Icons.send_rounded),
                            text: 'Send',
                            height: 5.h,
                            width: 33.w,
                            margin: EdgeInsets.all(3.w),
                            padding: EdgeInsets.symmetric(horizontal: 4.w)),
                      )),
                ),
              ),
              Column(
                children: [
                  precentBlock(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customCardView(
                          height: 20.h,
                          weight: 44.w,
                          image: Image.asset(
                            'lib/assets/img/discussion.png',
                            width: 45.w / 3,
                          ),
                          primaryText: 'Exams',
                          secondaryText: 'Gand Fad Exam'),
                      customCardView(
                          height: 20.h,
                          weight: 44.w,
                          icon: Icon(
                            Icons.picture_as_pdf,
                            size: 14.w,
                          ),
                          primaryText: 'Downlaod',
                          secondaryText: 'Study Material'),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              )
            ],
          ),
        )
      ]),
    );
  }
}

customSliderBtn() {
  return ActionSlider.standard(
    backgroundBorderRadius: BorderRadius.circular(10),
    foregroundBorderRadius: BorderRadius.circular(10),
    toggleColor: Color.fromARGB(192, 0, 150, 135),
    backgroundColor: Color.fromARGB(139, 105, 240, 175),
    child: const Text('Slide to pay'),
    action: (controller) async {
      controller.loading(); //starts loading animation
      await Future.delayed(const Duration(seconds: 3));
      controller.success(); //starts success animation
    },
  );
}

customCardView({
  required double height,
  required double weight,
  Widget image = const SizedBox(
    height: 0,
  ),
  Widget icon = const SizedBox(
    height: 0,
  ),
  primaryText,
  color,
  secondaryText,
  double progressBar = 0,
  progressBarWidth,
  progressBarValue,
  Widget button = const SizedBox(
    height: 0,
  ),
}) {
  return Card(
    elevation: 3,
    child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        width: weight,
        height: height,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            image,
            icon,
            SizedBox(
              height: height / 20,
            ),
            Text(
              primaryText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: secondaryFont,
                fontSize: weight / 12,
              ),
            ),
            Text(
              secondaryText,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: weight / 15,
                color: Colors.blueGrey,
              ),
            ),
            progressBar != 0
                ? Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$progressBar %',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: secondaryFont),
                        ),
                        LinearPercentIndicator(
                          width: progressBarWidth,
                          lineHeight: 14.0,
                          percent: progressBar / 100,
                          backgroundColor: Color.fromARGB(255, 189, 187, 187),
                          progressColor: Colors.blueGrey,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(
                    height: 0,
                  ),
            button
          ]),
        )),
  );
}

customLightBtn(
    {borderColor,
    color,
    Widget icon = const SizedBox(),
    text,
    width,
    height,
    margin = const EdgeInsets.all(0),
    padding = const EdgeInsets.all(0)}) {
  return Padding(
    padding: margin,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(text), icon],
        ),
      ),
    ),
  );
}

welcomePage() {
  return Container(
    color: secondaryColor,
    width: 100.w,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hii, Yogesh Giri',
                        style: TextStyle(
                          fontFamily: secondaryFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 5.w,
                        ),
                      ),
                      const Text('Good morning !'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: .5.h,
              ),
              Positioned(
                child: Column(
                  children: [
                    Card(
                      elevation: 3,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(1.w),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: primaryColor),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.search_sharp),
                                color: primaryColor,
                              ),
                              enabledBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(top: 15, left: 20),
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

precentBlock() {
  return Card(
    elevation: 3,
    child: Container(
        width: 92.5.w,
        height: 20.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/img/reward.png',
                    width: 20.w,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overall Rank',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: secondaryFont),
                  ),
                  SizedBox(height: .5.h),
                  const Text(
                    'Congratulations! You got 2nd rank',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 12,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const Text(
                    'in our class.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '66 %',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: secondaryFont),
                        ),
                        LinearPercentIndicator(
                          width: 20.h,
                          lineHeight: 14.0,
                          percent: 0.66,
                          backgroundColor: Color.fromARGB(255, 189, 187, 187),
                          progressColor: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
  );
}
