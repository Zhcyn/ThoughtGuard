import Foundation
extension Date{
    func generateDatesArrayBetweenTwoDates(startDate: Date, endDate: Date) -> [Date] {
        var datesArray = [Date]()
        guard var startDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate) else { return  datesArray}
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        while startDate <= endDate {
            datesArray.append(startDate)
            guard let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: startDate) else { return datesArray }
            startDate = tomorrow
        }
        return datesArray
    }
}
