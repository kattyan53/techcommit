class Character
  attr_accessor :name, :hp, :attack_point, :last_messeage
  def initialize(name, hp, attack_point, last_messeage)
    @name = name
    @hp = hp
    @attack_point = attack_point
    @last_messeage = last_messeage
  end

  def display_hp
    pp "#{name}：HP#{hp} 攻撃力#{attack_point}"
  end

  def attack(receiver)
    receiver.hp = receiver.hp - attack_point
    pp "#{name}の攻撃！#{receiver.name}に#{attack_point}のダメージ"
  end

  def alive?
    return true if hp > 0
    pp "#{name}が死んだ #{last_messeage}"
    false
  end
end

# ここからstart
p '戦闘開始！'

hero = Character.new('勇者', 1000, 15, '世界は闇に包まれた')
devil = Character.new('魔王', 500, 9, '世界に平和が訪れた')

while (hero.hp > 0 && devil.hp > 0)
  # 勇者と魔王のHP表示
  [hero, devil].each { |character| character.display_hp }
  # 勇者の攻撃
  hero.attack(devil)
  break unless devil.alive?
  # 魔王の攻撃
  devil.attack(hero)
  hero.alive?
end
