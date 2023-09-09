import Foundation

struct About_the_hotel : Decodable {
    let description : String?
    let peculiarities : [String]?

    enum CodingKeys: String, CodingKey {

        case description = "description"
        case peculiarities = "peculiarities"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        peculiarities = try values.decodeIfPresent([String].self, forKey: .peculiarities)
    }

}

struct HotelJson : Decodable {
    let id : Int?
    let name : String?
    let adress : String?
    let minimal_price : Int?
    let price_for_it : String?
    let rating : Int?
    let rating_name : String?
    let image_urls : [String]?
    let about_the_hotel : About_the_hotel?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case adress = "adress"
        case minimal_price = "minimal_price"
        case price_for_it = "price_for_it"
        case rating = "rating"
        case rating_name = "rating_name"
        case image_urls = "image_urls"
        case about_the_hotel = "about_the_hotel"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        adress = try values.decodeIfPresent(String.self, forKey: .adress)
        minimal_price = try values.decodeIfPresent(Int.self, forKey: .minimal_price)
        price_for_it = try values.decodeIfPresent(String.self, forKey: .price_for_it)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        rating_name = try values.decodeIfPresent(String.self, forKey: .rating_name)
        image_urls = try values.decodeIfPresent([String].self, forKey: .image_urls)
        about_the_hotel = try values.decodeIfPresent(About_the_hotel.self, forKey: .about_the_hotel)
    }

}
