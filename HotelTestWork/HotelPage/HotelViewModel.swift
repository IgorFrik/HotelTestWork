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
                Text(hotelModel.name)
                TabView(content: {
                    AsyncImage(url: URL(string: "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 500, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    AsyncImage(url: URL(string: "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 500, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    AsyncImage(url: URL(string: "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 500, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                )
                .frame(height: 200)
                .tabViewStyle(PageTabViewStyle())
            }
        }
    }
}
