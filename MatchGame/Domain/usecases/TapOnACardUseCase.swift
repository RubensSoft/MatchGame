import Foundation

protocol TapOnACardUseCase {
    func execute(card: Card, completion: (Bool)->(), failure: (String)->())
}

class TapOnACardUseCaseImplementation: TapOnACardUseCase {
    var card: Card? = nil
    
    func execute(card: Card, completion: (Bool) -> (), failure: (String) -> ()) {
        if self.card == nil {
            self.card = card
        } else {
            let isMatch = checkMatch(secondCard: card)
            completion(isMatch)
            self.card = nil
        }
    }
    
    private func checkMatch(secondCard: Card) -> Bool {
        return self.card!.id == secondCard.id
    }
}
