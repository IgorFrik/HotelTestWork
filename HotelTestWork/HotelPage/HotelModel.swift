import SwiftUI

//-MARK: - Protocol
protocol HotelModelProtocol {
    var name: String { get }
}

//-MARK: - Model
class HotelModel {
    
}

//-MARK: - Extension Model
extension HotelModel: HotelModelProtocol {
    var name: String {
        "Some HotelModel name"
    }
    
    //-MARK: - Private func for set values
}
