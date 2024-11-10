
//
//  ContentView.swift
//  project
//
//  Created by mac on 06.11.2024.
//

import Foundation

class VPNAPI {

    struct VPNResponse: Decodable {
        let success: Bool
        let status: String
    }


    func connect(serverIP: String, completion: @escaping (VPNResponse, Error?) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {

            let response = VPNResponse(success: true, status: "Подключено к \(serverIP)")
            DispatchQueue.main.async {
                completion(response, nil)
            }
        }
    }

    // Метод для имитации отключения от VPN
    func disconnect(completion: @escaping (VPNResponse, Error?) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
           
            let response = VPNResponse(success: false, status: "Отключено")
            DispatchQueue.main.async {
                completion(response, nil)
            }
        }
    }
}
