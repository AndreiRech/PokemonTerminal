let pc = Pc()
let pc2 = Pc()
var trainer1 = Trainer(id: 1)
var trainer2 = Trainer(id: 2)

let basePath = "/Users/ticpucrs/Desktop/Pokemon/PokemonGame/Music/"

let battle = basePath + "Battle.mp3"
let win = basePath + "PokemonWinMusic.mp3"
let lose = basePath + "PokemonLossMusic.mp3"
let criticalHealth = basePath + "CriticalHealth.mp3"
let healM = basePath + "Heal.mp3"
let hit = basePath + "Hit.mp3"
let hitNot = basePath + "HitNot.mp3"
let out = basePath + "Out.mp3"

let musicPlayer = Player()
let musicPlayerLow = Player()
let musicPlayerHelper = Player()

buildTeam(trainer: trainer1, pc: pc)
buildTeam(trainer: trainer2, pc: pc2)

game(trainer1: trainer1, trainer2: trainer2)
