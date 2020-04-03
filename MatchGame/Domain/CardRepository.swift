import Foundation

protocol CardRepository {
    func getCards(completion: @escaping ([Card])->(), failure: @escaping (String)->())
}
