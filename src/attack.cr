require "rosegold"

# A simple bot that attacks at the location it is looking at
# and then waits 5 ticks before attacking again

SPECTATE_HOST = ENV.fetch "SPECTATE_HOST", "0.0.0.0"
SPECTATE_PORT = ENV.fetch("SPECTATE_PORT", "25566").to_i

spectate_server = Rosegold::SpectateServer.new(SPECTATE_HOST, SPECTATE_PORT)
spectate_server.start

client = Rosegold::Client.new "play.civmc.net"
spectate_server.attach_client client
bot = Rosegold::Bot.new(client)

bot.join_game
sleep 3.seconds

look = bot.look
durability = bot.main_hand.durability

while bot.connected?
  bot.eat!
  bot.look = look
  bot.inventory.pick! "diamond_sword"
  bot.attack
  bot.wait_ticks 5

  if bot.main_hand.durability < durability
    puts "Attacked! Durability decreased from #{durability} to #{bot.main_hand.durability}"
    durability = bot.main_hand.durability
  end
end
