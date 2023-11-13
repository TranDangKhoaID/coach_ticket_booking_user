import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/app/storage/app_shared.dart';
import 'package:tdc_coach_user/presentation/home_page/controller/home_page_controller.dart';
import 'package:tdc_coach_user/presentation/top_up/component/billing_infor_widget.dart';
import 'package:tdc_coach_user/presentation/top_up/controller/top_up_controller.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  //
  DatabaseReference database =
      FirebaseDatabase.instance.ref().child('payments');
  //
  //infor bill
  String paymentMethod = '';
  String accountNumber = '';
  String accountOwner = '';
  String payContent = '';
  //
  String phone = AppPreferences.instance.getPhone() ?? "null";
  String money = '';
  String? _dropDownvalue;
  void _dropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropDownvalue = selectedValue;
      });
    }
    print(_dropDownvalue);
  }

  //currency
  final _controller = TextEditingController();
  String formatCurrency(String value) {
    final formatter = NumberFormat("#,###", "vi_VN");
    try {
      int parsedValue = int.parse(value.replaceAll('.', ''));
      return formatter.format(parsedValue);
    } catch (e) {
      return value;
    }
  }

  //
  void payAccount() {
    if (_dropDownvalue == null) {
      EasyLoading.showError('Vui lòng chọn ngân hàng');
      return;
    }
    if (_controller.text.isEmpty) {
      EasyLoading.showError('Bạn phải nhập số tiền');
      return;
    }
    if (_controller.text.length > 11 || _controller.text.length < 6) {
      EasyLoading.showError('Số từ 10.000 đến 100 triệu');
      return;
    }
    if (_dropDownvalue == 'momo') {
      paymentMethod = 'momo';
      accountNumber = '0902800681';
      accountOwner = 'TRAN DANG KHOA';
      payContent = 'Nap $money tdc coach vào $phone';
    } else {
      paymentMethod = 'tech-com bank';
      accountNumber = '19032737283';
      accountOwner = 'TRAN DANG KHOA';
      payContent = 'Nap $money tdc coach vào $phone';
    }
    money = _controller.text;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          title: Text('Nạp tiền'),
          elevation: 0,
          backgroundColor: AppColor.primary,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      //color: Color(0xFFe8e8e8),
                      blurRadius: 2.0,
                      offset: Offset(0, 0.5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.5, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Số dư trong ví: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '${HomePageController.instance.wallet.value} đ ',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Cổng thanh toán: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Obx(
                              () => DropdownButton(
                                iconSize: 42.0,
                                value: TopUpController
                                    .instance.dropDownvalue.value,
                                items: const [
                                  DropdownMenuItem(
                                    child: Text('Momo'),
                                    value: "momo",
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Ngân hàng'),
                                    value: "bank",
                                  )
                                ],
                                onChanged:
                                    TopUpController.instance.dropDownCallBack,
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _controller,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        onChanged: (value) {
                          String formattedValue = formatCurrency(value);
                          if (value != formattedValue) {
                            _controller.text = formattedValue;
                            _controller.selection = TextSelection.fromPosition(
                              TextPosition(offset: _controller.text.length),
                            );
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: AppColor.primary,
                          ),
                          hintText: 'Nhập số tiền',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => payAccount(),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 50,
                        child: Center(
                          child: Text(
                            'Xác nhận',
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              BillInforWidget(
                ctk: accountOwner,
                stk: accountNumber,
                money: money,
                paymentMethod: paymentMethod,
                phone: phone,
                payContent: payContent,
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomAppBar(
            elevation: 64,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Center(
                          child: Text(
                            "Nạp",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
