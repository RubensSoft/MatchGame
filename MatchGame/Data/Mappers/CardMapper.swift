import Foundation

class CardMapperImplementation {
    func transform(card: CardDTO) -> Card {
        return Card(id: card.id, name: card.name)
    }
    
    func transform(cardList: [CardDTO]) -> [Card] {
        return cardList.map { transform(card: $0) }
    }
}
