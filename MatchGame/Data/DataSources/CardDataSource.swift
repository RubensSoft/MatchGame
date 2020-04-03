import Foundation

protocol CardDataSource {
    func getCards(completion: @escaping ([CardDTO])->(), failure: @escaping (String)->())
}

class CardDataSourceImplementation: CardDataSource {
    func getCards(completion: @escaping ([CardDTO]) -> (), failure: @escaping (String) -> ()) {
        
        var cardList: [CardDTO] = []
        var cardDTO: CardDTO
        
        cardDTO = CardDTO(id: 1, name: "devil")
        cardList.append(cardDTO)
        
        cardDTO = CardDTO(id: 2, name: "yeti")
        cardList.append(cardDTO)
        
        cardDTO = CardDTO(id: 3, name: "goblin")
        cardList.append(cardDTO)
        
        cardDTO = CardDTO(id: 4, name: "character")
        cardList.append(cardDTO)
        
        cardDTO = CardDTO(id: 5, name: "pinocchio")
        cardList.append(cardDTO)
        
        cardDTO = CardDTO(id: 6, name: "robot")
        cardList.append(cardDTO)
        
        cardDTO = CardDTO(id: 7, name: "mushroom")
        cardList.append(cardDTO)
        
        cardDTO = CardDTO(id: 8, name: "alien")
        cardList.append(cardDTO)
        
        cardDTO = CardDTO(id: 9, name: "halloween")
        cardList.append(cardDTO)
        
        cardDTO = CardDTO(id: 10, name: "ghost")
        cardList.append(cardDTO)
        
        completion(cardList)
        
    }
}
