import 'package:pokerhands/poker_hand.dart' as pokerhands;

void main(List<String> arguments) {
  var hand = '3C 3D 3S 9S 9D'.split(' ');
  var klasse = pokerhands.Hand(hand);

  print('highCard');
  print(klasse.highCard());
  print('onePair');
  print(klasse.onePair());
  print('twoPair');
  print(klasse.twoPair());
  print('threeOfAKind');
  print(klasse.threeOfAKind());
  print('straight');
  print(klasse.straight());
  print('flush');
  print(klasse.flush());
  print('fullHouse');
  print(klasse.fullHouse());
  print('fourofAKind');
  print(klasse.fourOfAKind());
  print('straightFlush');
  print(klasse.straightFlush());
  print('royalFlush');
  print(klasse.royalFlush());
}
