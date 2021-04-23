//
//  Main.swift
//  Main
//
//  Created by Vamsi on 4/21/21.
//

import Foundation


class Main : NSObject, NSCoding{

	var feelsLike : Double!
	var temp : Double!
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		feelsLike = dictionary["feels_like"] as? Double
		temp = dictionary["temp"] as? Double
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if feelsLike != nil{
			dictionary["feels_like"] = feelsLike
		}
		if temp != nil{
			dictionary["temp"] = temp
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         feelsLike = aDecoder.decodeObject(forKey: "feels_like") as? Double
         temp = aDecoder.decodeObject(forKey: "temp") as? Double
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if feelsLike != nil{
			aCoder.encode(feelsLike, forKey: "feels_like")
		}
		if temp != nil{
			aCoder.encode(temp, forKey: "temp")
		}
	}

}
