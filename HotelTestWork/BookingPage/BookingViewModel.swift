import SwiftUI

//-MARK: - Protocol
protocol BookingViewModelProtocol {
    associatedtype Body: View
    var bookingView: Body { get }
}

//-MARK: - Model
class BookingViewModel {
    private let bookingModel: some BookingModelProtocol = BookingModel()
}

//-MARK: - Extension Model
extension BookingViewModel: BookingViewModelProtocol {
    var bookingView: some View {
        setBookingView()
    }
    
    //-MARK: - Private func for set values
    @ViewBuilder private func setBookingView() -> some View {
        ScrollView {
            VStack {
                Text("Booking")
                Text("Купи номер, ну пжлст...")
            }
        }
    }
}
