import 'package:elevate_c2_mon/features/categories/data/models/calculator.dart';
import 'package:test/test.dart';

void main() {
//setUp
  late Calculator calculator;
  setUp(() {
    print("===========================>>>>>setUp");
    //Arrange (initialize or define)
    //Act
    //Assert
  });
//setUpAll
  setUpAll(() {
    calculator = Calculator();
    print("===========================>>>>>setUpAll");
  });

//tearDown
  tearDown(() {
    print("===========================>>>>>tearDown");
  });
//tearDownAll
  tearDownAll(() {
    print("===========================>>>>>tearDownAll");
  });
  group("Test Add Function", () {
    test("Test Add Function when a is smaller than 5", () {
      //Act (Run the action)
      int result = calculator.add(2, 3);

      //Assert (Check)
      expect(result, 5);
    });
    test("Test Add Function when a is bigger than 5", () {
      //Act (Run the action)
      int result = calculator.add(6, 3);

      //Assert (Check)
      expect(result, isA<int>());
      expect(result, 9);
    });

    test("Test Add Function with -2 and 3 = 1", () {
      //Act (Run the action)
      int result = calculator.add(-2, 3);

      //Assert (Check)
      expect(result, 1);
    });
  });

  group("Test Divide Function", () {
    test("Test divide function when b = 0", () {
      double result = calculator.divide(2, 0);
      expect(result, 0);
    });
  });
}
