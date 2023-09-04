//
//  HotelTestWorkApp.swift
//  HotelTestWork
//
//  Created by Игорь Фрик on 04.09.2023.
//

import SwiftUI

@main
struct HotelTestWorkApp: App {
    var body: some Scene {
        WindowGroup {
            MasterView(viewModel: MasterViewModel())
        }
    }
}
