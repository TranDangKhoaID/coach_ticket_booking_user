import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';
import 'package:tdc_coach_user/app/storage/app_shared.dart';
import 'package:tdc_coach_user/presentation/home_page/controller/home_page_controller.dart';
import 'package:tdc_coach_user/presentation/top_up/component/billing_infor_widget.dart';
import 'package:tdc_coach_user/presentation/top_up/component/button_pay_account.dart';
import 'package:tdc_coach_user/presentation/top_up/controller/top_up_controller.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  //
  String phone = AppPreferences.instance.getPhone() ?? "0";
  //currency
  final _controller = TextEditingController();

  void testPay() {
    print('Nạppppppp');
  }

  @override
  void dispose() {
    TopUpController.instance.confirmPay.value = false;
    TopUpController.instance.dropDownvalue.value = 'momo';
    TopUpController.instance.paymentMethod.value = '';
    TopUpController.instance.accountNumber.value = '';
    TopUpController.instance.accountOwner.value = '';
    TopUpController.instance.umoney.value = '';
    TopUpController.instance.payContent.value = '';
    _controller.dispose();
    super.dispose();
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
                              value:
                                  TopUpController.instance.dropDownvalue.value,
                              items: const [
                                DropdownMenuItem(
                                  value: "momo",
                                  child: Text('Momo'),
                                ),
                                DropdownMenuItem(
                                  value: "bank",
                                  child: Text('Ngân hàng'),
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
                    onTap: () {
                      TopUpController.instance.confirmPayMethod(
                        phone: phone,
                        money: _controller.text,
                      );
                    },
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
                  ),
                ],
              ),
            ),
            Obx(
              () => BillInforWidget(
                ctk: TopUpController.instance.accountOwner.value,
                stk: TopUpController.instance.accountNumber.value,
                money: TopUpController.instance.umoney.value,
                paymentMethod: TopUpController.instance.paymentMethod.value,
                payContent: TopUpController.instance.payContent.value,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BTNPayAccount(
          isConfrimPay: TopUpController.instance.confirmPay.value,
          onTap: () {
            TopUpController.instance.addPayAccount(
              money: _controller.text,
              phone: phone,
            );
          },
        ),
      ),
    );
  }
}
