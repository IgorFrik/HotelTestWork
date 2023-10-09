import SwiftUI

//-MARK: - Protocol
protocol HotelViewModelProtocol {
    associatedtype Body: View
    var hotelView: Body { get }
}

//-MARK: - Model
class HotelViewModel {
    private let hotelModel: some HotelModelProtocol = HotelModel()
}

//-MARK: - Extension Model
extension HotelViewModel: HotelViewModelProtocol {
    var hotelView: some View {
        setHotelView()
    }
    
    
    //-MARK: - Private func for set values
    @ViewBuilder private func setHotelView() -> some View {
        ScrollView {
            VStack {
                Text(hotelModel.model.name ?? "Error name")
                TabView(content: {
                    AsyncImage(url: URL(string: hotelModel.model.image_urls?[0] ?? "https://github.com")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 500, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                )
                .frame(height: 200)
                .tabViewStyle(PageTabViewStyle())
                Button("TEST") {
                    print(self.hotelModel.model.name ?? "Error name")
                }
            }
        }
    }
}
