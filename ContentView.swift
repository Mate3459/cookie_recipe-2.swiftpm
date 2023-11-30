import SwiftUI

struct ContentView: View {
    @StateObject var viewmodel = ViewModel()
    var body: some View {
        VStack {
            NavigationView {
                List{
                    ForEach(viewmodel.recipes, id: \.self){
                        Recipes in HStack{
                            Image("")
                                .frame(width: 130, height: 70)
                                .background(Color.gray)
                        }
                    }
                }
                .navigationTitle("Recipes")
                .onAppear {
                    viewmodel.fetch()
                }
            }
        }
    }
}
