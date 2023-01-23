//
//  ArchetypesList.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 23/01/23.
//

import Foundation

class ArchetypeManager {
    
    static var shared: ArchetypeManager = {
        let instance = ArchetypeManager()
        return instance
    }()

    private init() {}
    
    func getArchetypeByString(name: String) -> ArchetypeModel? {
        switch name {
        case "1":
            return ArchetypeModels.ordinaryWorld.getArchetype()
        case "2":
            return ArchetypeModels.callToAdventure.getArchetype()
        case "3":
            return ArchetypeModels.refusalOfTheCall.getArchetype()
        case "4":
            return ArchetypeModels.meetingTheMentor.getArchetype()
        case "5":
            return ArchetypeModels.crossingTheThreshold.getArchetype()
        case "6":
            return ArchetypeModels.testsAlliesEnemies.getArchetype()
        case "7":
            return ArchetypeModels.approachToTheInmostCave.getArchetype()
        case "8":
            return ArchetypeModels.ordeal.getArchetype()
        default:
            return nil
        }
    }
}

enum ArchetypeModels {
    
    case ordinaryWorld, callToAdventure, refusalOfTheCall, meetingTheMentor, crossingTheThreshold, testsAlliesEnemies, approachToTheInmostCave, ordeal
    
    func getArchetype() -> ArchetypeModel {
        switch self {
        case .ordinaryWorld:
            return ArchetypeModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            archetypeStage: "Herói")
        case .callToAdventure:
            return ArchetypeModel(descriptionText: "Lorem ipsum World sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "Mentor",
                            archetypeStage: "Mentor")
        case .refusalOfTheCall:
            return ArchetypeModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            archetypeStage: "Refusal Of The Call")
        case .meetingTheMentor:
            return ArchetypeModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            archetypeStage: "Meeting The Mentor")
        case .crossingTheThreshold:
            return ArchetypeModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            archetypeStage: "Crossing The Threshold")
        case .testsAlliesEnemies:
            return ArchetypeModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            archetypeStage: "Tests, Allies, Enemies")
        case .approachToTheInmostCave:
            return ArchetypeModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            archetypeStage: "Approach To The Inmost Cave")
        case .ordeal:
            return ArchetypeModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            archetypeStage: "Ordeal")
        }
    }
}
