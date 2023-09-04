import SwiftUI

//-MARK: - Protocol
protocol RoomViewModelProtocol {
    associatedtype Body: View
    var roomView: Body { get }
}

//-MARK: - Model
class RoomViewModel {
    private let roomModel: some RoomModelProtocol = RoomModel()
}

//-MARK: - Extension Model
extension RoomViewModel: RoomViewModelProtocol {
    var roomView: some View {
        setRoomView()
    }
    
    //-MARK: - Private func for set values
    @ViewBuilder private func setRoomView() -> some View {
        ScrollView {
            VStack {
                Text("НОМЕРА!!!!")
                Text("Только сегодня!!!!")
                Text("Солько у нас!!!!!")
                Text("Еще ничего не куплено!!!!!")
            }
        }
    }
}
