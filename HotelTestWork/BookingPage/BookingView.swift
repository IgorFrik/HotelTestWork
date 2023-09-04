import SwiftUI

struct BookingView: View {
    
    let viewModel = BookingViewModel()
    var body: some View {
        viewModel.bookingView
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
