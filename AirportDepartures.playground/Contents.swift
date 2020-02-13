import UIKit


//: ## 1. Create custom types to represent an Airport Departures display
//: ![Airport Departures](matthew-smith-5934-unsplash.jpg)
//: Look at data from [Departures at JFK Airport in NYC](https://www.airport-jfk.com/departures.php) for reference.
//:
//: a. Use an `enum` type for the FlightStatus (En Route, Scheduled, Canceled, Delayed, etc.)
//:
//: b. Use a struct to represent an `Airport` (Destination or Arrival)
//:
//: c. Use a struct to represent a `Flight`.
//:
//: d. Use a `Date?` for the departure time since it may be canceled.
//:
//: e. Use a `String?` for the Terminal, since it may not be set yet (i.e.: waiting to arrive on time)
//:
//: f. Use a class to represent a `DepartureBoard` with a list of departure flights, and the current airport
enum FlightStatus: String {
    case enroute = "En Route"
    case scheduled = "Scheduled"
    case canceled = "Canceled"
    case delayed = "Delayed"
    case landed = "Landed"
    case departed = "Departed"
    case boarding = "Boarding"
    case onTime = "On Time"
}

struct Airport {
    var destination: String
    
}
struct Flight {
    var flightDestination: String
    var flightCode: String
    var departureTime: Date?
    var terminal: String?
    var flightStatus: FlightStatus
}

class DepartureBoard {
    
    var currentAirport: Airport
    var flights: [Flight]
    
    
    init(currentAirport: Airport, flights: [Flight] ) {
        self.currentAirport = currentAirport
        self.flights = flights
    }
    
}
let myFlight = DepartureBoard(currentAirport: .init(destination: "JFK"), flights: [Flight.init(flightDestination: "New York", flightCode: String(2107), departureTime: .distantPast, terminal: "D01", flightStatus: .boarding)])
var myFlight1 = DepartureBoard(currentAirport: .init(destination: "JFK AIRPORT"), flights: [Flight.init(flightDestination: "Los Angeles", flightCode: String(4547), departureTime: .distantFuture, terminal: "B12" , flightStatus: .onTime)] )
myFlight.flights
myFlight1.flights
var myFlight2 = DepartureBoard(currentAirport: .init(destination: "JFK AIRPORT"), flights: [Flight.init(flightDestination: "San Diego", flightCode: String(780), departureTime: .init(), terminal: "C03", flightStatus: .boarding)])

var myFlight3 = DepartureBoard(currentAirport: .init(destination: "JFK AIRPORT"), flights: [Flight.init(flightDestination: "Houston", flightCode: String(4649), departureTime: .distantFuture, terminal: "E83", flightStatus: .onTime)])

var myFlight4 = DepartureBoard(currentAirport: .init(destination: "JFK AIRPORT"), flights: [Flight.init(flightDestination: "El Paso", flightCode: String(5296), departureTime: .distantFuture, terminal: "E83", flightStatus: .onTime)])

var myFlight5 = DepartureBoard(currentAirport: .init(destination: "JFK AIRPORT"), flights: [Flight.init(flightDestination: "Washington", flightCode: String(6729), departureTime: .init(), terminal: "D09", flightStatus: .boarding)])
var myFlight6 = DepartureBoard(currentAirport: .init(destination: "JFK AIRPORT"), flights: [Flight.init(flightDestination: "Phoenix", flightCode: String(7383), departureTime: .init(), terminal: "E70", flightStatus: .boarding)])
//: ## 2. Create 3 flights and add them to a departure board
//: a. For the departure time, use `Date()` for the current time
//:
//: b. Use the Array `append()` method to add `Flight`'s
//:
//: c. Make one of the flights `.canceled` with a `nil` departure time
//:
//: d. Make one of the flights have a `nil` terminal because it has not been decided yet.
//:
//: e. Stretch: Look at the API for [`DateComponents`](https://developer.apple.com/documentation/foundation/datecomponents?language=objc) for creating a specific time
//let newFlights = DepartureBoard(currentAirport: .init(destination: "JFK"), flights: [Flight.init(flightDestination: "India", flightCode: String(49823), departureTime: nil, terminal: nil, flightStatus: .canceled)])

let newFlight1 = Flight(flightDestination: "India", flightCode: String(43232), departureTime: .init(), terminal: "C9", flightStatus: .boarding)
let newFlight2 = Flight(flightDestination: "Greece", flightCode: String(56532), departureTime: .distantFuture, terminal: "B12", flightStatus: .onTime)
let newFlight3 = Flight(flightDestination: "China", flightCode: String(9832), departureTime: nil, terminal: nil, flightStatus: .canceled)

let addFlights = DepartureBoard(currentAirport: .init(destination: "JFK"), flights: [newFlight1])

addFlights.flights.append(newFlight2)
addFlights.flights.append(newFlight3)

//: ## 3. Create a free-standing function that can print the flight information from the `DepartureBoard`
//: a. Use the function signature: `printDepartures(departureBoard:)`
//:
//: b. Use a `for in` loop to iterate over each departure
//:
//: c. Make your `FlightStatus` enum conform to `String` so you can print the `rawValue` String values from the `enum`. See the [enum documentation](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html).
//:
//: d. Print out the current DepartureBoard you created using the function




//: ## 4. Make a second function to print print an empty string if the `departureTime` is nil
//: a. Createa new `printDepartures2(departureBoard:)` or modify the previous function
//:
//: b. Use optional binding to unwrap any optional values, use string interpolation to turn a non-optional date into a String
//:
//: c. Call the new or udpated function. It should not print `Optional(2019-05-30 17:09:20 +0000)` for departureTime or for the Terminal.
//:
//: d. Stretch: Format the time string so it displays only the time using a [`DateFormatter`](https://developer.apple.com/documentation/foundation/dateformatter) look at the `dateStyle` (none), `timeStyle` (short) and the `string(from:)` method
//:
//: e. Your output should look like:
//:
//:     Destination: Los Angeles Airline: Delta Air Lines Flight: KL 6966 Departure Time:  Terminal: 4 Status: Canceled
//:     Destination: Rochester Airline: Jet Blue Airways Flight: B6 586 Departure Time: 1:26 PM Terminal:  Status: Scheduled
//:     Destination: Boston Airline: KLM Flight: KL 6966 Departure Time: 1:26 PM Terminal: 4 Status: Scheduled



//: ## 5. Add an instance method to your `DepatureBoard` class (above) that can send an alert message to all passengers about their upcoming flight. Loop through the flights and use a `switch` on the flight status variable.
//: a. If the flight is canceled print out: "We're sorry your flight to \(city) was canceled, here is a $500 voucher"
//:
//: b. If the flight is scheduled print out: "Your flight to \(city) is scheduled to depart at \(time) from terminal: \(terminal)"
//:
//: c. If their flight is boarding print out: "Your flight is boarding, please head to terminal: \(terminal) immediately. The doors are closing soon."
//:
//: d. If the `departureTime` or `terminal` are optional, use "TBD" instead of a blank String
//:
//: e. If you have any other cases to handle please print out appropriate messages
//:
//: d. Call the `alertPassengers()` function on your `DepartureBoard` object below
//:
//: f. Stretch: Display a custom message if the `terminal` is `nil`, tell the traveler to see the nearest information desk for more details.




//: ## 6. Create a free-standing function to calculate your total airfair for checked bags and destination
//: Use the method signature, and return the airfare as a `Double`
//:
//:     func calculateAirfare(checkedBags: Int, distance: Int, travelers: Int) -> Double {
//:     }
//:
//: a. Each bag costs $25
//:
//: b. Each mile costs $0.10
//:
//: c. Multiply the ticket cost by the number of travelers
//:
//: d. Call the function with a variety of inputs (2 bags, 2000 miles, 3 travelers = $750)
//:
//: e. Make sure to cast the numbers to the appropriate types so you calculate the correct airfare
//:
//: f. Stretch: Use a [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) with the `currencyStyle` to format the amount in US dollars.



