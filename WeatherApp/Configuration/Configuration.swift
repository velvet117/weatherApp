//
//  Configuration.swift
//  WeatherApp
//
//  Created by Anastasia Blodgett on 6/19/18.
//  Copyright © 2018 Prime17. All rights reserved.
//

import Foundation
import CoreLocation

enum Defaults {

    static let location = CLLocation(latitude: 37.8267, longitude: -122.4233)

}

enum WeatherService {

    private static let apiKey = "a200665c2a695d1ca9c65db03b12c07b"
    private static let baseUrl = URL(string: "https://api.darksky.net/forecast/")!

    static var authenticatedBaseUrl: URL {
        return baseUrl.appendingPathComponent(apiKey)
    }
}
