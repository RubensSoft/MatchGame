import Foundation

protocol TapOnACardUseCase {
    func execute(card: Card, completion: (Bool)->(), failure: (String)->())
}

class TapOnACardUseCaseImplementation: TapOnACardUseCase {
    var firstCard: Card? = nil
    
    func execute(card: Card, completion: (Bool) -> (), failure: (String) -> ()) {
        if self.firstCard == nil {
            self.firstCard = card
        } else {
            let isMatch = checkMatch(secondCard: card)
            completion(isMatch)
            self.firstCard = nil
        }
    }
    
    private func checkMatch(secondCard: Card) -> Bool {
        return self.firstCard!.id == secondCard.id
    }
}
