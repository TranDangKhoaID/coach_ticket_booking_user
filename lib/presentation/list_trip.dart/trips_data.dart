import 'package:tdc_coach_user/domain/model/car.dart';
import 'package:tdc_coach_user/domain/model/location.dart';
import 'package:tdc_coach_user/domain/model/trip.dart';

// List<Trip> tripsData = [
//   Trip(
//     id: "1",
//     departureDate: DateFormat('dd/MM/yyyy').format(DateTime(2023, 10, 14)),
//     departureLocation: locationsData[0],
//     destinationLocation: locationsData[1],
//     departureTime: "08:00 AM",
//     destinationTime: "10:00 AM",
//     driverId: 101,
//     car: carsData[0],
//     price: 190000,
//   ),
//   Trip(
//     id: "2",
//     departureDate: DateFormat('dd/MM/yyyy').format(DateTime(2023, 10, 15)),
//     departureLocation: locationsData[2],
//     destinationLocation: locationsData[1],
//     departureTime: "09:00 AM",
//     destinationTime: "11:00 AM",
//     driverId: 102,
//     car: carsData[1],
//     price: 200000,
//   ),
//   Trip(
//     id: "3",
//     departureDate: DateFormat('dd/MM/yyyy').format(DateTime(2023, 10, 16)),
//     departureLocation: locationsData[1],
//     destinationLocation: locationsData[2],
//     departureTime: "12:00 AM",
//     destinationTime: "6:00 PM",
//     driverId: 102,
//     car: carsData[2],
//     price: 60000,
//   ),
//   // Thêm các trip khác ở đây
// ];

List<Location> locationsData = [
  Location(
    id: 1,
    name: "TP Hồ Chí Minh",
    address: "Bx Miền Đông",
  ),
  Location(
    id: 2,
    name: "Hà Nội",
    address: "Bx Hà Nội",
  ),
  Location(
    id: 3,
    name: "Huế",
    address: "Bx Huế",
  ),
];

List<Car> carsData = [
  Car(
    id: "1",
    name: "Limousine",
    licensePlates: "54-V59061",
  ),
  Car(
    id: "2",
    name: "Giường",
    licensePlates: "55-Z52040",
  ),
  Car(
    id: "3",
    name: "Thường",
    licensePlates: "30-T41975",
  ),
];
