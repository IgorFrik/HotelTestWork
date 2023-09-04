import SwiftUI

struct RoomView: View {
    
    let viewModel = RoomViewModel()
    var body: some View {
        viewModel.roomView
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView()
    }
}
