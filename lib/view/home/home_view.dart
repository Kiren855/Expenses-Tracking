import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
<<<<<<< HEAD
import 'package:firebase_database/firebase_database.dart';
import 'package:trackizer/model/category.dart';
import 'package:trackizer/model/user-model.dart';
import 'package:trackizer/service/category.dart';
import 'package:trackizer/service/database.dart';
=======
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a

import '../../common_widget/custom_arc_painter.dart';
import '../../common_widget/segment_button.dart';
import '../../common_widget/status_button.dart';
import '../../common_widget/subscription_home_row.dart';
import '../../common_widget/upcoming_bill_row.dart';
import '../settings/settings_view.dart';
import '../subscription_info/subscription_info_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
<<<<<<< HEAD
  List<Category> _categories = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _initializeCategories() async {
    CategoryService categoryService = CategoryService();

    Category category1 = Category(
        name: "YouTube Premium",
        icon: "assets/img/youtube_logo.png",
        type: "Expenses");
    await categoryService.addCategory(category1);

    Category category2 = Category(
        name: "Spotify", icon: "assets/img/spotify_logo.png", type: "Expenses");
    await categoryService.addCategory(category2);

    Category category3 = Category(
        name: "Microsoft OneDrive",
        icon: "assets/img/onedrive_logo.png",
        type: "Expenses");
    await categoryService.addCategory(category3);
  }

  Future<void> _fetchCategories() async {
    CategoryService categoryService = CategoryService();
    List<Category> categories = await categoryService.getCategories();
    setState(() {
      _categories = categories;
    });
  }

  bool isSubscription = true;

  List subArr = [
    {
      "name": "Spotify 1",
      "icon": "assets/img/spotify_logo.png",
      "price": "5.99"
    },
=======
  bool isSubscription = true;
  List subArr = [
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png", "price": "5.99"},
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
    {
      "name": "YouTube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "29.99"
    },
    {"name": "NetFlix", "icon": "assets/img/netflix_logo.png", "price": "15.00"}
  ];

<<<<<<< HEAD
=======
  List bilArr = [
    {"name": "Spotify", "date": DateTime(2023, 07, 25), "price": "5.99"},
    {
      "name": "YouTube Premium",
      "date": DateTime(2023, 07, 25),
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "date": DateTime(2023, 07, 25),
      "price": "29.99"
    },
    {"name": "NetFlix", "date": DateTime(2023, 07, 25), "price": "15.00"}
  ];

>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 1.1,
              decoration: BoxDecoration(
<<<<<<< HEAD
                color: TColor.gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
=======
                  color: TColor.gray70.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/img/home_bg.png"),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
<<<<<<< HEAD
                        padding: EdgeInsets.only(bottom: media.width * 0.05),
                        width: media.width * 0.72,
                        height: media.width * 0.72,
                        child: CustomPaint(
                          painter: CustomArcPainter(end: 220),
                        ),
                      ),
=======
                        padding:  EdgeInsets.only(bottom: media.width * 0.05),
                        width: media.width * 0.72,
                        height: media.width * 0.72,
                        child: CustomPaint(
                          painter: CustomArcPainter(end: 220, ),
                        ),
                      ),

>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Spacer(),
                            IconButton(
<<<<<<< HEAD
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SettingsView(),
                                  ),
                                );
                              },
                              icon: Image.asset(
                                "assets/img/settings.png",
                                width: 25,
                                height: 25,
                                color: TColor.gray30,
                              ),
                            ),
=======
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SettingsView()));
                                },
                                icon: Image.asset("assets/img/settings.png",
                                    width: 25,
                                    height: 25,
                                    color: TColor.gray30))
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
<<<<<<< HEAD
                      SizedBox(height: media.width * 0.05),
                      Image.asset("assets/img/app_logo.png",
                          width: media.width * 0.25, fit: BoxFit.contain),
                      SizedBox(height: media.width * 0.07),
                      Text(
                        "\$1,235",
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: media.width * 0.055),
                      Text(
                        "This month bills",
                        style: TextStyle(
                          color: TColor.gray40,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: media.width * 0.07),
=======
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Image.asset("assets/img/app_logo.png",
                          width: media.width * 0.25, fit: BoxFit.contain),
                       SizedBox(
                        height: media.width * 0.07,
                      ),
                      Text(
                        "\$1,235",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: media.width * 0.055,
                      ),
                      Text(
                        "This month bills",
                        style: TextStyle(
                            color: TColor.gray40,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TColor.border.withOpacity(0.15),
                            ),
                            color: TColor.gray60.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            "See your budget",
                            style: TextStyle(
<<<<<<< HEAD
                              color: TColor.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
=======
                                color: TColor.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: StatusButton(
                                title: "Active subs",
                                value: "12",
                                statusColor: TColor.secondary,
                                onPressed: () {},
                              ),
                            ),
<<<<<<< HEAD
                            const SizedBox(width: 8),
=======
                            const SizedBox(
                              width: 8,
                            ),
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
                            Expanded(
                              child: StatusButton(
                                title: "Highest subs",
                                value: "\$19.99",
                                statusColor: TColor.primary10,
                                onPressed: () {},
                              ),
                            ),
<<<<<<< HEAD
                            const SizedBox(width: 8),
=======
                            const SizedBox(
                              width: 8,
                            ),
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
                            Expanded(
                              child: StatusButton(
                                title: "Lowest subs",
                                value: "\$5.99",
                                statusColor: TColor.secondaryG,
                                onPressed: () {},
                              ),
<<<<<<< HEAD
                            ),
=======
                            )
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
                          ],
                        ),
                      ],
                    ),
<<<<<<< HEAD
                  ),
=======
                  )
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              height: 50,
              decoration: BoxDecoration(
<<<<<<< HEAD
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
=======
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
              child: Row(
                children: [
                  Expanded(
                    child: SegmentButton(
                      title: "Your subscription",
                      isActive: isSubscription,
                      onPressed: () {
                        setState(() {
                          isSubscription = !isSubscription;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: SegmentButton(
                      title: "Upcoming bills",
                      isActive: !isSubscription,
                      onPressed: () {
                        setState(() {
                          isSubscription = !isSubscription;
                        });
                      },
                    ),
<<<<<<< HEAD
                  ),
=======
                  )
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
                ],
              ),
            ),
            if (isSubscription)
              ListView.builder(
<<<<<<< HEAD
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];

                  return SubScriptionHomeRow(
                    sObj: {
                      "name": category.name,
                      "icon": category.icon,
                    },
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubscriptionInfoView(
                            sObj: {
                              "name": category.name,
                              "icon": category.icon,
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            if (!isSubscription)
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return SubScriptionHomeRow(
                    sObj: {
                      "name": category.name,
                      "icon": category.icon,
                    },
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubscriptionInfoView(
                            sObj: {
                              "name": category.name,
                              "icon": category.icon,
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            const SizedBox(height: 110),
=======
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subArr.length,
                  itemBuilder: (context, index) {
                    var sObj = subArr[index] as Map? ?? {};

                    return SubScriptionHomeRow(
                      sObj: sObj,
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => SubscriptionInfoView( sObj: sObj ) ));
                      },
                    );
                  }),
            if (!isSubscription)
              ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subArr.length,
                  itemBuilder: (context, index) {
                    var sObj = subArr[index] as Map? ?? {};

                    return UpcomingBillRow(
                      sObj: sObj,
                      onPressed: () {},
                    );
                  }),
            const SizedBox(
              height: 110,
            ),
>>>>>>> 4ad695b9159466fe0f46fde0e6aeb8ef67ee129a
          ],
        ),
      ),
    );
  }
}
