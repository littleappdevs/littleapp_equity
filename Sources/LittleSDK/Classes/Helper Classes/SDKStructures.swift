//
//  Structures.swift
//  LittleSDK
//
//  Created by Gabriel John on 10/05/2021.
//

import Foundation

struct FareEstimate_Base : Codable {
    
    let currency : String?
    let vehicleType : String?
    let subVehicleType: String?
    let maxSize : Int?
    let costDistance : Double?
    let costTime : Double?
    let minimumCost : Double?
    let basePrice : Double?
    let vehicleICON : String?
    let tripCost : Double?
    let maxAmount : Double?
    let minAmount : Double?
    let textLabels : String?
    let costEstimate : String?
    let oldTripCost : String?
    let vehicleCategory : String?
    let bannerImage: String?
    let bannerText, newitem: String?
    
    enum CodingKeys: String, CodingKey {
        
        case currency = "Currency"
        case vehicleType = "VehicleType"
        case subVehicleType = "SubVehicleType"
        case maxSize = "MaxSize"
        case costDistance = "CostDistance"
        case costTime = "CostTime"
        case minimumCost = "MinimumCost"
        case basePrice = "BasePrice"
        case vehicleICON = "VehicleICON"
        case tripCost = "TripCost"
        case maxAmount = "MaxAmount"
        case minAmount = "MinAmount"
        case textLabels = "TextLabels"
        case costEstimate = "CostEstimate"
        case oldTripCost = "OldTripCost"
        case vehicleCategory = "VehicleCategory"
        case bannerImage = "BannerImage"
        case bannerText = "BannerText"
        case newitem = "Newitem"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        vehicleType = try values.decodeIfPresent(String.self, forKey: .vehicleType)
        subVehicleType = try values.decodeIfPresent(String.self, forKey: .subVehicleType)
        maxSize = try values.decodeIfPresent(Int.self, forKey: .maxSize)
        costDistance = try values.decodeIfPresent(Double.self, forKey: .costDistance)
        costTime = try values.decodeIfPresent(Double.self, forKey: .costTime)
        minimumCost = try values.decodeIfPresent(Double.self, forKey: .minimumCost)
        basePrice = try values.decodeIfPresent(Double.self, forKey: .basePrice)
        vehicleICON = try values.decodeIfPresent(String.self, forKey: .vehicleICON)
        tripCost = try values.decodeIfPresent(Double.self, forKey: .tripCost)
        maxAmount = try values.decodeIfPresent(Double.self, forKey: .maxAmount)
        minAmount = try values.decodeIfPresent(Double.self, forKey: .minAmount)
        textLabels = try values.decodeIfPresent(String.self, forKey: .textLabels)
        oldTripCost = try values.decodeIfPresent(String.self, forKey: .oldTripCost)
        costEstimate = try values.decodeIfPresent(String.self, forKey: .costEstimate)
        vehicleCategory = try values.decodeIfPresent(String.self, forKey: .vehicleCategory)
        newitem = try values.decodeIfPresent(String.self, forKey: .newitem)
        bannerText = try values.decodeIfPresent(String.self, forKey: .bannerText)
        bannerImage = try values.decodeIfPresent(String.self, forKey: .bannerImage)
    }
    
}

// MARK: - LocationSet

struct LocationSetSDK: Codable {
    let id: String
    let name: String
    let subname: String
    let latitude: String
    let longitude: String
    let phonenumber: String
    let instructions: String
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case subname
        case latitude
        case longitude
        case phonenumber
        case instructions
    }
}

// MARK: - FareEstimateSet

struct LocationsEstimateSetSDK: Codable {
    let pickupLocation: LocationSetSDK?
    let dropoffLocations: [LocationSetSDK]?
    enum CodingKeys: String, CodingKey {
        case pickupLocation
        case dropoffLocations
    }
}

// MARK: - GetPendingResult
struct GetPendingResult: Codable {
    let status, message, city, country: String?
    let currency, gif, event, eventImage, eventColor, forwardCount, tripID, forceLogout: String?
    let popupTitle, popupImage, popupMessage, popupType, forceUpdate: String?
    let waitTime: Int?
    let wallets: [Wallet]?
    let paymentTypes: [PaymentTypeSDK]?
    let recentTrips: [RecentTrip]?
    
    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case city = "City"
        case country = "Country"
        case currency = "Currency"
        case gif = "GIF"
        case event = "Event"
        case eventImage = "EventImage"
        case eventColor = "EventColor"
        case forwardCount = "ForwardCount"
        case tripID = "TripID"
        case forceLogout = "ForceLogout"
        case popupTitle = "PopupTitle"
        case popupImage = "PopupImage"
        case popupMessage = "PopupMessage"
        case popupType = "PopupType"
        case forceUpdate = "ForceUpdate"
        case waitTime = "WaitTime"
        case wallets = "Wallets"
        case paymentTypes = "PaymentTypes"
        case recentTrips = "RecentTrips"
    }
}

// MARK: - RecentTrip
struct RecentTrip: Codable {
    let pickupLL, dropOffLL, pickupName, dropOffName: String?

    enum CodingKeys: String, CodingKey {
        case pickupLL = "PickupLL"
        case dropOffLL = "DropOffLL"
        case pickupName = "PickupName"
        case dropOffName = "DropOffName"
    }
}

// MARK: - PaymentType
struct PaymentTypeSDK: Codable {
    let paymentMode: String?
    
    enum CodingKeys: String, CodingKey {
        case paymentMode = "PaymentMode"
    }
}

// MARK: - Wallet
struct Wallet: Codable {
    let walletUniqueID, walletName: String?

    enum CodingKeys: String, CodingKey {
        case walletUniqueID = "WalletUniqueID"
        case walletName = "WalletName"
    }
}

typealias GetPendingResults = [GetPendingResult]

// MARK: - DefaultMessage
struct DefaultMessage: Codable {
    let status, message: String?
    
    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
    }
}

typealias DefaultMessages = [DefaultMessage]

// MARK: - TripDropOffDetail
struct TripDropOffDetail: Codable {
    let tripID: String?
    let dropOffNumber: Double?
    let dropOffAddress, dropOffLL, contactMobileNumber, contactName: String?
    let notes, endedOn: String?

    enum CodingKeys: String, CodingKey {
        case tripID = "TripID"
        case dropOffNumber = "DropOffNumber"
        case dropOffAddress = "DropOffAddress"
        case dropOffLL = "DropOffLL"
        case contactMobileNumber = "ContactMobileNumber"
        case contactName = "ContactName"
        case notes = "Notes"
        case endedOn = "EndedOn"
    }
}

// MARK: - TripResponseElement
struct TripResponseElement: Codable {
    let status, message, tripID, driverName, driverMobileNumber: String?
    let driverPIC, driverMobile: String?
    let driverLatitude, driverLongitude, carModel, carNumber: String?
    let carColor, driverRating, roadDistance, timeDistance: String?
    let friendCode, socialMediaID, tripDistance, tripTime: String?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case tripID = "TripID"
        case driverName = "DriverName"
        case driverMobileNumber = "DriverMobileNumber"
        case driverMobile = "DriverMobile"
        case driverPIC = "DriverPIC"
        case driverLatitude = "DriverLatitude"
        case driverLongitude = "DriverLongitude"
        case carModel = "CarModel"
        case carNumber = "CarNumber"
        case carColor = "CarColor"
        case driverRating = "DriverRating"
        case roadDistance = "RoadDistance"
        case timeDistance = "TimeDistance"
        case friendCode = "FriendCode"
        case socialMediaID = "SocialMediaID"
        case tripDistance = "TripDistance"
        case tripTime = "TripTime"
    }
}

typealias TripResponse = [TripResponseElement]

// MARK: - RequestStatusResponseElement
struct RequestStatusResponseElement: Codable {
    let status, message, tripStatus: String?
    let driverLongitude, driverLatitude, driverBearing: String?
    let costPerKilometer, costPerMinute: String?
    let liveFare, et, ed, vehicleType: String?
    let corporateID, paymentMode, currency, wifiPass: String?
    let minimumFare, basePrice, distance, distanceTotalCost, timeTotalCost: String?
    let time, paymentCodes, paymentCosts: String?
    let startOTP, endOTP, parkingOTP, tripChat: String?
    let tripDropOffDetails: [TripDropOffDetail]?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case tripStatus = "TripStatus"
        case driverLongitude = "DriverLongitude"
        case driverLatitude = "DriverLatitude"
        case driverBearing = "DriverBearing"
        case costPerKilometer = "PerKM"
        case costPerMinute = "PerMin"
        case liveFare = "LiveFare"
        case et = "ET"
        case ed = "ED"
        case vehicleType = "VehicleType"
        case corporateID = "CorporateID"
        case paymentMode = "PaymentMode"
        case currency = "Currency"
        case wifiPass = "WifiPass"
        case minimumFare = "MinimumFare"
        case basePrice = "BasePrice"
        case distance = "Distance"
        case time = "Time"
        case paymentCodes = "PaymentCodes"
        case paymentCosts = "PaymentCosts"
        case distanceTotalCost = "DistanceTotalCost"
        case timeTotalCost = "TimeTotalCost"
        case startOTP = "StartTripOTP"
        case endOTP = "EndTripOTP"
        case parkingOTP = "ParkingOTP"
        case tripChat = "TripChat"
        case tripDropOffDetails = "TripDropOffDetails"
    }
}

typealias RequestStatusResponse = [RequestStatusResponseElement]

// MARK: - SDKConfirmElement
struct SDKConfirmElement: Codable {
    var uniqueID, keyID, encryptionKey, encryptionIV: String?
    var userName, platform, codeBase: String?

    enum CodingKeys: String, CodingKey {
        case uniqueID = "UniqueID"
        case keyID = "KeyID"
        case encryptionKey = "EncryptionKey"
        case encryptionIV = "EncryptionIV"
        case userName = "UserName"
        case platform = "Platform"
        case codeBase = "CodeBase"
    }
}

typealias SDKConfirm = [SDKConfirmElement]

// MARK: - SDKData
struct SDKData: Codable {
    var data: String?

    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }
}

// MARK: - TripProviders
struct TripProviders: Codable {
    var status, vehicleType: String?
    var providerDriverLocationList: [ProviderDriverLocationList]?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case vehicleType = "VehicleType"
        case providerDriverLocationList = "ProviderDriverLocationList"
    }
}

// MARK: - ProviderDriverLocationList
struct ProviderDriverLocationList: Codable {
    var latitude, longitude, bearing: String?

    enum CodingKeys: String, CodingKey {
        case latitude = "Latitude"
        case longitude = "Longitude"
        case bearing = "Bearing"
    }
}

// MARK: - PreferredDrivers
struct PreferredDrivers: Codable {
    var status: String?
    var listPreferredDrivers: [ListPreferredDriver]?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case listPreferredDrivers = "ListPreferredDrivers"
    }
}

// MARK: - ListPreferredDriver
struct ListPreferredDriver: Codable {
    var driverEMailID, driverName: String?
    var driverImage: String?
    var roadDistance, timeDistance, rating, lastServed: String?
    var aboutMe: String?

    enum CodingKeys: String, CodingKey {
        case driverEMailID = "DriverEMailID"
        case driverName = "DriverName"
        case driverImage = "DriverImage"
        case roadDistance = "RoadDistance"
        case timeDistance = "TimeDistance"
        case rating = "Rating"
        case lastServed = "LastServed"
        case aboutMe = "AboutMe"
    }
}

// MARK: - Balance
struct Balance: Codable {
    let walletID, walletName: String?
    let balance: Double?

    enum CodingKeys: String, CodingKey {
        case walletID = "WalletID"
        case walletName = "WalletName"
        case balance = "WalletBalance"
    }
}

// MARK: - Field
struct Field: Codable {
    let fieldTitle, fieldType, fieldValue, fieldCategory, fieldAnswer: String?

    enum CodingKeys: String, CodingKey {
        case fieldTitle = "FieldTitle"
        case fieldType = "FieldType"
        case fieldValue = "FieldValue"
        case fieldCategory = "FieldCategory"
        case fieldAnswer = "FieldAnswer"
    }
}

// MARK: - NearbyMerchant
struct NearbyMerchant: Codable {
    let status, paymentCode, name: String?
    let distance: Double?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case paymentCode = "PaymentCode"
        case name = "Name"
        case distance = "Distance"
    }
}

typealias NearbyMerchants = [NearbyMerchant]

// MARK: - MerchantValidateElement
struct MerchantValidateElement: Codable {
    let status, message, merchantValidateDescription, name: String?
    let logo: String?
    let minimumAmount, maximumAmount: Double?
    let fields: [Field]?
    let balance: [Balance]?
    let customerDiscount, merchantDiscount: Double?
    let merchantDescription: String?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case merchantValidateDescription = "Description"
        case name = "Name"
        case logo = "Logo"
        case minimumAmount = "MinimumAmount"
        case maximumAmount = "MaximumAmount"
        case fields = "Fields"
        case balance = "Balance"
        case customerDiscount = "CustomerDiscount"
        case merchantDiscount = "MerchantDiscount"
        case merchantDescription = "MerchantDescription"
    }
}

typealias MerchantValidate = [MerchantValidateElement]

// MARK: - MerchantPay
struct MerchantPay: Codable {
    let status, message, merchantReference: String?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case merchantReference = "MerchantReference"
    }
}

// MARK: - WalletsToLoadElement
struct WalletsToLoadElement: Codable {
    let status, message, askID, kycMessage: String?
    let wallets: [Wallet]?
    let toWallets: [ToWallet]?
    let trx: [TrxWallet]?
    let kycFields: [KYCField]?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case askID = "AskID"
        case kycMessage = "KYCMessage"
        case wallets = "Wallets"
        case toWallets = "ToWallets"
        case trx = "Trx"
        case kycFields = "KYCFields"
    }
}

// MARK: - KYCField
struct KYCField: Codable {
    let fieldID, fieldName, fieldType, incentiveText, kycValue: String?
    let incentive: Double?

    enum CodingKeys: String, CodingKey {
        case fieldID = "FieldID"
        case fieldName = "FieldName"
        case fieldType = "FieldType"
        case incentiveText = "IncentiveText"
        case incentive = "Incentive"
        case kycValue = "KycValue"
    }
}

// MARK: - ToWallet
struct ToWallet: Codable {
    let toWalletID, toWalletName: String?

    enum CodingKeys: String, CodingKey {
        case toWalletID = "ToWalletID"
        case toWalletName = "ToWalletName"
    }
}

// MARK: - Trx
struct TrxWallet: Codable {
    let loadDate: String?
    let amountLoaded, offerAmount: Double?
    let paymentSource, reference: String?

    enum CodingKeys: String, CodingKey {
        case loadDate = "LoadDate"
        case amountLoaded = "AmountLoaded"
        case offerAmount = "OfferAmount"
        case paymentSource = "PaymentSource"
        case reference = "Reference"
    }
}

typealias WalletsToLoad = [WalletsToLoadElement]

// MARK: - CouponStatusElement
struct CouponStatusElement: Codable {
    let status, message, toWalletID, couponType, couponName: String?
    let couponURL, description: String?
    let couponText: String?
    let amount: Double?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case toWalletID = "ToWalletID"
        case couponType = "CouponType"
        case description = "Description"
        case couponText = "CouponText"
        case couponName = "CouponName"
        case couponURL = "CouponURL"
        case amount = "Amount"
    }
}

typealias CouponStatus = [CouponStatusElement]

struct QRData: Codable {
    var status, message, merchantID, amount, reference: String?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case merchantID = "MerchantID"
        case amount = "Amount"
        case reference = "Reference"
    }
}

// MARK: - GetRestaurant
struct GetRestaurant: Codable {
    let status: String?
    let restaurants: [Restaurant]?
    let offers: [Restaurant]?
    let paymentModes: [PaymentMode]?
    let riderBalance: [RiderBalance]?
    let balance: [Balance]?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case restaurants = "Restaurants"
        case offers = "Offers"
        case paymentModes = "PaymentModes"
        case riderBalance = "RiderBalance"
        case balance = "Wallet"
    }
}

// MARK: - PaymentMode
struct PaymentMode: Codable {
    let paymentMode: String?
    let balance: Double?
    let currency: String?

    enum CodingKeys: String, CodingKey {
        case paymentMode = "PaymentMode"
        case balance = "Balance"
        case currency = "Currency"
    }
}

// MARK: - Restaurant
struct Restaurant: Codable {
    let offerText, menuOnOffer, promoCode, restaurantID, restaurantName, typeOfRestaurant, locationName: String?
    let foodCategory, averageTime: String?
    let address: String?
    let deliveryCharges: Double?
    let distance, latitude, longitude: Double?
    let image: String?
    let rating: Double?
    let deliveryModes: [DeliveryMode]?
    let offline: Bool?

    enum CodingKeys: String, CodingKey {
        case offerText = "OfferText"
        case menuOnOffer = "MenuOnOffer"
        case promoCode = "PromoCode"
        case restaurantID = "RestaurantID"
        case restaurantName = "RestaurantName"
        case typeOfRestaurant = "TypeOfRestaurant"
        case locationName = "LocationName"
        case foodCategory = "FoodCategory"
        case averageTime = "AverageTime"
        case address = "Address"
        case deliveryCharges = "DeliveryCharges"
        case distance = "Distance"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case image = "Image"
        case rating = "Rating"
        case deliveryModes = "DeliveryModes"
        case offline = "Offline"
    }
}

// MARK: - RiderBalance
struct RiderBalance: Codable {
    let balanceType: String?
    let balance: Double?

    enum CodingKeys: String, CodingKey {
        case balanceType = "BalanceType"
        case balance = "Balance"
    }
}

// MARK: - DeliveryMode
struct DeliveryMode: Codable {
    let deliveryModes, deliveryModeDescription: String?
    let deliveryCharges: Double?

    enum CodingKeys: String, CodingKey {
        case deliveryModes = "DeliveryModes"
        case deliveryModeDescription = "Description"
        case deliveryCharges = "DeliveryCharges"
    }
}

typealias GetRestaurants = [GetRestaurant]

// MARK: - OrderHistoryElement
struct OrderHistoryElement: Codable {
    let status: String?
    let listTrips: [ListTrip]?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case listTrips = "ListTrips"
    }
}

// MARK: - ListTrip
struct ListTrip: Codable {
    let orderedOn, deliveryTripID, serviceTripID, requestSendToDriver: String?
    let tripStatus, restaurantName, currencyID: String?
    let orderAmount: Double?
    let deliveryCharges: Double?
    let totalCharges: Double?
    let promo: Double?
    let driverName: String?
    let driverProfile: String?

    enum CodingKeys: String, CodingKey {
        case orderedOn = "OrderedOn"
        case deliveryTripID = "DeliveryTripID"
        case serviceTripID = "ServiceTripID"
        case requestSendToDriver = "RequestSendToDriver"
        case tripStatus = "TripStatus"
        case restaurantName = "RestaurantName"
        case currencyID = "CurrencyID"
        case orderAmount = "OrderAmount"
        case deliveryCharges = "DeliveryCharges"
        case totalCharges = "TotalCharges"
        case promo = "Promo"
        case driverName = "DriverName"
        case driverProfile = "DriverProfile"
    }
}


typealias OrderHistory = [OrderHistoryElement]


// MARK: - OrderSummaryElement
struct OrderSummaryElement: Codable {
    let status, driverEMail, serviceTripID: String?
    let deliveryCharges: Double?
    let promo: Double?
    let deliveryTripDetails: [DeliveryTripDetail]?
    let deliveryLogs: [DeliveryLog]?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case driverEMail = "DriverEMail"
        case serviceTripID = "ServiceTripID"
        case deliveryCharges = "DeliveryCharges"
        case promo = "Promo"
        case deliveryTripDetails = "DeliveryTripDetails"
        case deliveryLogs = "DeliveryLogs"
    }
}

// MARK: - DeliveryTripDetail
struct DeliveryTripDetail: Codable {
    let foodName: String?
    let price: Double?
    let price1, quantity: Double?

    enum CodingKeys: String, CodingKey {
        case foodName = "FoodName"
        case price = "Price"
        case price1 = "Price1"
        case quantity = "Quantity"
    }
}

// MARK: - DeliveryLog
struct DeliveryLog: Codable {
    let eventName, eventTime, name, email, mobileNumber: String?

    enum CodingKeys: String, CodingKey {
        case eventName = "EventName"
        case eventTime = "EventTime"
        case name = "Name"
        case email = "Email"
        case mobileNumber = "MobileNumber"
    }
}

typealias OrderSummary = [OrderSummaryElement]

// MARK: - CartItems
struct CartItems: Codable {
    let itemID: String?
    let addonID: String?
    let number: Double?

    enum CodingKeys: String, CodingKey {
        case itemID = "itemID"
        case addonID = "addonID"
        case number = "number"
    }
}

// MARK: - GetRestaurantMenuElement
struct GetRestaurantMenuElement: Codable {
    let status, currency: String?
    let foodMenu: [FoodMenu]?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case currency = "Currency"
        case foodMenu = "FoodMenu"
    }
}

// MARK: - FoodMenu
struct FoodMenu: Codable {
    let menuID, foodCategory, foodName, foodDescription: String?
    let originalPrice, specialPrice: Double?
    let foodImage: String?
    let extraItem: String?
    let addonID: String?
    let extraItems: [GroupDetail]?

    enum CodingKeys: String, CodingKey {
        case menuID = "MenuID"
        case foodCategory = "FoodCategory"
        case foodName = "FoodName"
        case foodDescription = "FoodDescription"
        case originalPrice = "OriginalPrice"
        case specialPrice = "SpecialPrice"
        case foodImage = "FoodImage"
        case extraItem = "ExtraItem"
        case addonID = "AddonID"
        case extraItems = "ExtraItems"
    }
}

typealias GetRestaurantMenu = [GetRestaurantMenuElement]

// MARK: - ExtraMenuItem
struct ExtraMenuItem: Codable {
    let status, message, groupTitle, typeOfSelection: String?
    let finalNotes: String?
    let extraMenuItemRequired: Bool?
    let groupDetails: [GroupDetail]?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case groupTitle = "GroupTitle"
        case typeOfSelection = "TypeOfSelection"
        case finalNotes = "FinalNotes"
        case extraMenuItemRequired = "Required"
        case groupDetails = "GroupDetails"
    }
}

// MARK: - GroupDetail
struct GroupDetail: Codable {
    let extraItemID, extraItemName, extraItemDescription: String?
    let specialPrice: Double?

    enum CodingKeys: String, CodingKey {
        case extraItemID = "ExtraItemID"
        case extraItemName = "ExtraItemName"
        case extraItemDescription = "ExtraItemDescription"
        case specialPrice = "SpecialPrice"
    }
}

typealias ExtraMenuItems = [ExtraMenuItem]

// MARK: - OrderResponseElement
struct OrderResponseElement: Codable {
    let status, message, tripID, eMailID, driverInAppID: String?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case tripID = "TripID"
        case eMailID = "EMailID"
        case driverInAppID = "DriverInAppID"
    }
}

typealias OrderResponse = [OrderResponseElement]
