import './models/user.dart';

var dummyUsers = [
  User(
      uid: 'u1',
      name: 'Ibneet Kaur',
      phoneNumber: '9781082444',
      email: '5ibneet@gmail.com',
      gender: 'Female',
      occupation: 'Student',
      imageUrl:
          'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      dob: DateTime.parse('1999-06-06')),
  User(
      uid: 'u2',
      name: 'Weasly',
      phoneNumber: '8673245613',
      email: 'test@gmail.com',
      gender: 'Male',
      occupation: 'Doctor',
      imageUrl:
          'https://www.thehealthy.com/wp-content/uploads/2017/09/02_doctor_Insider-Tips-to-Choosing-the-Best-Primary-Care-Doctor_519507367_Stokkete.jpg',
      dob: DateTime.parse('1999-07-12'))
];
