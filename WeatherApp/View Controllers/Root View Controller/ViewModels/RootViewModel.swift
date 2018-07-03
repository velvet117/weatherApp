//
//  RootViewModel.swift
//  WeatherApp
//
//  Created by Anastasia Blodgett on 7/3/18.
//  Copyright © 2018 Prime17. All rights reserved.
//

import Foundation

class RootViewModel {

  typealias DidFetchWeatherData = (Data?, Error?) -> Void

  var didFetchWeatherData: DidFetchWeatherData?

  init() {
    fetchWeatherData()
  }

  private func fetchWeatherData() {

    let weatherRequest = WeatherRequest(baseUrl: WeatherService.authenticatedBaseUrl, location: Defaults.location)

    URLSession.shared.dataTask(with: weatherRequest.url) { [weak self] (data, response, error) in
      if let error = error {
        self?.didFetchWeatherData?(nil, error)
      }
      else if let data = data {
        self?.didFetchWeatherData?(data, nil)
      }
      else {
        self?.didFetchWeatherData?(nil, nil)
      }
      }.resume()
  }
}
