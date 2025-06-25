//
//  Model.swift
//  MyAdventure
//
//  Created by Trey Gaines on 6/21/25.
//
import Observation


@Observable
class AdventureModel {
    var nodes: [Int: AdventureNode] = [:]
    var currentNodeID: Int = 0
    var currentNode: AdventureNode {
        return nodes[currentNodeID]!
    }
    
    var restartGame: Bool {
        return currentNode.isEnd || currentNode.isSuccess
    }
    
    init() {
        nodes = AdventureNode.returnNodes()
    }
}
