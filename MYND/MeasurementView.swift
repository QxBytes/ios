//
//  ContentView.swift
//  MYND
//
//  Created by Simin Mahaleh on 3/21/23.
//
import SwiftUI
import HealthKit

struct MeasurementView: View {
    @State private var isMoodLoggingViewPresented: Bool = false
    @State private var moodData: [CGFloat] = [0.3, 0.4, 0.7, 0.6, 0.8, 0.5]
    @State private var moodValue: Double = 50
    @State private var showColorSlider: Bool = false
    
    @State private var dataPoints: [DataPoint] = [
        DataPoint(name: "Self-reported Mood", value: 0.7, weight: 0.3, color: Color.yellow),
        DataPoint(name: "Physical Activity", value: 0.7, weight: 0.2, color: Color.red),
        DataPoint(name: "Sleep Quality", value: 0.75, weight: 0.15, color: Color.blue),
        DataPoint(name: "Heart Rate Variability", value: 0.6, weight: 0.1, color: Color.orange),
        DataPoint(name: "Social Interaction", value: 0.8, weight: 0.1, color: Color.purple),
        DataPoint(name: "Screen Time", value: 0.4, weight: 0.05, color: Color.green),
        DataPoint(name: "Activity Space", value: 0.6, weight: 0.1, color: Color.pink),
    ]
    
    private func calculateMentalHealthIndex() -> Double {
        let weightedValues = dataPoints.map { max(min($0.value, 1.0), 0.0) * $0.weight }
        let totalWeight = dataPoints.map { $0.weight }.reduce(0, +)
        let index = weightedValues.reduce(0, +) / totalWeight
        return max(min(index * 100, 100.0), 0.0)
    }
    
    init() {
        updateSelfReportedMood(value: CGFloat(moodValue))
    }
    
    func logMood() {
        moodData.append(CGFloat(moodValue / 100))
        updateSelfReportedMood(value: CGFloat(moodValue))
        isMoodLoggingViewPresented = false
    }

    func updateSelfReportedMood(value: CGFloat) {
        if let index = dataPoints.firstIndex(where: { $0.name == "Self-reported Mood" }) {
            dataPoints[index].value = max(min(value, 1.0), 0.0)
            let updatedIndex = calculateMentalHealthIndex()
            dataPoints[index].value = updatedIndex / 100.0
        }
    }



    

    
    
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 8) {
                    Text("Hello, User! You are doing great.")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .padding(.bottom, 16)
                    
                    MentalHealthIndex(mentalHealthScore: calculateMentalHealthIndex())
                        .padding(.bottom, 16)
                    
                    Button(action: {
                        isMoodLoggingViewPresented = true
                    }) {
                        Text("Mood Log")
                            .foregroundColor(.yellow)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(16)
                    }
                    .sheet(isPresented: $isMoodLoggingViewPresented) {
                        VStack{
                            ColorSlider(value: $moodValue)
                                .frame(height: 30)
                            Button(action: {
                                logMood()
                                isMoodLoggingViewPresented = false
                            }) {
                                Text("Log Mood")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding()
                        
                        
                        
                        MoodLoggingView(moodData: $moodData)
                    }
                    
                //    MoodDataPoint()
                  //      .padding(.bottom, 16)
                    
                    dataPointsGrid(dataPoints: dataPoints)
                }
                .padding()
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                .edgesIgnoringSafeArea(.bottom)
            }
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        }
        
    }
}

struct DataPointView: View {
    let dataPoint: DataPoint
    
    var body: some View {
        VStack {
            Text(dataPoint.name)
                .font(.system(size: 16, weight: .bold, design: .default))
                .foregroundColor(dataPoint.color)
            
            Text("\(dataPoint.value * 100, specifier: "%.2f")")
                .font(.system(size: 24, weight: .bold, design: .default))
                .foregroundColor(dataPoint.color)
        }
        .frame(width: UIScreen.main.bounds.width / 2 - 24, height: UIScreen.main.bounds.width / 2 - 24)
        .background(Color.white)
        .cornerRadius(16)
    }
}

struct DataPoint: Identifiable {
    let id = UUID()
    var title = ""
    let name: String
    var value: CGFloat
    let weight: Double
    let color: Color
}

struct MentalHealthIndex: View {
    var mentalHealthScore: Double

    var body: some View {
        VStack {
            Text("Mental Health Index")
                .font(.system(size: 24, weight: .bold, design: .default))

            Text("\(mentalHealthScore, specifier: "%.2f")")
                .font(.system(size: 32, weight: .bold, design: .default))

            ZStack {                LinearGradient(gradient: Gradient(colors: [Color.red, Color.green]), startPoint: .leading, endPoint: .trailing)
                    .frame(height: 10)
                    .cornerRadius(5)
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.black)
                    .frame(width: 4, height: 20)
                    .offset(x: CGFloat(mentalHealthScore - 50) / 50 * UIScreen.main.bounds.width / 2)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
    }
}

struct LineChart: View {
    let data: [CGFloat]
    let lineColor: Color
    let fillColor: Color

    var body: some View {
        GeometryReader { geometry in
            let frame = geometry.frame(in: .local)
            let maxValue = data.max() ?? 1
            let minValue = data.min() ?? 0
            let stepX = frame.width / CGFloat(data.count - 1)
            let stepY = frame.height / (maxValue - minValue)

            Path { path in
                path.move(to: CGPoint(x: 0, y: frame.height - (data[0] - minValue) * stepY))
                for index in 1..<data.count {
                    path.addLine(to: CGPoint(x: CGFloat(index) * stepX, y: frame.height - (data[index] - minValue) * stepY))
                }
            }
            .stroke(lineColor, lineWidth: 2)

            Path { path in
                path.move(to: CGPoint(x: 0, y: frame.height))
                path.addLine(to: CGPoint(x: 0, y: frame.height - (data[0] - minValue) * stepY))
                for index in 1..<data.count {
                    path.addLine(to: CGPoint(x: CGFloat(index) * stepX, y: frame.height - (data[index] - minValue) * stepY))
                }
                path.addLine(to: CGPoint(x: frame.width, y: frame.height))
                path.closeSubpath()
            }
            .fill(fillColor)
        }
    }
}

//struct MoodDataPoint: View {
    
//    let moodValues: [CGFloat] = [0.6, 0.5, 0.7, 0.8, 0.6, 0.7, 0.9]

//    var body: some View {
//        VStack {
//            Text("Mood")
 //               .font(.system(size: 24, weight: .bold, design: .default))

 //           GeometryReader { geometry in
 //               LineChart(
 //                   data: moodValues,
 //                   lineColor: Color.yellow,
 //                   fillColor: Color.yellow.opacity(0.5)
 //               )
 //               .frame(height: 150)
 //               .padding(.horizontal, 16)
 //           }
 //       }
 //       .padding()
 //       .background(Color.white)
 //       .cornerRadius(16)
 //   }
//}



struct dataPointsGrid: View {
    let dataPoints: [DataPoint]

    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(dataPoints) { dataPoint in
                DataPointView(dataPoint: dataPoint)
            }
        }
    }
}









class HealthKitManager: ObservableObject {
    private let healthStore = HKHealthStore()

    func startUpdatingData(every interval: TimeInterval, completion: @escaping ([DataPoint]) -> Void) {
        requestPermissions { success in
            guard success else { return }
            
            Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                self.fetchActiveEnergyBurned { activeEnergyBurned in
                    self.fetchSleepQuality { sleepQuality in
                        self.fetchHeartRateVariability { heartRateVariability in
                            // Create new data points and call the completion handler.
                            let newDataPoints: [DataPoint] = [
                                DataPoint(name: "Physical Activity", value: activeEnergyBurned, weight: 0.2, color: Color.red),
                                DataPoint(name: "Sleep Quality", value: sleepQuality, weight: 0.15, color: Color.blue),
                                DataPoint(name: "Heart Rate Variability", value: heartRateVariability, weight: 0.1, color: Color.orange)
                            ]
                            DispatchQueue.main.async {
                                completion(newDataPoints)
                            }
                        }
                    }
                }
            }
        }
    }



    func requestPermissions(completion: @escaping (Bool) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false)
            return
        }

        let dataTypes: Set<HKSampleType> = [
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
            HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
        ]

        healthStore.requestAuthorization(toShare: nil, read: dataTypes) { (success, error) in
            completion(success)
        }
    }

    func fetchActiveEnergyBurned(completion: @escaping (Double) -> Void) {
            let sampleType = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!
            let predicate = HKQuery.predicateForSamples(withStart: Date().addingTimeInterval(-86400), end: Date(), options: [])
            
            let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (_, results, error) in
                guard let samples = results as? [HKQuantitySample] else {
                    completion(0)
                    return
                }
                
                let totalEnergyBurned = samples.reduce(0) { (sum, sample) -> Double in
                    return sum + sample.quantity.doubleValue(for: HKUnit.kilocalorie())
                }
                
                completion(totalEnergyBurned)
            }
            
            healthStore.execute(query)
        }

    func fetchSleepQuality(completion: @escaping (Double) -> Void) {
           let sampleType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
           let predicate = HKQuery.predicateForSamples(withStart: Date().addingTimeInterval(-86400), end: Date(), options: [])
           
           let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (_, results, error) in
               guard let samples = results as? [HKCategorySample] else {
                   completion(0)
                   return
               }
               
               let sleepQuality = samples.reduce(0) { (sum, sample) -> Double in
                   let value = sample.value == HKCategoryValueSleepAnalysis.inBed.rawValue ? 1.0 : 0.0
                   return sum + value
               }
               
               completion(sleepQuality / Double(samples.count))
           }
           
           healthStore.execute(query)
       }


    func fetchHeartRateVariability(completion: @escaping (Double) -> Void) {
           let sampleType = HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!
           let predicate = HKQuery.predicateForSamples(withStart: Date().addingTimeInterval(-86400), end: Date(), options: [])
           
        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (_, results, error) in
                  guard let samples = results as? [HKQuantitySample] else {
                      completion(0)
                      return
                  }
                  
                  let totalHRV = samples.reduce(0) { (sum, sample) -> Double in
                      return sum + sample.quantity.doubleValue(for: HKUnit.secondUnit(with: .milli))
                  }
                  
                  completion(totalHRV / Double(samples.count))
              }
              
              healthStore.execute(query)
          }
}




struct MeasurementView_Preview: PreviewProvider {
    static var previews: some View {
        MeasurementView()
    }
}

