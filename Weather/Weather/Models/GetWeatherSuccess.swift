//
//  GetWeatherSuccess.swift
//  GetWeatherSuccess
//
//  Created by Vamsi on 4/21/21.
//

import Foundation


class GetWeatherSuccess : NSObject, NSCoding{

	var list : [List]!

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		list = [List]()
		if let listArray = dictionary["list"] as? [[String:Any]]{
			for dic in listArray{
				let value = List(fromDictionary: dic)
				list.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if list != nil{
			var dictionaryElements = [[String:Any]]()
			for listElement in list {
				dictionaryElements.append(listElement.toDictionary())
			}
			dictionary["list"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         list = aDecoder.decodeObject(forKey :"list") as? [List]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if list != nil{
			aCoder.encode(list, forKey: "list")
		}
	}

}
