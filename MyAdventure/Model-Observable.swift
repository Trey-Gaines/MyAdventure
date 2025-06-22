//
//  Model.swift
//  MyAdventure
//
//  Created by Trey Gaines on 6/21/25.
//
import Observation


struct AdventureNode {
    let id: Int
    let text: String
    let choices: [Choice]
    let isEnd: Bool
    let isSuccess: Bool
}

struct Choice: Hashable {
    let text: String
    let nextNode: Int?
}




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
        nodes = [
            0: AdventureNode(id: 0, text: "You wake up in a forest. What do you do?", choices: [
                Choice(text: "Explore the path", nextNode: 1),
                Choice(text: "Climb a tree", nextNode: 2),
                Choice(text: "Go back to sleep", nextNode: 3)
            ], isEnd: false, isSuccess: false),
            
            1: AdventureNode(id: 1, text: "You follow a narrow path and reach a river.", choices: [
                Choice(text: "Swim across", nextNode: 4), Choice(text: "Look for a bridge", nextNode: 5)], isEnd: false, isSuccess: false),
            
            2: AdventureNode(id: 2, text: "You climb the tree and fall. Ouch! Restart.", choices: [Choice(text: "Try again", nextNode: 0)], isEnd: true, isSuccess: false),
            
            3: AdventureNode(id: 3, text: "You fall asleep forever. Game over.", choices: [Choice(text: "Restart", nextNode: 0)], isEnd: true, isSuccess: false),
            
            4: AdventureNode(id: 4, text: "The river is too strong. You drown. Restart.", choices: [Choice(text: "Restart", nextNode: 0)], isEnd: true, isSuccess: false),
            
            5: AdventureNode(id: 5, text: "You find a bridge and cross safely.", choices: [
                Choice(text: "Enter the castle", nextNode: 6),
                Choice(text: "Hide in the bushes", nextNode: 7)
            ], isEnd: false, isSuccess: false),
            
            6: AdventureNode(id: 6, text: "You enter the castle and find treasure. You win!", choices: [], isEnd: true, isSuccess: true),
            
            7: AdventureNode(id: 7, text: "You are caught by guards. Game over.", choices: [Choice(text: "Restart", nextNode: 0)], isEnd: true, isSuccess: false)
        ]
    }
    
    
    
}
