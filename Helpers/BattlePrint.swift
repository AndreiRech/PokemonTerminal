func printPokemon(pokemon1: Pokemon, pokemon2: Pokemon) {
    let pkm1B = pokemon1.getSprite()[0]
    let pkm2F = pokemon2.getSprite()[1]
    
    printInLines(string1: pkm1B, string2: pkm2F, amount: 25)
}

func hpBar(pokemon1: Pokemon, pokemon2: Pokemon, team1: [Pokemon], team2: [Pokemon]) {
    let hp1 = pokemon1.getHealth()
    let hp2 = pokemon2.getHealth()
    
    let currentHp1 = pokemon1.getCurrentHealth()
    let currentHp2 = pokemon2.getCurrentHealth()
    
    let pkmName1 = pokemon1.getName()
    let pkmName2 = pokemon2.getName()
        
    let bar1 = createHpBar(currentHp: currentHp1, maxHp: hp1, pkmName: pkmName1, team: team1)
    let bar2 = createHpBar(currentHp: currentHp2, maxHp: hp2, pkmName: pkmName2, team: team2)
        
    printInLines(string1: bar1, string2: bar2, amount: 50)
}

func createHpBar(currentHp: Int, maxHp: Int, pkmName: String, team: [Pokemon]) -> String {
    let hpRatio = Double(currentHp) / Double(maxHp)
    let barLength = 10
    var filledBlocks = Int(hpRatio * Double(barLength))
    let emptyBlocks = barLength - filledBlocks
    
    var count = 0
    for pokemon in team {
        if pokemon.getIsAlive() {
            count += 1
        }
    }
    
    let redCircles = String(repeating: "🔴", count: count)
    let whiteCircles = String(repeating: "⚪️", count: 3 - count)
    let fullTop = pkmName + "                         " + redCircles + whiteCircles
     
    var color: String = ""
    if hpRatio > 0.50 {
        color = "🟩"
    } else if hpRatio > 0.25 && hpRatio <= 0.50 {
        color = "🟨"
    } else {
        color = "🟥"
    }
    
    if filledBlocks == 0 && currentHp > 0 {
        filledBlocks = 1
    }
    
    let bar = String(repeating: color, count: filledBlocks) + String(repeating: "⬜", count: emptyBlocks)
    
    let fullBar = """
                ═════════════════════ஜ۩۞۩ஜ════════════════════
                  \(fullTop)     
                         ----------------------               
                 ◓  HP | \(bar) |      ♂️ Lv.50
                         ----------------------               
                ══════════════════════════════════════════════
    """
    
    return fullBar
}
