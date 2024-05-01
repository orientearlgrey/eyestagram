import 'dart:math';

String getDuration() {
  Random random = Random();
  var units = ['h', 'd', 'w'];
  String unit = units[random.nextInt(units.length)];
  String duration = '';
  switch (unit) {
    case 'h':
      {
        duration = '${random.nextInt(23) + 1}$unit';
      }
    case 'd':
      {
        duration = '${random.nextInt(6) + 1}$unit';
      }
    case 'w':
      {
        duration = '${random.nextInt(2) + 1}$unit';
      }
  }
  return duration;
}

int getLikes() {
  num exponent = Random().nextInt(4) + 2;
  num likes = Random().nextDouble() * pow(10, exponent) + 2;
  return likes.toInt();
}

int getComments(likes) {
  return (likes * 0.1 * Random().nextDouble()).toInt() + 2;
}
