
require('pry-byebug')
require_relative('space_cowboy.rb')


bounty1 = Bounty.new({
  'name' => 'Han Solo',
  'species' => 'Human',
  'bounty_value' => '9',
  'danger_level' => '6',
  'last_known_location' => 'Endor System',
  'home_world' => 'Earth',
  'favourite_weapon' => 'Blaster'
  })

bounty1.save()


bounty2 = Bounty.new({
  'name' => 'Rick Sanchez',
  'species' => 'Human',
  'bounty_value' => '11',
  'danger_level' => '11',
  'last_known_location' => 'Squanch',
  'home_world' => 'Earth',
  'favourite_weapon' => 'Particle Ray'
  })

bounty2.save()





bounty3 = Bounty.new({
  'name' => 'Alf',
  'species' => 'Furry',
  'bounty_value' => '7',
  'danger_level' => '4',
  'last_known_location' => 'Beaverton',
  'home_world' => 'Mars',
  'favourite_weapon' => 'Chompers'
  })

bounty3.save()


binding.pry
nil