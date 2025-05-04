func buildTeam(trainer: Trainer, pc: Pc) {
    if trainer.id == 1 {
        print("\n-------------------- [ SELECT YOUR POKEMON ] --------------------")
    } else {
        print("-------------------- [ SELECT YOUR ENEMY'S POKEMON ] --------------------")
    }
    
    var i = 0
    for p in pc.getPokemons() {
        i += 1
        print("\(i). \(p.getName())")
    }

    print("------------------------------------------------------------------")

    var choosing = true
    var team: [Pokemon] = []
    let maxTeamSize = 3

    repeat {
        print("\nSelect your Pokemon (1 to \(i) or type 0 to finish): ")
        
        guard let input = readLine(), let choice = Int(input), choice >= 0 else {
            print("Invalid input. Try again.")
            continue
        }
        
        if choice == 0 {
            if team.count == maxTeamSize {
                print("You have finished selecting Pokémon.")
                choosing = false
            } else {
                print("You need to select \(maxTeamSize) Pokémon.")
            }
        } else if choice >= 1 && choice <= i {
            if team.count < maxTeamSize && team.contains(where: { $0.getName() == pc.getPokemons()[choice - 1].getName() }) == false {
                let pkm = pc.getPokemons()[choice - 1]
                team.append(pkm)
                print("You selected \(pkm.getName())")
                print(pkm.getSprite()[1])
            } else {
                print("You can't select more than \(maxTeamSize) Pokémon nor pick the same twice.")
            }
        } else {
            print("Invalid option. Try again.")
        }
        
        if team.count == maxTeamSize {
            print("You have finished selecting Pokémon.")
            choosing = false
        }
    } while choosing
    
    trainer.createTeam(pokemon: team)
}

func printBattle(pkm1: Pokemon, pkm2: Pokemon, team1: [Pokemon], team2: [Pokemon]) {
    clear()
    hpBar(pokemon1: pkm1, pokemon2: pkm2, team1: team1, team2: team2)
    print("\n\n")
    printPokemon(pokemon1: pkm1, pokemon2: pkm2)
    print("\n")
}
