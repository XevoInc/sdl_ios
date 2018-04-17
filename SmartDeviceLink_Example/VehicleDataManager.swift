//
//  VehicleDataManager.swift
//  SmartDeviceLink
//
//  Created by Nicole on 4/13/18.
//  Copyright © 2018 smartdevicelink. All rights reserved.
//

import Foundation
import SmartDeviceLink
import SmartDeviceLinkSwift

class VehicleDataManager: NSObject {
    fileprivate let sdlManager: SDLManager!
    fileprivate var refreshUIHandler: refreshUIHandler?
    public fileprivate(set) var vehicleOdometerData: String

    /// Custom init
    ///
    /// - Parameters:
    ///   - sdlManager: The SDL Manager
    ///   - refreshOdometerHandler: handler for refreshing the UI with new odometer data
    init(sdlManager: SDLManager, refreshUIHandler: refreshUIHandler? = nil) {
        self.sdlManager = sdlManager
        self.refreshUIHandler = refreshUIHandler
        self.vehicleOdometerData = ""
        super.init()

        resetOdometer()
        NotificationCenter.default.addObserver(self, selector: #selector(vehicleDataNotification(_:)), name: .SDLDidReceiveVehicleData, object: nil)
    }

    func stop() {
        resetOdometer()
    }
}

// MARK: - Subscribe Vehicle Data

extension VehicleDataManager {
    /// Subscribes to odometer data. You must subscribe to notification with name `SDLDidReceiveVehicleData` to get the new data when the odometer data changes.
    func subscribeToVehicleOdometer() {
        let subscribeToVehicleOdometer = SDLSubscribeVehicleData()
        subscribeToVehicleOdometer.odometer = true
        sdlManager.send(request: subscribeToVehicleOdometer) { [unowned self] (request, response, error) in
            guard let result = response?.resultCode else { return }

            switch result {
            case .success:
                SDLLog.d("Subscribed to vehicle odometer data")
                self.vehicleOdometerData += "Subscribed"
            case .disallowed:
                SDLLog.d("SubAccess to vehicle data disallowed")
                self.vehicleOdometerData += "Disallowed"
            case .userDisallowed:
                SDLLog.d("Vehicle user disabled access to vehicle data")
                self.vehicleOdometerData += "Disabled"
            case .ignored:
                SDLLog.d("Already subscribed to odometer data")
                self.vehicleOdometerData += "Subscribed"
            case .dataNotAvailable:
                SDLLog.d("You have permission to access to vehicle data, but the vehicle you are connected to did not provide any data")
                self.vehicleOdometerData += "Unknown"
            default:
                SDLLog.d("Unknown reason for failure to get vehicle data: \(error != nil ? error!.localizedDescription : "no error message")")
                self.vehicleOdometerData += "Unsubscribed"
                return
            }

            guard let handler = self.refreshUIHandler else { return }
            handler()
        }
    }

    /// Unsubscribes to odometer data.
    func unsubscribeToVehicleOdometer() {
        let unsubscribeToVehicleOdometer = SDLUnsubscribeVehicleData()
        unsubscribeToVehicleOdometer.odometer = true
        sdlManager.send(unsubscribeToVehicleOdometer)
    }

    /// Notification with the updated vehicle data
    ///
    /// - Parameter notification: SDLOnVehicleData notification
    func vehicleDataNotification(_ notification: SDLRPCNotificationNotification) {
        guard let handler = refreshUIHandler, let onVehicleData = notification.notification as? SDLOnVehicleData, let odometer = onVehicleData.odometer else {
            return
        }

        vehicleOdometerData = "Odometer: \(odometer) km"
        handler()
    }

    fileprivate func resetOdometer() {
        vehicleOdometerData = "Odometer: Unsubscribed"
    }
}


// MARK: - Get Vehicle Data

extension VehicleDataManager {
    /// Retreives the current vehicle speed
    ///
    /// - Parameter manager: The SDL manager
    class func getVehicleSpeed(with manager: SDLManager) {
        guard manager.permissionManager.isRPCAllowed("GetVehicleData") else {
            let warningAlert = AlertManager.alertWithMessageAndCloseButton("This app does not have the required permissions to access vehicle data")
            manager.send(request: warningAlert)
            return
        }

        let getVehicleSpeed = SDLGetVehicleData()
        getVehicleSpeed.speed = true

        manager.send(request: getVehicleSpeed) { (request, response, error) in
            guard let response = response, error == nil else {
                let alert = AlertManager.alertWithMessageAndCloseButton("Something went wrong while getting vehicle speed")
                manager.send(request: alert)
                return
            }

            var alertMessage = "Speed: "
            switch response.resultCode {
            case .rejected:
                SDLLog.d("The request for vehicle speed was rejected")
                alertMessage += "Rejected"
            case .disallowed:
                SDLLog.d("This app does not have the required permissions to access vehicle data.")
                alertMessage += "Denied"
            case .success:
                if let vehicleData = response as? SDLGetVehicleDataResponse, let speed = vehicleData.speed {
                    SDLLog.d("Request for vehicle speed successful: \(speed)")
                    alertMessage += "\(speed) kph"
                } else {
                    SDLLog.e("Request for vehicle speed successful but no data returned")
                    alertMessage += "Unkown"
                }
            default: break
            }

            let alert = AlertManager.alertWithMessageAndCloseButton(alertMessage)
            manager.send(request: alert)
        }
    }
}
