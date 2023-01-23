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
            return HerosJourneyModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "Capela",
                            herosJourneysStage: "Ordinary World")
        case .callToAdventure:
            return HerosJourneyModel(descriptionText: "Lorem ipsum World sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "Poder",
                            herosJourneysStage: "Call To Adventure")
        case .refusalOfTheCall:
            return HerosJourneyModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "Rato",
                            herosJourneysStage: "Refusal Of The Call")
        case .meetingTheMentor:
            return HerosJourneyModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            herosJourneysStage: "Meeting The Mentor")
        case .crossingTheThreshold:
            return HerosJourneyModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            herosJourneysStage: "Crossing The Threshold")
        case .testsAlliesEnemies:
            return HerosJourneyModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            herosJourneysStage: "Tests, Allies, Enemies")
        case .approachToTheInmostCave:
            return HerosJourneyModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            herosJourneysStage: "Approach To The Inmost Cave")
        case .ordeal:
            return HerosJourneyModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            herosJourneysStage: "Ordeal")
        case .reward:
            return HerosJourneyModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            herosJourneysStage: "Reward (Seizing The Sword)")
        case .theRoadBack:
            return HerosJourneyModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            herosJourneysStage: "The Road Back")
        case .resurrection:
            return HerosJourneyModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            herosJourneysStage: "Resurrection")
        case .returnWithTheElixir:
            return HerosJourneyModel(descriptionText: "Lorem ipsum {World} sit amet, [consectetur] #adipiscing# elit, sed do eiusmod #tempor# incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            imageName: "ariel still",
                            herosJourneysStage: "Return With The Elixir")
            
        }
    }
}
