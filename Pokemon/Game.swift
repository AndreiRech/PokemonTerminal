import Foundation
import AVFoundation
 
var userUsedMove: Move?
var pcUsedMove: Move?

var userNewPokemon: Pokemon?
var pcNewPokemon: Pokemon?

var team1: [Pokemon] = []
var team2: [Pokemon] = []

var victory: Trainer?

func game(trainer1: Trainer, trainer2: Trainer) {
    team1 = trainer1.getTeam()
    team2 = trainer2.getTeam()
    
    musicPlayer.play(song: battle)
    
    repeat {
        // Estado atual do jogo + Turno do Usuario
        battle(trainer1: trainer1, trainer2: trainer2)
        
        // Turno do PC
        pcTurn(trainer1: trainer1, trainer2: trainer2)
        
        // Calcular Resutado
        calculateResults(trainer1: trainer1, trainer2: trainer2)
        
        userUsedMove = nil
        pcUsedMove = nil
        
    } while (victory == nil)
}

func printBoard(pkm1: Pokemon, pkm2: Pokemon, text: String, damage: Bool? = false) {
    printBattle(pkm1: pkm1, pkm2: pkm2, team1: team1, team2: team2)
    runningMenu(text: text)
    
    sleep(2)
}

func battle(trainer1: Trainer, trainer2: Trainer) {
    let pkm1 = trainer1.getActivePokemon()
    let pkm2 = trainer2.getActivePokemon()
    
    var valid = false
    while valid == false {
        printBattle(pkm1: pkm1, pkm2: pkm2, team1: team1, team2: team2)
        menu(pokemon: pkm1)
        
        if pkm1.getCurrentHealth() <= pkm1.getHealth() / 4 {
            if !musicPlayerLow.isCurrentlyPlaying() {
                musicPlayer.pause()
                musicPlayerLow.play(song: criticalHealth)
            }
        } else if pkm1.getCurrentHealth() > pkm1.getHealth() / 4 {
            if musicPlayerLow.isCurrentlyPlaying() {
                musicPlayerLow.pause()
                musicPlayer.resume()
            }
        }
        
        let input = readLine() ?? "0"
        
        switch input {
        case "1":
            fightChoice(pkm1: pkm1, pkm2: pkm2, trainer: trainer1)
            valid = true
        case "2":
            if bagChoice(pkm1: pkm1, pkm2: pkm2, trainer: trainer1) {
                valid = true
            }
        case "3":
            if pokemonChoice(pkm1: pkm1, pkm2: pkm2, trainer: trainer1) {
                valid = true
            }
        case "4":
            runChoice(pkm1: pkm1, pkm2: pkm2)
        default :
            print("Invalid input")
        }
    }
}

func fightChoice(pkm1: Pokemon, pkm2: Pokemon, trainer: Trainer) {
    var usedMove: Move?
    var valid = false
    
    while valid == false {
        printBattle(pkm1: pkm1, pkm2: pkm2, team1: team1, team2: team2)
        fightMenu(pokemon: trainer.getActivePokemon())
        
        let input = readLine() ?? "0"
        
        switch input {
        case "1", "2", "3", "4":
            let i = Int(input)! - 1
            usedMove = pkm1.getMoves()[i]
            
            if usedMove!.getPp() > 0 {
                valid = true
            } else {
                valid = false
                printBoard(pkm1: pkm1, pkm2: pkm2, text: "You have no PP left for this move!")
            }
        default :
            print("Invalid input")
        }
    }
    
    userUsedMove = usedMove
}

func bagChoice(pkm1: Pokemon, pkm2: Pokemon, trainer: Trainer) -> Bool {
    var itemName: String = ""
    let bag = trainer.getBag()
    var valid = false
    
    while valid == false {
        printBattle(pkm1: pkm1, pkm2: pkm2, team1: team1, team2: team2)
        bagMenu(bag: bag)
        
        let input = readLine() ?? "0"
        
        switch input {
        case "1", "2", "3":
            let itemIndex = Int(input)! - 1
            let itemKey = Array(bag.getItems().keys)[itemIndex]
            itemName = itemKey.getName()
            valid = true
        case "4":
            return false
        default :
            print("Invalid input")
        }
        
        for item in bag.getItems() {
            if item.key.getName() == itemName && item.value > 0 {
                let heal = bag.useItem(item: item.key)
                trainer.getActivePokemon().changeHealth(amount: heal!)
                musicPlayerHelper.play(song: healM)
                printBoard(pkm1: pkm1, pkm2: pkm2, text: "You used \(itemName)!")
                return true
            } else {
                valid = false
            }
        }
    }
    
    return false
}

func pokemonChoice(pkm1: Pokemon, pkm2: Pokemon, trainer: Trainer) -> Bool {
    var pokemon: Pokemon?
    let valid = false
    
    while valid == false {
        printBattle(pkm1: pkm1, pkm2: pkm2, team1: team1, team2: team2)
        pokemonMenu(trainer: trainer)
        
        let input = readLine() ?? "0"
        
        switch input {
        case "1", "2", "3":
            let i = Int(input)! - 1
            pokemon = trainer.getTeam()[i]
            
            if pokemon!.getName() != trainer.getActivePokemon().getName() && pokemon!.getIsAlive() {
                trainer.setActivePokemon(index: i)
                musicPlayerHelper.play(song: out)
                printBoard(pkm1: pkm1, pkm2: pkm2, text: "You sent out \(pokemon!.getName())!")
                return true
            } else {
                return false
            }
        case "4":
            return false
        default :
            print("Invalid input")
        }
    }
}

func runChoice(pkm1: Pokemon, pkm2: Pokemon) {
    let valid = false
    while valid == false {
        printBattle(pkm1: pkm1, pkm2: pkm2, team1: team1, team2: team2)
        runMenu()
        
        let input = readLine() ?? "0"
        
        switch input {
        case "1":
            return
        default :
            print("Invalid input")
        }
    }
}

func pcTurn(trainer1: Trainer, trainer2: Trainer) {
    let currentPokemon2 = trainer2.getActivePokemon()
    
    let randomNumber: Int = Int.random(in: 0...3)
    
    // Pokemon ataca
    pcUsedMove = currentPokemon2.getMoves()[randomNumber]
}

func calculateResults(trainer1: Trainer, trainer2: Trainer) {
    // Trainer 1
    let team1 = trainer1.getTeam()
    let currentPokemon1 = trainer1.getActivePokemon()
    
    // Trainer 2
    let team2 = trainer2.getTeam()
    let currentPokemon2 = trainer2.getActivePokemon()
    
    // ------------- //
    
    if currentPokemon1.getSpeed() >= currentPokemon2.getSpeed() {
        // Turno User
        if let userUsedMove = userUsedMove {
            battleEffect(attacker: currentPokemon1, target: currentPokemon2, move: userUsedMove, team: team2, enemy: trainer2)
            
            if victory != nil {
                printBoard(pkm1: currentPokemon1, pkm2: currentPokemon2, text: "YOU WON!")
                musicPlayerLow.pause()
                musicPlayer.changeSong(to: win)
                sleep(10)
                return
            }
            
            if let pcNewPokemonLet = pcNewPokemon {
                printBoard(pkm1: currentPokemon1, pkm2: pcNewPokemonLet, text: "YOUR OPPONENT SENT OUT \(pcNewPokemonLet.getName())!")
                trainer2.setActivePokemon(pokemon: pcNewPokemonLet)
                pcNewPokemon = nil
                return
            }
        }
        
        if let userNewPokemonLet = userNewPokemon {
            printBoard(pkm1: userNewPokemonLet, pkm2: currentPokemon2, text: "YOU SENT OUT \(userNewPokemonLet.getName())!")
            trainer1.setActivePokemon(pokemon: userNewPokemonLet)
            userNewPokemon = nil
        }
        
        // Turno PC
        if let pcUsedMove = pcUsedMove {
            battleEffect(attacker: currentPokemon2, target: currentPokemon1, move: pcUsedMove, team: team1, enemy: trainer1)
            
            if victory != nil {
                printBoard(pkm1: currentPokemon1, pkm2: currentPokemon2, text: "YOU LOST!")
                musicPlayerLow.pause()
                musicPlayer.changeSong(to: lose)
                sleep(10)
                return
            }
            
            if let userNewPokemonLet = userNewPokemon {
                printBoard(pkm1: userNewPokemonLet, pkm2: currentPokemon2, text: "YOUR \(currentPokemon1.getName()) DIED. YOU SENT OUT \(userNewPokemonLet.getName())!")
                trainer1.setActivePokemon(pokemon: userNewPokemonLet)
                userNewPokemon = nil
                return
            }
        }
    } else {
        // Turno PC
        if let pcUsedMove = pcUsedMove {
            battleEffect(attacker: currentPokemon2, target: currentPokemon1, move: pcUsedMove, team: team1, enemy: trainer1)
            
            if victory != nil {
                printBoard(pkm1: currentPokemon1, pkm2: currentPokemon2, text: "YOU LOST!")
                musicPlayerLow.pause()
                musicPlayer.changeSong(to: lose)
                sleep(10)
                return
            }
            
            if let userNewPokemonLet = userNewPokemon {
                printBoard(pkm1: userNewPokemonLet, pkm2: currentPokemon2, text: "YOUR \(currentPokemon1.getName()) DIED. YOU SENT OUT \(userNewPokemonLet.getName())!")
                trainer1.setActivePokemon(pokemon: userNewPokemonLet)
                userNewPokemon = nil
                return
            }
        }
        
        // Turno User
        if let userUsedMove = userUsedMove {
            battleEffect(attacker: currentPokemon1, target: currentPokemon2, move: userUsedMove, team: team2, enemy: trainer2)
            
            if victory != nil {
                printBoard(pkm1: currentPokemon1, pkm2: currentPokemon2, text: "YOU WON!")
                musicPlayerLow.pause()
                musicPlayer.changeSong(to: win)
                sleep(10)
                return
            }
            
            if let pcNewPokemonLet = pcNewPokemon {
                printBoard(pkm1: currentPokemon1, pkm2: pcNewPokemonLet, text: "YOUR OPPONENT SENT OUT \(pcNewPokemonLet.getName())!")
                trainer2.setActivePokemon(pokemon: pcNewPokemonLet)
                pcNewPokemon = nil
                return
            }
        }
        
        if let userNewPokemonLet = userNewPokemon {
            printBoard(pkm1: userNewPokemonLet, pkm2: currentPokemon2, text: "YOU SENT OUT \(userNewPokemonLet.getName())!")
            trainer1.setActivePokemon(pokemon: userNewPokemonLet)
            userNewPokemon = nil
        }
    }
}

func battleEffect(attacker: Pokemon, target: Pokemon, move: Move, team: [Pokemon], enemy: Trainer) {
    let result = attacker.useMove(usedMove: move, target: target)
    var pkm1: Pokemon
    var pkm2: Pokemon
    
    if enemy.id == 1 {
        pkm1 = target
        pkm2 = attacker
    } else {
        pkm1 = attacker
        pkm2 = target
    }
    
    switch result {
    case .Immune:
        printBoard(pkm1: pkm1, pkm2: pkm2, text: "\(target.getName()) is immune to \(move.getName())")
    case .Miss:
        printBoard(pkm1: pkm1, pkm2: pkm2, text: "\(attacker.getName()) missed \(move.getName())")
    case .Hit:
        musicPlayerHelper.play(song: hit)
        printBoard(pkm1: pkm1, pkm2: pkm2, text: "\(attacker.getName()) hit \(move.getName())")
    case .SuperEffective:
        musicPlayerHelper.play(song: hit)
        printBoard(pkm1: pkm1, pkm2: pkm2, text: "\(move.getName()) is super effective!")
    case .NotVeryEffective:
        musicPlayerHelper.play(song: hit)
        printBoard(pkm1: pkm1, pkm2: pkm2, text: "\(move.getName()) is not very effective...")
    default :
        print("Error")
    }
    
    if !target.getIsAlive() {
        if enemy.id == 2 {
            for pokemon in team {
                if pokemon.getIsAlive() {
                    pcNewPokemon = pokemon
                    musicPlayerHelper.play(song: out)
                    return
                }
            }
            victory = enemy
        } else {
            var count = 0
            for pokemon in team {
                if !pokemon.getIsAlive() {
                    count += 1
                }
            }
            
            if count == enemy.getTeam().count {
                victory = enemy
            } else {
                repeat {
                    if pokemonChoice(pkm1: target, pkm2: attacker, trainer: enemy) {
                        userNewPokemon = enemy.getActivePokemon()
                        return
                    }
                    
                    if userNewPokemon == nil {
                        printBoard(pkm1: pkm1, pkm2: pkm2, text: "Select a valid pokemon!")
                    }
                } while userNewPokemon == nil
                
            }
        }
    }
}
