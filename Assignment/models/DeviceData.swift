//
//  ComputerItem.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation


// MARK: - ComputerItem
struct DeviceData: Decodable, Identifiable, Hashable, Equatable {
    static func == (lhs: DeviceData, rhs: DeviceData) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: String
    let name: String
    let data: ItemData?
}

struct ItemData: Codable{
    
    let color: String?
    let capacity: String?
    let price: Double?
    let capacityGB: Int?
    let screenSize: Double?
    let description: String?
    let generation: String?
    let strapColour: String?
    let caseSize: String?
    let cpuModel: String?
    let hardDiskSize: String?

    enum CodingKeys: String, CodingKey {
        case color 
        case capacity
        case price
        case capacityGB = "capacity GB"
        case screenSize = "Screen size"
        case description = "Description"
        case generation = "Generation"
        case strapColour = "Strap Colour"
        case caseSize = "Case Size"
        case cpuModel = "CPU model"
        case hardDiskSize = "Hard disk size"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
        self.capacity = try container.decodeIfPresent(String.self, forKey: .capacity)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.capacityGB = try container.decodeIfPresent(Int.self, forKey: .capacityGB)
        self.screenSize = try container.decodeIfPresent(Double.self, forKey: .screenSize)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.generation = try container.decodeIfPresent(String.self, forKey: .generation)
        self.strapColour = try container.decodeIfPresent(String.self, forKey: .strapColour)
        self.caseSize = try container.decodeIfPresent(String.self, forKey: .caseSize)
        self.cpuModel = try container.decodeIfPresent(String.self, forKey: .cpuModel)
        self.hardDiskSize = try container.decodeIfPresent(String.self, forKey: .hardDiskSize)
    }
    
}
