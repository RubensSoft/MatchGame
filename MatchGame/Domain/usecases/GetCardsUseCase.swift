import Foundation

protocol GetCardsUseCase {
    func execute(completion: @escaping ([Card])->(), failure: @escaping (String)->())
}

class GetCardsUseCaseImplementation : GetCardsUseCase {
    private let cardRepository: CardRepository
    
    init(cardRepository: CardRepository = CardRepositoryImplementation()){
        self.cardRepository = cardRepository
    }
    
    func execute(completion: @escaping ([Card]) -> (), failure: @escaping (String) -> ()) {
        cardRepository.getCards(completion: { (cards) in
            completion(cards)
        }) { (error) in
            failure(error)
        }
    }
    
}
