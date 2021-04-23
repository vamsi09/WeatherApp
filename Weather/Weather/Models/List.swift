//
//  List.swift
//  List
//
//  Created by Vamsi on 4/21/21.
//

import Foundation

class List : NSObject, NSCoding{
	
    var main : Main!
	var weather : [Weather]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let mainData = dictionary["main"] as? [String:Any]{
			main = Main(fromDictionary: mainData)
		}
		weather = [Weather]()
		if let weatherArray = dictionary["weather"] as? [[String:Any]]{
			for dic in weatherArray{
				let value = Weather(fromDictionary: dic)
				weather.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if weather != nil{
			var dictionaryElements = [[String:Any]]()
			for weatherElement in weather {
				dictionaryElements.append(weatherElement.toDictionary())
			}
			dictionary["weather"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         main = aDecoder.decodeObject(forKey: "main") as? Main
         weather = aDecoder.decodeObject(forKey :"weather") as? [Weather]
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if main != nil{
			aCoder.encode(main, forKey: "main")
		}
		if weather != nil{
			aCoder.encode(weather, forKey: "weather")
		}

	}

}
