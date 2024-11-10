//
//  VPNView.swift
//  project
//
//  Created by mac on 10.11.2024.
//

import SwiftUI
import Combine

struct VPNView: View {
    @State private var vpnServerIP: String = readSettings();
    @State private var isConnected: Bool = false
    @State private var connectionError: String = ""
    @State private var connectionStatus: String = ""

    private var api = VPNAPI()

    var body: some View {
        VStack {
            TextField("IP-адрес VPN-сервера", text: $vpnServerIP)
                .padding()
                .border(Color.gray)

            Button(action: {
                if isConnected {
                    disconnectVPN()
                } else {
                    connectVPN()
                }
            }) {
                Text(isConnected ? "Отключиться" : "Подключиться")
                    .padding()
                    .background(isConnected ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Text(connectionStatus)
                .padding()
                .font(.headline)

            if !connectionError.isEmpty {
                Text("Ошибка: \(connectionError)")
                    .padding()
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
    func connectVPN() {
        api.connect(serverIP: vpnServerIP) { response, error in
            if let error = error {
                connectionError = error.localizedDescription
            } else {
                isConnected = response.success
                connectionStatus = response.status
		writeSettings(serverIP)
            }
        }
    }

    func disconnectVPN() {
        api.disconnect { response, error in
            if let error = error {
                connectionError = error.localizedDescription
            } else {
                isConnected = response.success
                connectionStatus = response.status
            }
        }
    }
}
