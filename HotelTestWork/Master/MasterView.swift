import SwiftUI
import CoreData

struct MasterView: View {
    
    let viewModel: MasterViewModel
    
    var body: some View {
        viewModel.masterView
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(viewModel: MasterViewModel())
    }
}
