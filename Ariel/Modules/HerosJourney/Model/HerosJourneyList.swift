//
//  HerosJourneyList.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 22/01/23.
//

import Foundation

class HerosJourneyManager {
    
    static var shared: HerosJourneyManager = {
        let instance = HerosJourneyManager()
        return instance
    }()

    private init() {}
    
    func getHerosJourneyByString(name: String) -> HerosJourneyModel? {
        switch name {
        case "1":
            return HerosJourneyModels.ordinaryWorld.getHerosJourney()
        case "2":
            return HerosJourneyModels.callToAdventure.getHerosJourney()
        case "3":
            return HerosJourneyModels.refusalOfTheCall.getHerosJourney()
        case "4":
            return HerosJourneyModels.meetingTheMentor.getHerosJourney()
        case "5":
            return HerosJourneyModels.crossingTheThreshold.getHerosJourney()
        case "6":
            return HerosJourneyModels.testsAlliesEnemies.getHerosJourney()
        case "7":
            return HerosJourneyModels.approachToTheInmostCave.getHerosJourney()
        case "8":
            return HerosJourneyModels.ordeal.getHerosJourney()
        case "9":
            return HerosJourneyModels.reward.getHerosJourney()
        case "10":
            return HerosJourneyModels.theRoadBack.getHerosJourney()
        case "11":
            return HerosJourneyModels.resurrection.getHerosJourney()
        case "12":
            return HerosJourneyModels.returnWithTheElixir.getHerosJourney()
        default:
            return nil
        }
    }
}

enum HerosJourneyModels {
    
    case ordinaryWorld, callToAdventure, refusalOfTheCall, meetingTheMentor, crossingTheThreshold, testsAlliesEnemies, approachToTheInmostCave, ordeal, reward, theRoadBack, resurrection, returnWithTheElixir
    
    func getHerosJourney() -> HerosJourneyModel {
        switch self {
        case .ordinaryWorld:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.firstDesc.localized(),
                            imageName: "Poder",
                            herosJourneysStage: HerosJourneyScreenTexts.firstTitle.localized())
        case .callToAdventure:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.secondDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.secondTitle.localized())
        case .refusalOfTheCall:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.thirdDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.thirdTitle.localized())
        case .meetingTheMentor:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.fourthDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.fourthTitle.localized())
        case .crossingTheThreshold:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.fifthDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.fifthTitle.localized())
        case .testsAlliesEnemies:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.sixthDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.sixthTitle.localized())
        case .approachToTheInmostCave:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.seventhDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.seventhTitle.localized())
        case .ordeal:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.eighthDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.eighthTitle.localized())
        case .reward:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.ninthDesc.localized(),
                            imageName: "Capela",
                                     herosJourneysStage: HerosJourneyScreenTexts.ninthTitle.localized())
        case .theRoadBack:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.tenthDesc.localized(),
                            imageName: "Capela",
                                     herosJourneysStage: HerosJourneyScreenTexts.tenthTitle.localized())
        case .resurrection:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.eleventhDesc.localized(),
                            imageName: "Capela",
                                     herosJourneysStage: HerosJourneyScreenTexts.eleventhTitle.localized())
        case .returnWithTheElixir:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.twelfthDesc.localized(),
                            imageName: "Capela",
                                     herosJourneysStage: HerosJourneyScreenTexts.twelfthTitle.localized())
            
        }
    }
}
