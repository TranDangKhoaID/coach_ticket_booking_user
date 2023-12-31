import 'package:flutter/material.dart';

class BillInforWidget extends StatelessWidget {
  final String ctk;
  final String stk;
  final String money;
  final String paymentMethod;
  final String payContent;
  const BillInforWidget({
    super.key,
    required this.ctk,
    required this.stk,
    required this.money,
    required this.paymentMethod,
    required this.payContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin thanh toán',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Text('Ngân hàng'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Text(paymentMethod),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Text('Số tài khoản'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Text(stk),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Text('Chủ tài khoản'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Text(ctk),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Text('Số tiền'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Text(money),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Center(child: Text('Nội dung chuyển khoản')),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Center(child: Text(payContent)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
