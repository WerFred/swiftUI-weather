//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Illia Pospielov on 08.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(
                    iconName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 70)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 79)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 65)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 72)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.bolt.fill",
                                   temperature: 69)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            isNight ? .black : .blue,
            isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var iconName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .bold))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}
