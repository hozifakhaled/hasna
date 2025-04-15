import 'package:flutter/material.dart';
import 'package:hasna/core/widgets/zaker.dart';

class EveningazkerBodyView extends StatefulWidget {
  const EveningazkerBodyView({super.key});

  @override
  State<EveningazkerBodyView> createState() => _EveningazkerBodyViewState();
}

class _EveningazkerBodyViewState extends State<EveningazkerBodyView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<Widget> pages = [
    // Replace with your actual pages
    Zaker(
      zaker:
          'اللهم إني أصبحت منك في نعمة و عافية و ستر فأتمم نعمتك علي و عافيتك و سترك في الدنيا و الآخرة',
      asnad:
          'قال ابن السني في عمل اليوم والليلة 55 حدثني عبيد الله بن شبيب بن عبد الملك عن يزيد ابن سنان حدثنا عمرو بن الحصين حدثنا إبراهيم بن عبد الملك عن قتادة عن سعيد بن أبي الحسن عن ابن عباس رضي الله عنه قال قال رسول الله صلى الله عليه وسلم من قال إذا أصبح (اللهم إني أصبحت منك في نعمة وعافية وستر فأتمم علي نعمتك وعافيتك وسترك في الدنيا والآخرة) ثلاث مرات إذا أصبح وإذا أمسى كان حقا على الله عز وجل أن يتم عليه نعمته.وفي إسناده إبراهيم بن عبدالملكقال الحافظ ابن حجر في تهذيب التهذيب ج1:ص123 إبراهيم بن عبد الملك البصري أبو إسماعيل القناد روى عن يحيى بن أبي كثير وقتادةوعنه عبد الصمد بن عبد الوارث ويحيى بن درست ولوين وإسحاق بن أبي إسرائيل وغيرهم',
      totalAzker: 25,
      currentAzker: 4,
      number: 3,
      numberofzaker: '3 مرات ',
    ),
    // Replace with your actual pages
    Zaker(
      zaker:
          'اللهم إني أصبحت منك في نعمة و عافية و ستر فأتمم نعمتك علي و عافيتك و سترك في الدنيا و الآخرة',
      asnad:
          'قال ابن السني في عمل اليوم والليلة 55 حدثني عبيد الله بن شبيب بن عبد الملك عن يزيد ابن سنان حدثنا عمرو بن الحصين حدثنا إبراهيم بن عبد الملك عن قتادة عن سعيد بن أبي الحسن عن ابن عباس رضي الله عنه قال قال رسول الله صلى الله عليه وسلم من قال إذا أصبح (اللهم إني أصبحت منك في نعمة وعافية وستر فأتمم علي نعمتك وعافيتك وسترك في الدنيا والآخرة) ثلاث مرات إذا أصبح وإذا أمسى كان حقا على الله عز وجل أن يتم عليه نعمته.وفي إسناده إبراهيم بن عبدالملكقال الحافظ ابن حجر في تهذيب التهذيب ج1:ص123 إبراهيم بن عبد الملك البصري أبو إسماعيل القناد روى عن يحيى بن أبي كثير وقتادةوعنه عبد الصمد بن عبد الوارث ويحيى بن درست ولوين وإسحاق بن أبي إسرائيل وغيرهم',
      totalAzker: 25,
      currentAzker: 4,
      number: 3,
      numberofzaker: '3 مرات ',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      children: pages,
    );
  }
}
