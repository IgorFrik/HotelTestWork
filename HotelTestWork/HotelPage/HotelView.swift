import SwiftUI

struct HotelView: View {
    let viewModel: HotelViewModel
    
    var body: some View {
        viewModel.hotelView
    }
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView(viewModel: HotelViewModel())
    }
}
