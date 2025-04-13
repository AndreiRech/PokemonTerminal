class Pokemon {
    private var name: String
    private var health: Int
    private var type: Types
    private var moves: [Move]
    private var speed: Int
    private var sprites: [String]
    private var weakness: [Types: Double] = [:]
    private var currentHealth: Int
    private var isAlive: Bool = true
    
    init (name: String, health: Int, type: Types, moves: [Move], speed: Int, sprites: [String]) {
        self.name = name
        self.health = health
        self.currentHealth = health
        self.type = type
        self.moves = moves
        self.speed = speed
        self.sprites = sprites
        setWeakness()
    }
    
    func getName() -> String { return self.name }
    func getHealth() -> Int { return self.health }
    func getType() -> Types { return self.type }
    func getMoves() -> [Move] { return self.moves }
    func getSpeed() -> Int { return self.speed }
    func getSprite() -> [String] { return self.sprites }
    func getWeakness() -> [Types: Double] { return self.weakness }
    func getCurrentHealth() -> Int { return self.currentHealth }
    func getIsAlive() -> Bool { return self.isAlive }
    
    func setWeakness() {
        self.weakness = self.type.multiplier()
    }
    
    func willHit(usedMove: Move) -> Bool {
        let accuracy: Int = usedMove.getAccuracy()
        let randomNumber: Int = Int.random(in: 1...100)
        
        return randomNumber <= accuracy
    }
    
    func isCritic() -> Double {
        let randomNumber: Int = Int.random(in: 1...100)
        
        return randomNumber <= 20 ? 1.5 : 1.0
    }
    
    func useMove(usedMove: Move, target: Pokemon) -> ResultAttack {
        var resultAttack: ResultAttack
        
        if !usedMove.reducePp() {
            return ResultAttack.NoPP
        }
        
        if !willHit(usedMove: usedMove) {
            resultAttack = ResultAttack.Miss
            return resultAttack
        }
        
        let moveDamage: Int = usedMove.getPower()
        let moveType: Types = usedMove.getType()
        
        let targetWeakness = target.getWeakness()
        let weaknessMove = targetWeakness[moveType]
        
        switch (weaknessMove) {
        case 0.5:
            resultAttack = .NotVeryEffective
        case 2:
            resultAttack = .SuperEffective
        case 0:
            resultAttack = .Immune
        default:
            resultAttack = .Hit
        }
        
        var damage: Int = 0
        if let weaknessMove = weaknessMove {
            damage += moveDamage * Int(weaknessMove)
        } else {
            damage += moveDamage
        }
        
        damage = Int(Double(damage) * isCritic())
        
        target.changeHealth(amount: -damage)
        return resultAttack
    }
    
    func changeHealth(amount: Int) {
        self.currentHealth += amount
        
        if self.currentHealth <= 0 {
            self.currentHealth = 0
            self.isAlive = false
        } else if self.currentHealth > self.health {
            self.currentHealth = self.health
        }
    }
}
