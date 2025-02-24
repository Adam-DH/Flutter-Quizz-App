import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../Provider/quiz_provider.dart';
import '../Widgets/drawer.dart';
import '../app_router.dart';
import 'not_enough_question.dart';
import 'start_quiz_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuizProvider>(context, listen: false).selectAllQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: Icon(
                Icons.menu_rounded,
                size: 32.w,
              ));
        }),
        title: Text(
          'Quiz App',
          style: TextStyle(color: Colors.black, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'assets/images/quiz.png',
            width: 300.w,
            height: 300.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          Consumer<QuizProvider>(builder: (context, quizProvider, child) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r))),
                onPressed: () {
                  quizProvider.score = 0;
                  quizProvider.selectedAnswer = '0';
                  if (quizProvider.questions.length < 5) {
                    AppRouter.pushWidget(const NotEnoughQuestion());
                  } else {
                    AppRouter.pushWidget(const StartQuizScreen());
                  }
                },
                child: Text(
                  "Let's Start!",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ));
          })
        ],
      ),
    );
  }
}
