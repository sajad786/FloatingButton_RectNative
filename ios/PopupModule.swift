//
//  PopupModule.swift
//  FloatingViewProject
//
//  Created by Dr.mac on 30/01/25.
//

//
//  PopupModule.swift
//  FloatingViewProject
//
//  Created by Dr.mac on 30/01/25.
//

import Foundation
import UIKit
import React

@objc(PopupModule)
class PopupModule: NSObject {
  
  private var popupView: UIView?
  
  @objc
  func showPopup(_ data: NSDictionary) {
    DispatchQueue.main.async {
      // Log received data
      print("Received Data from React Native: \(data)")

      // Extract data from the dictionary
      let deliveryTag = data["deliveryTag"] as? String ?? "Delivery"
      let deliveryFee = data["deliveryFee"] as? String ?? "$5"
      let pickupLocation = data["pickupLocation"] as? String ?? "Pickup Location"
      let dropoffLocation = data["dropoffLocation"] as? String ?? "Dropoff Location"
      let estimatedTime = data["estimatedTime"] as? String ?? "5 min (1.75km)"
      
      // Create popup background view
      let popupBackgroundView = UIView(frame: UIScreen.main.bounds)
      popupBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
      self.popupView = popupBackgroundView
      
      let cardView = UIView()
      cardView.translatesAutoresizingMaskIntoConstraints = false
      cardView.backgroundColor = .white
      cardView.layer.cornerRadius = 10
      popupBackgroundView.addSubview(cardView)
      
      // Add constraints for cardView
      NSLayoutConstraint.activate([
        cardView.centerXAnchor.constraint(equalTo: popupBackgroundView.centerXAnchor),
        cardView.centerYAnchor.constraint(equalTo: popupBackgroundView.centerYAnchor),
        cardView.widthAnchor.constraint(equalToConstant: 335),
        cardView.heightAnchor.constraint(greaterThanOrEqualToConstant: 400)
      ])
      
      // Delivery Tag Label
      let deliveryTagLabel = UILabel()
      deliveryTagLabel.text = deliveryTag
      deliveryTagLabel.textAlignment = .center
      deliveryTagLabel.font = UIFont.boldSystemFont(ofSize: 16)
      deliveryTagLabel.backgroundColor = .red
      deliveryTagLabel.textColor = .white
      deliveryTagLabel.translatesAutoresizingMaskIntoConstraints = false
      cardView.addSubview(deliveryTagLabel)
      
      NSLayoutConstraint.activate([
        deliveryTagLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
        deliveryTagLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
        deliveryTagLabel.widthAnchor.constraint(equalToConstant: 200),
        deliveryTagLabel.heightAnchor.constraint(equalToConstant: 40)
      ])
      
      // Pickup Location Label
      let pickupLabel = UILabel()
      pickupLabel.text = "Pickup: \(pickupLocation)"
      pickupLabel.translatesAutoresizingMaskIntoConstraints = false
      cardView.addSubview(pickupLabel)
      
      NSLayoutConstraint.activate([
        pickupLabel.topAnchor.constraint(equalTo: deliveryTagLabel.bottomAnchor, constant: 16),
        pickupLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
        pickupLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16)
      ])
      
      // Dropoff Location Label
      let dropoffLabel = UILabel()
      dropoffLabel.text = "Dropoff: \(dropoffLocation)"
      dropoffLabel.translatesAutoresizingMaskIntoConstraints = false
      cardView.addSubview(dropoffLabel)
      
      NSLayoutConstraint.activate([
        dropoffLabel.topAnchor.constraint(equalTo: pickupLabel.bottomAnchor, constant: 8),
        dropoffLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
        dropoffLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16)
      ])
      
      // Estimated Time Label
      let estimatedTimeLabel = UILabel()
      estimatedTimeLabel.text = "ETA: \(estimatedTime)"
      estimatedTimeLabel.translatesAutoresizingMaskIntoConstraints = false
      cardView.addSubview(estimatedTimeLabel)
      
      NSLayoutConstraint.activate([
        estimatedTimeLabel.topAnchor.constraint(equalTo: dropoffLabel.bottomAnchor, constant: 8),
        estimatedTimeLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
        estimatedTimeLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16)
      ])
      
      // Close Button
      let closeButton = UIButton(type: .system)
      closeButton.setTitle("Close", for: .normal)
      closeButton.addTarget(self, action: #selector(self.hidePopup), for: .touchUpInside)
      closeButton.translatesAutoresizingMaskIntoConstraints = false
      cardView.addSubview(closeButton)
      
      NSLayoutConstraint.activate([
        closeButton.topAnchor.constraint(equalTo: estimatedTimeLabel.bottomAnchor, constant: 16),
        closeButton.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
        closeButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
      ])
      
      // Display popup
      if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
        keyWindow.addSubview(popupBackgroundView)
      }
    }
  }
  
  @objc
  func hidePopup() {
    DispatchQueue.main.async {
      self.popupView?.removeFromSuperview()
      self.popupView = nil
      print("Popup dismissed")
    }
  }
}

