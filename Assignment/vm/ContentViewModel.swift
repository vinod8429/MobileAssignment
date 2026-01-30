//
//  ContentViewModel.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation

@MainActor
class ContentViewModel : ObservableObject {
    
    private let apiService = ApiService()
    @Published var navigateDetail: DeviceData? = nil
    @Published var data: [DeviceData]? = []

    func fetchAPI() {
        print("API CALL") //for de-bugging
        apiService.fetchDeviceDetails(completion: { item in
            self.data = item
        })
        print("API Call done") //for de-bugging
    }
    
    func navigateToDetail(navigateDetail: DeviceData) {
        self.navigateDetail = navigateDetail
    }
}
