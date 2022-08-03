//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Isaac Barros on 02/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Belém, PA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 50)
                
                
                HStack(spacing: 10){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 56)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.and.horizon.fill",
                                   temperature: 45)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.fill",
                                   temperature: 52)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.sun.fill",
                                   temperature: 40)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "wind.snow",
                                   temperature: 38)
                    
                }
                Spacer()
                
                Button{
                    print("tapped");
                    isNight.toggle();
                } label: {
                    WeatherButton(title: "Change day time", textColor: .blue, backgroundColor: .white)
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
    
    var dayOfWeek: String;
    var imageName: String;
    var temperature: Int;
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            VStack (spacing: 8){
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
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool;
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors:[isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String;
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View{
    
    var imageName: String;
    var temperature: Int;
    
    var body: some View{
        VStack (spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}

