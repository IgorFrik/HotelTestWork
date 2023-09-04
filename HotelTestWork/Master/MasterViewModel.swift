import SwiftUI

//-MARK: - Protocol
protocol MasterViewModelProtocol: AnyObject {
    associatedtype Body: View
    var masterView: Body { get }
}

//-MARK: - Model
class MasterViewModel {
    private let masterModel: MasterModelProtocol = MasterModel()
    private let hotelViewModel: some HotelViewModelProtocol = HotelViewModel()
    private let roomViewModel: some RoomViewModelProtocol = RoomViewModel()
    private let bookingViewModel: some BookingViewModelProtocol = BookingViewModel()
}

//-MARK: - Extension Model
extension MasterViewModel: MasterViewModelProtocol {
    var masterView: some View {
        setMasterView()
    }
    
    
    //-MARK: - Private func for set values
    private func setMasterView() -> some View {
        NavigationView {
            hotelViewModel.hotelView
        }
    }
}
