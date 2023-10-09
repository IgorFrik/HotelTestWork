import SwiftUI

//-MARK: - Protocol
protocol HotelModelProtocol {
    var model: HotelJson { get }
}

//-MARK: - Model
class HotelModel {
    private let hotelNetWork: HotelNetWorkProtocol = HotelNetWork()
    
    private func setModel() -> HotelJson {
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
