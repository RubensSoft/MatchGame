import Foundation

protocol CheckMatchUseCase {
    func execute(firsCard: Card,
                 secondCard: Card,
                 completion: @escaping (Bool)->(),
                 failure: @escaping (String)->())
}

class CheckMatchUseCaseImplementation : CheckMatchUseCase {
    func execute(firsCard: Card, secondCard: Card,
                 completion: @escaping (Bool) -> (),
                 failure: @escaping (String) -> ()) {
        if firsCard.id == secondCard.id {
            completion(true)
        } else {
            completion(false)
        }
    }
}
