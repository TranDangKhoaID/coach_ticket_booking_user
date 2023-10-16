import 'package:flutter/material.dart';
import 'package:tdc_coach_user/app/manager/color_manager.dart';

class SelectSeat extends StatefulWidget {
  const SelectSeat({super.key});

  @override
  State<SelectSeat> createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  //
  Map<String, Color> seatColors = {
    'A01': AppColor.trong,
    'A02': AppColor.trong,
    'A03': AppColor.daMua,
    'A04': AppColor.trong,
    'A05': AppColor.daMua,
    'A06': AppColor.trong,
    'A07': AppColor.daMua,
    'A08': AppColor.trong,
    'A09': AppColor.trong,
    'A10': AppColor.daMua,
    'A11': AppColor.trong,
    'A12': AppColor.daMua,
    'A13': AppColor.trong,
    'A14': AppColor.daMua,
  };
  int selectedSeatCount = 0; // Đếm số ghế đã chọn
  void toggleSeatColor(String seat) {
    if (selectedSeatCount < 5 || seatColors[seat] == AppColor.dangChon) {
      setState(() {
        if (seatColors[seat] == AppColor.trong) {
          seatColors[seat] = AppColor.dangChon;
          selectedSeatCount++;
        } else {
          seatColors[seat] = AppColor.trong;
          selectedSeatCount--;
        }
      });
    } else {
      print('Quá 5 lần lỗi vl boy');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.primary,
        title: Text('Chọn Ghế'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 26),
                width: 48,
                height: 48,
                child: Icon(Icons.two_wheeler),
              )
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _GeneralSeatComponet(
                          title: 'A01',
                          color: seatColors['A01']!,
                          onTap: () => toggleSeatColor('A01'),
                        ),
                        _GeneralSeatComponet(
                          title: 'A02',
                          color: seatColors['A02']!,
                          onTap: () => toggleSeatColor('A02'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _GeneralSeatComponet(
                          title: 'A03',
                          color: seatColors['A03']!,
                          onTap: () => toggleSeatColor('A03'),
                        ),
                        _GeneralSeatComponet(
                          title: 'A04',
                          color: seatColors['A04']!,
                          onTap: () => toggleSeatColor('A04'),
                        ),
                        _GeneralSeatComponet(
                          title: 'A05',
                          color: seatColors['A05']!,
                          onTap: () => toggleSeatColor('A05'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _GeneralSeatComponet(
                          title: 'A06',
                          color: seatColors['A06']!,
                          onTap: () => toggleSeatColor('A06'),
                        ),
                        _GeneralSeatComponet(
                          title: 'A07',
                          color: seatColors['A07']!,
                          onTap: () => toggleSeatColor('A07'),
                        ),
                        _GeneralSeatComponet(
                          title: 'A08',
                          color: seatColors['A08']!,
                          onTap: () => toggleSeatColor('A08'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _GeneralSeatComponet(
                          title: 'A09',
                          color: seatColors['A09']!,
                          onTap: () => toggleSeatColor('A09'),
                        ),
                        _GeneralSeatComponet(
                          title: 'A010',
                          color: seatColors['A10']!,
                          onTap: () => toggleSeatColor('A10'),
                        ),
                        _GeneralSeatComponet(
                          title: 'A011',
                          color: seatColors['A11']!,
                          onTap: () => toggleSeatColor('A11'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _GeneralSeatComponet(
                          title: 'A12',
                          color: seatColors['A12']!,
                          onTap: () => toggleSeatColor('A12'),
                        ),
                        _GeneralSeatComponet(
                          title: 'A13',
                          color: seatColors['A13']!,
                          onTap: () => toggleSeatColor('A13'),
                        ),
                        _GeneralSeatComponet(
                          title: 'A14',
                          color: seatColors['A14']!,
                          onTap: () => toggleSeatColor('A14'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: AppColor.trong,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text(
                  'Trống',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: AppColor.dangChon,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text(
                  'Đang chọn',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: AppColor.daMua,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text(
                  'Đã mua',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: BottomAppBar(
          elevation: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Text(
                  "Seat: $selectedSeatCount/5",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GeneralSeatComponet extends StatelessWidget {
  final String title;
  final Color color;
  final void Function()? onTap;

  const _GeneralSeatComponet({
    super.key,
    required this.title,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
