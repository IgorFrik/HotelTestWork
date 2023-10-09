import Foundation

//-MARK: - Protocol
protocol HotelNetWorkProtocol {
    func netWork() async -> HotelJson
}

//-MARK: - Model
class HotelNetWork {
    private let url = "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
    
    private func showSuccess() {
        print("HotelNetWorkShowSuccess")
    }
    
    private func showFailure() {
        print("HotelNetWorkShowFailure")
    }
    
    private func netWork(completion: @escaping (HotelJson) -> ()) {
        guard let url = URL(string: self.url) else { return }
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

//-MARK: - Extension Model
extension HotelNetWork: HotelNetWorkProtocol {
    func netWork() async -> HotelJson {
        await withCheckedContinuation { temp in
            netWork { data in
                temp.resume(returning: data)
            }
        }
    }
}

class UnsafeTask<T> {
    let semaphore = DispatchSemaphore(value: 0)
    private var result: T?
    init(block: @escaping () async -> T) {
        Task {
            result = await block()
            semaphore.signal()
        }
    }


    func get() -> T {
        if let result = result { return result }
        semaphore.wait()
        return result!
    }
}
