//
//  DayViewController.swift
//  WeatherApp
//
//  Created by Anastasia Blodgett on 6/11/18.
//  Copyright © 2018 Prime17. All rights reserved.
//

import UIKit

final class DayViewController: UIViewController {

    //MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    //MARK: - Helper Methods

    private func setupView() {
        view.backgroundColor = .green
    }

}
