//
//  CountriesView.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/14/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import SwiftUI

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    return dateFormatter
}()

struct YearsView: View {
    @ObservedObject var interactor: YearsInteractor
    
    var years: [Int] {
        let keys = interactor.timelineCountries.keys
        let sortedKeys = keys.sorted { (l, r) -> Bool in
            return l < r
        }
        return sortedKeys
    }
    
    var body: some View {
        NavigationView {
            List(years, id: \.self) { year in
                NavigationLink.init(String.init(year), destination: ChoiceView(interactor: self.interactor.getChoiceInteractor(for: year)))
                
            }.navigationBarTitle("Years")
        }
    }
    
}
struct MasterView: View {
    @Binding var dates: [Date]
    
    var body: some View {
        List {
            ForEach(dates, id: \.self) { date in
                NavigationLink(
                    destination: DetailView(selectedDate: date)
                ) {
                    Text("\(date, formatter: dateFormatter)")
                }
            }.onDelete { indices in
                indices.forEach { self.dates.remove(at: $0) }
            }
        }
    }
}

struct DetailView: View {
    var selectedDate: Date?
    
    var body: some View {
        Group {
            if selectedDate != nil {
                Text("\(selectedDate!, formatter: dateFormatter)")
            } else {
                Text("Detail view content goes here")
            }
        }.navigationBarTitle(Text("Detail"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        YearsView(interactor: YearsInteractor.init())
    }
}
