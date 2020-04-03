import Foundation
import Alamofire

class AlamofireWrapper {
    
    static func get(
        url: String,
        headers: [String:String],
        success:@escaping ([String:Any]) -> (),
        failure:@escaping (Any) -> ()) {
        
        Alamofire.request(url, headers: headers ).validate()
            .responseJSON { (response) -> Void in
                print(response)
                if response.result.isSuccess {
                    guard let value = response.result.value as? [String:Any] else {
                        success(["":""])
                        return
                    }
                    success(value)
                } else if response.result.isFailure {
                    guard let error = response.result.error?.localizedDescription else {
                        failure("Error")
                        return
                    }
                    failure(error.description)
                }
        }
    }
}
