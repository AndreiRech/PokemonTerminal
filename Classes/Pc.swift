class Pc {
    private var pokemons: [Pokemon] = []
    
    private var moves: [String: Move] = [:]
    
    init() {
        self.moves = createMoves()
        self.pokemons = createPokemon()
    }
    
    func createMoves() -> [String: Move] {
        var moves: [String: Move] = [:]
        
        // Fortes [ 120 DN - 5 PP - 65 ACC ]
        moves["Thunder"] = Move(name: "Thunder", type: Types.Electric, power: 120, pp: 5, accuracy: 65)
        moves["Fire Blast"] = Move(name: "Fire Blast", type: Types.Fire, power: 120, pp: 5, accuracy: 65)
        moves["Hydro Pump"] = Move(name: "Hydro Pump", type: Types.Water, power: 120, pp: 5, accuracy: 65)
        moves["Blizzard"] = Move(name: "Blizzard", type: Types.Ice, power: 120, pp: 5, accuracy: 65)
        moves["Psystrike"] = Move(name: "Psystrike", type: Types.Psychic, power: 120, pp: 5, accuracy: 65)
        moves["Poltergeist"] = Move(name: "Poltergeist", type: Types.Ghost, power: 120, pp: 5, accuracy: 65)
        moves["Earthquake"] = Move(name: "Earthquake", type: Types.Ground, power: 120, pp: 5, accuracy: 65)
        moves["SolarBeam"] = Move(name: "SolarBeam", type: Types.Grass, power: 120, pp: 5, accuracy: 65)
        moves["Diamond Storm"] = Move(name: "Diamond Storm", type: Types.Rock, power: 120, pp: 5, accuracy: 65)
        moves["Hyper Beam"] = Move(name: "Hyper Beam", type: Types.Normal, power: 120, pp: 5, accuracy: 65)
        moves["Super Power"] = Move(name: "Super Power", type: Types.Fighting, power: 120, pp: 5, accuracy: 65)
        moves["Outrage"] = Move(name: "Outrage", type: Types.Dragon, power: 120, pp: 5, accuracy: 65)
        moves["First Impression"] = Move(name: "First Impression", type: Types.Normal, power: 120, pp: 5, accuracy: 65)
        moves["Brave Bird"] = Move(name: "Brave Bird", type: Types.Flying, power: 120, pp: 5, accuracy: 65)
        moves["Gunk Shot"] = Move(name: "Gunk Shot", type: Types.Poison, power: 120, pp: 5, accuracy: 65)
        
        // Padroes [ 80 DN - 10 PP - 85 ACC ]
        moves["Thunderbolt"] = Move(name: "Thunderbolt", type: Types.Electric, power: 80, pp: 10, accuracy: 85)
        moves["Flamethrower"] = Move(name: "Flamethrower", type: Types.Fire, power: 80, pp: 10, accuracy: 85)
        moves["Surf"] = Move(name: "Surf", type: Types.Water, power: 80, pp: 10, accuracy: 85)
        moves["Ice Beam"] = Move(name: "Ice Beam", type: Types.Ice, power: 80, pp: 10, accuracy: 85)
        moves["Psychic"] = Move(name: "Psychic", type: Types.Psychic, power: 80, pp: 10, accuracy: 85)
        moves["Shadow Ball"] = Move(name: "Shadow Ball", type: Types.Ghost, power: 80, pp: 10, accuracy: 85)
        moves["Earth Power"] = Move(name: "Earth Power", type: Types.Ground, power: 80, pp: 10, accuracy: 85)
        moves["Leaf Blade"] = Move(name: "Leaf Blade", type: Types.Grass, power: 80, pp: 10, accuracy: 85)
        moves["Rock Tomb"] = Move(name: "Rock Tomb", type: Types.Rock, power: 80, pp: 10, accuracy: 85)
        moves["Body Press"] = Move(name: "Body Press", type: Types.Fighting, power: 80, pp: 10, accuracy: 85)
        moves["Body Slam"] = Move(name: "Body Slam", type: Types.Normal, power: 80, pp: 10, accuracy: 85)
        moves["Dragon Pulse"] = Move(name: "Dragon Pulse", type: Types.Dragon, power: 80, pp: 10, accuracy: 85)
        moves["X Scissor"] = Move(name: "X Scissor", type: Types.Bug, power: 80, pp: 10, accuracy: 85)
        moves["Wing Attack"] = Move(name: "Wing Attack", type: Types.Flying, power: 80, pp: 10, accuracy: 85)
        moves["Sludge Wave"] = Move(name: "Sludge Wave", type: Types.Poison, power: 80, pp: 10, accuracy: 85)
        
        // Fracos [ 40 DN - 20 PP - 100 ACC ]
        moves["Thunder Shock"] = Move(name: "Thunder Shock", type: Types.Electric, power: 40, pp: 20, accuracy: 100)
        moves["Ember"] = Move(name: "Ember", type: Types.Fire, power: 40, pp: 20, accuracy: 100)
        moves["Bubble Beam"] = Move(name: "Bubble Beam", type: Types.Water, power: 40, pp: 20, accuracy: 100)
        moves["Icy Wind"] = Move(name: "Icy Wind", type: Types.Ice, power: 40, pp: 20, accuracy: 100)
        moves["Psyshock"] = Move(name: "Psyshock", type: Types.Psychic, power: 40, pp: 20, accuracy: 100)
        moves["Astonish"] = Move(name: "Astonish", type: Types.Ghost, power: 40, pp: 20, accuracy: 100)
        moves["Mud Slap"] = Move(name: "Mud Slap", type: Types.Ground, power: 40, pp: 20, accuracy: 100)
        moves["Vine Whip"] = Move(name: "Vine Whip", type: Types.Grass, power: 40, pp: 20, accuracy: 100)
        moves["Smack Down"] = Move(name: "Smack Down", type: Types.Rock, power: 40, pp: 20, accuracy: 100)
        moves["Low Kick"] = Move(name: "Low Kick", type: Types.Fighting, power: 40, pp: 20, accuracy: 100)
        moves["Tackle"] = Move(name: "Tackle", type: Types.Normal, power: 40, pp: 20, accuracy: 100)
        moves["Dragon Rage"] = Move(name: "Dragon Rage", type: Types.Dragon, power: 40, pp: 20, accuracy: 100)
        moves["Bug Bite"] = Move(name: "Bug Bite", type: Types.Bug, power: 40, pp: 20, accuracy: 100)
        moves["Gust"] = Move(name: "Gust", type: Types.Flying, power: 40, pp: 20, accuracy: 100)
        moves["Poison Sting"] = Move(name: "Poison Sting", type: Types.Poison, power: 40, pp: 20, accuracy: 100)
        
        return moves
    }
    
    func createPokemon() -> [Pokemon] {
        var pokemons: [Pokemon] = []
        
        var move1 = Move(name: "Fire Blast", type: Types.Fire, power: 120, pp: 5, accuracy: 65)
        var move2 = Move(name: "Flamethrower", type: Types.Fire, power: 80, pp: 10, accuracy: 85)
        var move3 = Move(name: "Wing Attack", type: Types.Flying, power: 80, pp: 10, accuracy: 85)
        var move4 = Move(name: "Tackle", type: Types.Normal, power: 40, pp: 20, accuracy: 100)
        pokemons.append(Pokemon(name: "Charizard", health: 220, type: Types.Fire, moves: [move1, move2, move3, move4], speed: 10, sprites: [charizardB, charizardF]))
        
        move1 = Move(name: "SolarBeam", type: Types.Grass, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "Sludge Wave", type: Types.Poison, power: 80, pp: 10, accuracy: 85)
        move3 = Move(name: "Vine Whip", type: Types.Grass, power: 40, pp: 20, accuracy: 100)
        move4 = Move(name: "Tackle", type: Types.Normal, power: 40, pp: 20, accuracy: 100)
        pokemons.append(Pokemon(name: "Venusaur", health: 300, type: Types.Grass, moves: [move1, move2, move3, move4], speed: 4, sprites: [venusaurB, venusaurF]))
        
        move1 = Move(name: "Hydro Pump", type: Types.Water, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "Surf", type: Types.Water, power: 80, pp: 10, accuracy: 85)
        move3 = Move(name: "Bubble Beam", type: Types.Water, power: 40, pp: 20, accuracy: 100)
        move4 = Move(name: "Tackle", type: Types.Normal, power: 40, pp: 20, accuracy: 100)
        pokemons.append(Pokemon(name: "Blastoise", health: 250, type: Types.Water, moves: [move1, move2, move3, move4], speed: 7, sprites: [blastoiseB, blastoiseF]))
        
        move1 = Move(name: "Thunder", type: Types.Electric, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "Thunderbolt", type: Types.Electric, power: 80, pp: 10, accuracy: 85)
        move3 = Move(name: "Thunder Shock", type: Types.Electric, power: 40, pp: 20, accuracy: 100)
        move4 = Move(name: "Body Slam", type: Types.Normal, power: 80, pp: 10, accuracy: 85)
        pokemons.append(Pokemon(name: "Pikachu", health: 200, type: Types.Electric, moves: [move1, move2, move3, move4], speed: 15, sprites: [pikachuB, pikachuF]))
        
        move1 = Move(name: "Brave Bird", type: Types.Flying, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "Gust", type: Types.Flying, power: 40, pp: 20, accuracy: 100)
        move3 = Move(name: "Body Slam", type: Types.Normal, power: 80, pp: 10, accuracy: 85)
        move4 = Move(name: "Hyper Beam", type: Types.Normal, power: 120, pp: 5, accuracy: 65)
        pokemons.append(Pokemon(name: "Pidgeot", health: 235, type: Types.Flying, moves: [move1, move2, move3, move4], speed: 8, sprites: [pidgeotB, pidgeotF]))
        
        move1 = Move(name: "Body Press", type: Types.Fighting, power: 80, pp: 10, accuracy: 85)
        move2 = Move(name: "Astonish", type: Types.Ghost, power: 40, pp: 20, accuracy: 100)
        move3 = Move(name: "Body Slam", type: Types.Normal, power: 80, pp: 10, accuracy: 85)
        move4 = Move(name: "Tackle", type: Types.Normal, power: 40, pp: 20, accuracy: 100)
        pokemons.append(Pokemon(name: "Snorlax", health: 400, type: Types.Normal, moves: [move1, move2, move3, move4], speed: 1, sprites: [snorlaxB, snorlaxF]))
        
        move1 = Move(name: "Blizzard", type: Types.Ice, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "Icy Wind", type: Types.Ice, power: 40, pp: 20, accuracy: 100)
        move3 = Move(name: "Surf", type: Types.Water, power: 80, pp: 10, accuracy: 85)
        move4 = Move(name: "Body Slam", type: Types.Normal, power: 80, pp: 10, accuracy: 85)
        pokemons.append(Pokemon(name: "Lapras", health: 280, type: Types.Ice, moves: [move1, move2, move3, move4], speed: 5, sprites: [laprasB, laprasF]))
        
        move1 = Move(name: "Psystrike", type: Types.Psychic, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "Psychic", type: Types.Psychic, power: 80, pp: 10, accuracy: 85)
        move3 = Move(name: "Shadow Ball", type: Types.Ghost, power: 80, pp: 10, accuracy: 85)
        move4 = Move(name: "Hyper Beam", type: Types.Normal, power: 120, pp: 5, accuracy: 65)
        pokemons.append(Pokemon(name: "MewTwo", health: 270, type: Types.Psychic, moves: [move1, move2, move3, move4], speed: 8, sprites: [mewtwoB, mewtwoF]))
        
        move1 = Move(name: "Poltergeist", type: Types.Ghost, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "Sludge Wave", type: Types.Poison, power: 80, pp: 10, accuracy: 85)
        move3 = Move(name: "Psyshock", type: Types.Psychic, power: 40, pp: 20, accuracy: 100)
        move4 = Move(name: "Shadow Ball", type: Types.Ghost, power: 80, pp: 10, accuracy: 85)
        pokemons.append(Pokemon(name: "Gengar", health: 240, type: Types.Ghost, moves: [move1, move2, move3, move4], speed: 7, sprites: [gengarB, gengarF]))
        
        move1 = Move(name: "Earthquake", type: Types.Ground, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "Rock Tomb", type: Types.Rock, power: 80, pp: 10, accuracy: 85)
        move3 = Move(name: "Body Press", type: Types.Fighting, power: 80, pp: 10, accuracy: 85)
        move4 = Move(name: "Mud Slap", type: Types.Ground, power: 40, pp: 20, accuracy: 100)
        pokemons.append(Pokemon(name: "Rhydon", health: 290, type: Types.Ground, moves: [move1, move2, move3, move4], speed: 4, sprites: [rhydonB, rhydonF]))
        
        move1 = Move(name: "Diamond Storm", type: Types.Rock, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "Body Slam", type: Types.Normal, power: 80, pp: 10, accuracy: 85)
        move3 = Move(name: "Rock Tomb", type: Types.Rock, power: 80, pp: 10, accuracy: 85)
        move4 = Move(name: "Mud Slap", type: Types.Ground, power: 40, pp: 20, accuracy: 100)
        pokemons.append(Pokemon(name: "Onix", health: 270, type: Types.Rock, moves: [move1, move2, move3, move4], speed: 6, sprites: [onixB, onixF]))
        
        move1 = Move(name: "Super Power", type: Types.Fighting, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "X Scissor", type: Types.Bug, power: 80, pp: 10, accuracy: 85)
        move3 = Move(name: "Low Kick", type: Types.Fighting, power: 40, pp: 20, accuracy: 100)
        move4 = Move(name: "Rock Tomb", type: Types.Rock, power: 80, pp: 10, accuracy: 85)
        pokemons.append(Pokemon(name: "Machamp", health: 240, type: Types.Fighting, moves: [move1, move2, move3, move4], speed: 6, sprites: [machampB, machampF]))
        
        move1 = Move(name: "Outrage", type: Types.Dragon, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "Hyper Beam", type: Types.Normal, power: 120, pp: 5, accuracy: 65)
        move3 = Move(name: "Flamethrower", type: Types.Fire, power: 80, pp: 10, accuracy: 85)
        move4 = Move(name: "Gust", type: Types.Flying, power: 40, pp: 20, accuracy: 100)
        pokemons.append(Pokemon(name: "Dragonite", health: 280, type: Types.Dragon, moves: [move1, move2, move3, move4], speed: 7, sprites: [dragoniteB, dragoniteF]))
        
        move1 = Move(name: "First Impression", type: Types.Normal, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "Wing Attack", type: Types.Flying, power: 80, pp: 10, accuracy: 85)
        move3 = Move(name: "Astonish", type: Types.Ghost, power: 40, pp: 20, accuracy: 100)
        move4 = Move(name: "Poison Sting", type: Types.Poison, power: 40, pp: 20, accuracy: 100)
        pokemons.append(Pokemon(name: "Butterfree", health: 220, type: Types.Bug, moves: [move1, move2, move3, move4], speed: 9, sprites: [butterfreeB, butterfreeF]))
        
        move1 = Move(name: "Gunk Shot", type: Types.Poison, power: 120, pp: 5, accuracy: 65)
        move2 = Move(name: "Sludge Wave", type: Types.Poison, power: 80, pp: 10, accuracy: 85)
        move3 = Move(name: "Vine Whip", type: Types.Grass, power: 40, pp: 20, accuracy: 100)
        move4 = Move(name: "Dragon Rage", type: Types.Dragon, power: 40, pp: 20, accuracy: 100)
        pokemons.append(Pokemon(name: "Arbok", health: 250, type: Types.Poison, moves: [move1, move2, move3, move4], self.moves["Poison Sting"]!], speed: 8, sprites: [arbokB, arbokF]))
        
        return pokemons
    }
    
    func getPokemons() -> [Pokemon] { return self.pokemons }
}
