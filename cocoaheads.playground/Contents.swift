//: Playground - noun: a place where people can play

import UIKit

let value: NSNumber = 1001.42

// NumberFormatter
NumberFormatter.localizedString(from: value, number: .spellOut)
NumberFormatter.localizedString(from: value, number: .currencyPlural)

let price: NSNumber = 123.436

let numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .currency
//numberFormatter.numberStyle = .spellOut
numberFormatter.locale = Locale.current // is the default
numberFormatter.string(from: price)

numberFormatter.locale = Locale(identifier: "fr_CH")
numberFormatter.string(from: price)

numberFormatter.locale = Locale(identifier: "es_ES")
numberFormatter.string(from: price)







// NSDateFormatter
DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.full, timeStyle: DateFormatter.Style.full)
let dateComponent = DateComponentsFormatter()
dateComponent.includesTimeRemainingPhrase = true
dateComponent.allowsFractionalUnits = true
dateComponent.includesApproximationPhrase = true
dateComponent.string(from: Date().timeIntervalSince1970)







// NSDateIntervalFormatter
let intervalFormatter = DateIntervalFormatter()
intervalFormatter.dateStyle = DateIntervalFormatter.Style.short
intervalFormatter.timeStyle = DateIntervalFormatter.Style.long
intervalFormatter.string(from: Date(timeInterval: 2*60, since: Date()), to: Date())







// NSMassFormatter
MassFormatter().string(fromValue: value.doubleValue, unit: .gram)
MassFormatter().string(fromValue: value.doubleValue, unit: .stone)
MassFormatter().string(fromKilograms: value.doubleValue)
MassFormatter().unitString(fromValue: value.doubleValue, unit: .stone)







// NSEnergyFormatter
EnergyFormatter().string(fromValue: value.doubleValue, unit: .calorie)
EnergyFormatter().string(fromJoules: value.doubleValue)
EnergyFormatter().unitString(fromValue: value.doubleValue, unit: .kilocalorie)







// NSLengthFormatter
LengthFormatter().string(fromValue: value.doubleValue, unit: .kilometer)
LengthFormatter().string(fromMeters: value.doubleValue)
LengthFormatter().unitString(fromValue: value.doubleValue, unit: .millimeter)







// MKDistanceFormatter
import CoreLocation
import MapKit

let sanFrancisco = CLLocation(latitude: 37.775, longitude: -122.4183333)
let portland = CLLocation(latitude: 45.5236111, longitude: -122.675)
let distance = portland.distance(from: sanFrancisco)

let formatter = MKDistanceFormatter()
formatter.units = .imperialWithYards
formatter.unitStyle = .full
formatter.string(fromDistance: distance)







// CNPostalAddressFormatter
import Contacts

let address = CNMutablePostalAddress()

address.street = "1, place Giovanni da Verrazzano"
address.state = "Rhône"
address.city = "Lyon"
address.country = "France"
address.postalCode = "69009"

address.isoCountryCode = "FR"
CNPostalAddressFormatter.string(from: address, style: .mailingAddress)

address.isoCountryCode = "US"
CNPostalAddressFormatter.string(from: address, style: .mailingAddress)

address.isoCountryCode = "JP"
CNPostalAddressFormatter.string(from: address, style: .mailingAddress)
