import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/constants/firebase_constants.dart';
import 'package:tdc_coach_user/app/constants/size_constants.dart';
import 'package:tdc_coach_user/app/constants/strings.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  FirebaseAuth auth = FireBaseConstant.auth;
  String titleName = '';
  void signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: FutureBuilder(
          future: _fApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Lỗi dữ liệu');
            } else if (snapshot.hasData) {
              return appBarTitle();
            } else {
              return const Text(AppString.loading);
            }
          },
        ),
        actions: [
          IconButton(
            onPressed: () => signOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      //color: Color(0xFFe8e8e8),
                      blurRadius: 1.0,
                      offset: Offset(0, 0.5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-1, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(1, 0),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ví của bạn',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            Divider(
                              color: Colors.black, // Màu của đường ngang
                              thickness: 2, // Độ dày của đường ngang
                              height: heightDivider,
                            ),
                            Text(
                              '1.000.000.000 VND',
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColor.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.attach_money_outlined,
                            color: AppColor.primary,
                            size: sizeIconNapTien,
                          ),
                          const SizedBox(
                            height: heightSizeBox,
                          ),
                          Container(
                            width: widthContainerNapTien,
                            height: heightContainerNapTien,
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Nạp tiền',
                                style: TextStyle(
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appBarTitle() {
    DatabaseReference _ref = FireBaseConstant.database
        .child(FireBaseConstant.customers)
        .child(auth.currentUser!.uid)
        .child(FireBaseConstant.fullNameCustomer);
    //listen to fire base
    _ref.onValue.listen(
      (event) {
        setState(() {
          titleName = event.snapshot.value.toString();
        });
      },
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.person,
              color: AppColor.primary,
              size: 30,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppString.hello,
              style: TextStyle(fontSize: 15),
            ),
            Text(titleName),
          ],
        )
      ],
    );
  }
}
