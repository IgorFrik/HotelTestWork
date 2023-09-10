import SwiftUI

//-MARK: - Protocol
protocol HotelModelProtocol {
    var model: HotelJson? { get }
}

//-MARK: - Model
class HotelModel {
    private let hotelNetWork: HotelNetWorkProtocol = HotelNetWork()
    private var privateModel: HotelJson? = nil
    
    private func setModel() {
        hotelNetWork.netWork { data in
            self.privateModel = data
        }
    }
    
    init() {
        setModel()
    }
}

//-MARK: - Extension Model
extension HotelModel: HotelModelProtocol {
    var model: HotelJson? {
        privateModel
    }
}
