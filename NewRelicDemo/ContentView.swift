//
//  ContentView.swift
//  NewRelicDemo
//
//  Created by Pavel Kochenda on 24/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 15) {
            Button(action: {
                executeNetworkRequest()
            }) {
                Text("EXECUTE REQUEST")
                    .font(.title)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Button(action: {
                throwException()
            }) {
                Text("THROW EXCEPTION")
                    .font(.title)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .padding([.leading, .trailing], 15)
    }
    
    private func executeNetworkRequest() {
        let url = URL(string: "https://google.com")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { _, _, error in
            switch error {
            case .none:
                print("Request Success")
            case .some:
                print("Request failed")
            }
        }
        .resume()
    }
    
    private func throwException() {
        fatalError("Test Exception")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
