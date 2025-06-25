//
//  Model.swift
//  MyAdventure
//
//  Created by Trey Gaines on 6/25/25.
//

struct AdventureNode {
    let id: Int
    let text: String
    let choices: [Choice]
    let isEnd: Bool
    let isSuccess: Bool
    
    static let startNode = AdventureNode(id: 0, text: "You wake up in a forest. What do you do?", choices: [Choice.choice0, Choice.choice1, Choice.choice2], isEnd: false, isSuccess: false)
    
    static let node1 = AdventureNode(id: 1, text: "You follow a narrow path and reach a river.", choices: [Choice.choice3, Choice.choice4], isEnd: false, isSuccess: false)
    
    static let node2 = AdventureNode(id: 2, text: "You climb the tree and fall. Ouch! Restart.", choices: [Choice.choice9], isEnd: true, isSuccess: false)
    
    static let node3 = AdventureNode(id: 3, text: "You fall asleep forever. Game over.", choices: [Choice.choice8], isEnd: true, isSuccess: false)
    
    static let node4 = AdventureNode(id: 4, text: "The river is too strong. You drown. Restart.", choices: [Choice.choice8], isEnd: true, isSuccess: false)
    
    static let node5 = AdventureNode(id: 5, text: "You find a bridge and cross safely.", choices: [Choice.choice6, Choice.choice7], isEnd: false, isSuccess: false)
    
    static let node6 = AdventureNode(id: 6, text: "You enter the castle and find treasure. You win!", choices: [], isEnd: true, isSuccess: true)
    
    static let node7 = AdventureNode(id: 7, text: "You are caught by guards. Game over.", choices: [Choice(text: "Restart", nextNode: 0)], isEnd: true, isSuccess: false)
        
    static func returnNodes() -> [Int: AdventureNode] {
        return [
                0: AdventureNode.startNode,
                1: AdventureNode.node1,
                2: AdventureNode.node2,
                3: AdventureNode.node3,
                4: AdventureNode.node4,
                5: AdventureNode.node5,
                6: AdventureNode.node6,
                7: AdventureNode.node7
            ]
    }
}


struct Choice: Hashable {
    let text: String
    let nextNode: Int?
    
    static let choice0: Choice = Choice(text: "Explore the path", nextNode: 1)
    static let choice1: Choice = Choice(text: "Climb a tree", nextNode: 2)
    static let choice2: Choice = Choice(text: "Go back to sleep", nextNode: 3)
    static let choice3: Choice = Choice(text: "Swim across", nextNode: 4)
    static let choice4: Choice = Choice(text: "Look for a bridge", nextNode: 5)
    static let choice5: Choice = Choice(text: "Follow the riverbank", nextNode: 7)
    static let choice6: Choice = Choice(text: "Enter the castle", nextNode: 6)
    static let choice7: Choice = Choice(text: "Hide in the bushes", nextNode: 7)
    static let choice8: Choice = Choice(text: "Restart", nextNode: 0)
    static let choice9: Choice = Choice(text: "Try again", nextNode: 0)
    
}
