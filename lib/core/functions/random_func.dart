import 'dart:math';

class RandomFunc {

// Generate a random number between min and max (inclusive)
  static int generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }
}
