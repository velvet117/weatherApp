//
//  RootViewController.swift
//  WeatherApp
//
//  Created by Anastasia Blodgett on 6/11/18.
//  Copyright © 2018 Prime17. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {

  //MARK: - Properties

  var viewModel: RootViewModel? {
    didSet {
      guard let viewModel = viewModel else {
        return
      }

      setupViewModel(with: viewModel)
    }

  }

  private let dayViewController: DayViewController = {

    guard let dayViewController = UIStoryboard.main.instantiateViewController(withIdentifier: DayViewController.storyboardIdentifier) as? DayViewController else {
      fatalError("Unable to instantiate Day View Controller")
    }

    //Configure Day View Controller
    dayViewController.view.translatesAutoresizingMaskIntoConstraints = false

    return dayViewController
  }()

  private let weekViewController: WeekViewController = {

    guard let weekViewController = UIStoryboard.main.instantiateViewController(withIdentifier: WeekViewController.storyboardIdentifier) as? WeekViewController else {
      fatalError("Unable to instantiate Week View Controller")
    }

    //Configure Day View Controller
    weekViewController.view.translatesAutoresizingMaskIntoConstraints = false

    return weekViewController
  }()


  //MARK: - View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    //Setup Child View Controllers
    setupChildViewControllers()

    print(viewModel ?? "No View Model Injected")
  }

  //MARK: - Helper Methods

  private func setupChildViewControllers() {
    addChildViewController(dayViewController)
    addChildViewController(weekViewController)

    view.addSubview(dayViewController.view)
    view.addSubview(weekViewController.view)

    // Configure Day View
    dayViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    dayViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    dayViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    dayViewController.view.heightAnchor.constraint(equalToConstant: Layout.DayView.height).isActive = true

    // Configure Week View
    weekViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor).isActive = true
    weekViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    weekViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    weekViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    // Notify Child View Controller
    dayViewController.didMove(toParentViewController: self)
    weekViewController.didMove(toParentViewController: self)
  }

  private func setupViewModel(with viewModel: RootViewModel) {
    viewModel.didFetchWeatherData = { (data, error) in
      if let error = error {
        print("Unable to fetch weather data \(error)")
      }
      else if let data = data {
        print(data)
      }
    }
  }
}

extension RootViewController {

  fileprivate enum Layout {
    enum DayView {
      static let height: CGFloat = 200.0
    }
  }

}

