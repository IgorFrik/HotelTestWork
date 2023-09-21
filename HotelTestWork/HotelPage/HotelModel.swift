import SwiftUI

//-MARK: - Protocol
protocol HotelModelProtocol {
    var model: HotelJson { get }
}

//-MARK: - Model
class HotelModel {
    private let hotelNetWork: HotelNetWorkProtocol = HotelNetWork()
    
    private func setModel() -> HotelJson {
//        var result: HotelJson?
//        Task {
//            do {
//                result = try await hotelNetWork.netWork()
//            }
//        }
//        return result!
        return UnsafeTask {
            await self.hotelNetWork.netWork()
        }.get()
    }
}


//-MARK: - Extension Model
extension HotelModel: HotelModelProtocol {
    var model: HotelJson {
      setModel()
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
