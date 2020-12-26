class Hand {
  List<String> pokerHand;
  List<int> pokerHandValue = List(5);
  List<String> pokerhandColor = List(5);
  String highestCard;

  Hand(List pokerHand) {
    pokerHand.asMap().forEach((i, element) => {
      pokerHandValue[i] = toInt(element[0]),
      pokerhandColor[i] = element[1]
    });
  }

  int toInt(String value) {
    switch (value) {
      case 'T':
        return 10;
      case 'J':
        return 11;
      case 'Q':
        return 12;
      case 'K':
        return 13;
      case 'A':
        return 14;
      default:
        return int.parse(value);
    }
  }

  int highCard() {
    var highestCard = -1;
    
    pokerHandValue.forEach((element) => {
      if (highestCard < element) {
        highestCard = element
      }
    });
    
    return highestCard;
  }

  PokerOutput onePair() {
    var result = false;
    var card; 
    
    pokerHandValue.asMap().forEach((i, element) => {
      pokerHandValue.asMap().forEach((ii, element2) => {
        if (element == element2 && i != ii) {
          result = true, //TODO: break?
          card = element
        }
      }),
    });
    
    return PokerOutput(result, card);
  }

  PokerOutput twoPair() { //TODO: die hand hält die indexe aber unten werden die elemente ansich  gebraucht
    var counter = 0;
    var hand = [];

    pokerHandValue.asMap().forEach((i, element) => {
      pokerHandValue.asMap().forEach((ii, element2) => {
        if (element == element2 && i != ii && !hand.contains(i) && !hand.contains(ii)) {
          ++counter,
          hand.add(i),
          hand.add(ii)
        }
      }),
    });

    var card = pokerHandValue[hand[0]];

    hand.forEach((element) => {
      if (element > card) element = card
    });
    
    return PokerOutput(counter > 1, card);
  }

  bool threeOfAKind() {
    var result = false;
    var hand = [];

    pokerHandValue.asMap().forEach((i, element) => {
      pokerHandValue.asMap().forEach((ii, element2) => {
        pokerHandValue.asMap().forEach((iii, element3) => {
          if (element == element2 && element2 == element3 && i != ii && i != iii && ii != iii) {
            result = true, //TODO: break?
            hand.add(element)
          }
        })
      })
    });

    return result;
  }

  bool straight() {
    var hand = List.from(pokerHandValue);
    
    hand.sort();

    for (var i=0; i<hand.length-1; i++) {
      if (hand[i]+1 != hand[i+1]) {
        return false;
      }
    }

    return true;
  }

  bool flush() {
    for (var i=1; i<pokerhandColor.length; i++) {
        if (pokerhandColor[0] != pokerhandColor[i]) {
          return false;
        }
    }

    return true;
  }
  
  bool fullHouse() {
    return true == threeOfAKind() && true == onePair();
  }

  bool fourOfAKind() {
    var result = false;

    pokerHandValue.asMap().forEach((i, element) => {
      pokerHandValue.asMap().forEach((ii, element2) => {
        pokerHandValue.asMap().forEach((iii, element3) => {
          pokerHandValue.asMap().forEach((iiii, element4) => {
          if (element == element2 && element2 == element3 && element3 == element4 && i != ii && i != iii && ii != iii && iiii != i && iiii != ii && iiii != iii) {
            result = true //TODO: break?
          }
          })
        })
      })
    });

    return result;
  }

  bool straightFlush() {
    return true == straight() && true == flush();
  }

  bool royalFlush() {
    var result = true;

    if (flush() && straight()) {
      pokerHandValue.forEach((i) => {
        if (i < 10) {
          result = false
        }
      });
      return result;
    } else {
      return false;
    }
  }
}

class PokerOutput{
  bool result;
  int card;

  PokerOutput(bool result, int card);
}