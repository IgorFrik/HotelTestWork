import Foundation

//-MARK: - Protocol
protocol HotelNetWorkProtocol {
    func netWork(completion: @escaping (HotelJson) -> ())
}

//-MARK: - Model
class HotelNetWork {
    private let url = "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
    
    private func showSuccess() {
        print("showSuccess")
    }
    
    private func showFailure() {
        print("showFailure")
    }
}

//-MARK: - Extension Model
extension HotelNetWork: HotelNetWorkProtocol {
    func netWork(completion: @escaping (HotelJson) -> ()) {
        let url = URL(string: self.url)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                self.showFailure()
            }
            guard let data = data else {
                fatalError("Error: missing response data")
            }
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(HotelJson.self, from: data)
                completion(responseModel)
            } catch {
                self.showFailure()
            }
            self.showSuccess()
        }.resume()
    }
}
