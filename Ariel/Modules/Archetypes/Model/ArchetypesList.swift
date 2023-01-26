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
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.firstDesc.localized(),
                            imageName: "ariel still",
                            archetypeStage: ArchetypesScreenTexts.firstTitle.localized())
        case .callToAdventure:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.secondDesc.localized(),
                            imageName: "ariel still",
                            archetypeStage: ArchetypesScreenTexts.secondTitle.localized())
        case .refusalOfTheCall:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.thirdDesc.localized(),
                            imageName: "ariel still",
                                  archetypeStage: ArchetypesScreenTexts.thirdTitle.localized())
        case .meetingTheMentor:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.fourthDesc.localized(),
                            imageName: "ariel still",
                                  archetypeStage: ArchetypesScreenTexts.fourthTitle.localized())
        case .crossingTheThreshold:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.fifthDesc.localized(),
                            imageName: "ariel still",
                                  archetypeStage: ArchetypesScreenTexts.fifthTitle.localized())
        case .testsAlliesEnemies:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.sixthDesc.localized(),
                            imageName: "ariel still",
                                  archetypeStage: ArchetypesScreenTexts.sixthTitle.localized())
        case .approachToTheInmostCave:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.seventhDesc.localized(),
                            imageName: "ariel still",
                                  archetypeStage: ArchetypesScreenTexts.seventhTitle.localized())
        case .ordeal:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.eighthDesc.localized(),
                            imageName: "ariel still",
                                  archetypeStage: ArchetypesScreenTexts.eighthTitle.localized())
        }
    }
}
