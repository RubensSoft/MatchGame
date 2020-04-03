import Foundation

class CardRepositoryImplementation: CardRepository {
    private var cardDataSource: CardDataSource
    private let cardMapper = CardMapperImplementation()
    
    init(cardDataSource: CardDataSource = CardDataSourceImplementation()) {
        self.cardDataSource = cardDataSource
    }
    
    func getCards(completion: @escaping ([Card]) -> (), failure: @escaping (String) -> ()) {
        cardDataSource.getCards(completion: { (cards) in
            completion(self.cardMapper.transform(cardList: cards))
        }) { (error) in
            failure(error)
        }
    }
    
    
}
