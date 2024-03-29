import Foundation
class Thought: Codable {
    var listOfOccurrences = [Date]()
    var formattedOccurrences = [DateCount]()
    let title: String
    var todaysCount: Int {
        get {
            var count = 0
            for date in self.listOfOccurrences {
                if Calendar.current.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
                    count += 1
                }
            }
            return count
        }
    }
    init(date: Date, title: String) {
        self.title = title
        self.formattedOccurrences.append(contentsOf: getFormattedOccurrences())
    }
    func getFormattedOccurrences() -> [DateCount] {
        var datesBetweenArray = [Date]()
        let sortedOccurrences = self.listOfOccurrences.sorted(by: { $0.compare($1) == .orderedAscending })
        if let firstDate = sortedOccurrences.first {
            datesBetweenArray = Date().generateDatesArrayBetweenTwoDates(startDate: firstDate , endDate: Date())
        }
        let dateCountsBetween = datesBetweenArray.reduce(into: [String: Int]()) { dict, date in
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            let key = formatter.string(from: date)
            dict[key, default: 0] = 0
        }
        let dateCountsOccurrences = self.listOfOccurrences.reduce(into: [String: Int]()) { dict, date in
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            let key = formatter.string(from: date)
            dict[key, default: 0] += 1
        }
        var emptyDateCountArray = [DateCount]()
        for (date, count) in dateCountsBetween {
            let dateCountStruct = DateCount(dateString: date, count: count)
            emptyDateCountArray.append(dateCountStruct)
        }
        var actualDateCountsArray = [DateCount]()
        for (date, count) in dateCountsOccurrences {
            let dateCountStruct = DateCount(dateString: date, count: count)
            actualDateCountsArray.append(dateCountStruct)
        }
        actualDateCountsArray.append(contentsOf: emptyDateCountArray)
        actualDateCountsArray.sort(by: { $0.date > $1.date })
        return actualDateCountsArray
    }
}
