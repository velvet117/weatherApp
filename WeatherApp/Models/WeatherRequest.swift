//
//  WeatherRequest.swift
//  WeatherApp
//
//  Created by Anastasia Blodgett on 6/19/18.
//  Copyright © 2018 Prime17. All rights reserved.
//

import Foundation
import CoreLocation

struct WeatherRequest {

    // MARK: - Properties

    let baseUrl: URL

    let location: CLLocation

    private var latitude: Double {
        return location.coordinate.latitude
    }

    private var longitude: Double {
        return location.coordinate.longitude
    }

    var url: URL {
        return baseUrl.appendingPathComponent("\(latitude),\(longitude)")
    }
}
