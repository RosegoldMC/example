require "rosegold"

# A simple bot that stays connected and eats when hungry

SPECTATE_HOST = ENV.fetch "SPECTATE_HOST", "0.0.0.0"
SPECTATE_PORT = ENV.fetch("SPECTATE_PORT", "25566").to_i

# Autoreconnect configuration
INITIAL_RETRY_DELAY = 5.seconds
MAX_RETRY_DELAY     = 5.minutes

spectate_server = Rosegold::SpectateServer.new(SPECTATE_HOST, SPECTATE_PORT)
spectate_server.start

retry_delay = INITIAL_RETRY_DELAY

# Infinite reconnection loop with exponential backoff
loop do
  begin
    client = Rosegold::Client.new "play.civmc.net"
    spectate_server.attach_client client
    bot = Rosegold::Bot.new(client)

    bot.join_game
    sleep 3.seconds

    # Reset backoff on successful connection
    retry_delay = INITIAL_RETRY_DELAY
    puts "Connected successfully!"

    while bot.connected?
      bot.eat!
      bot.wait_ticks 20
    end

    # If we reach here, bot disconnected gracefully
    puts "Disconnected, retrying in #{retry_delay.total_seconds} seconds..."
    sleep retry_delay
    retry_delay = [retry_delay * 2, MAX_RETRY_DELAY].min
  rescue e
    # Handle any exceptions (IO errors, connection failures, etc.)
    puts "Error: #{e.message}, retrying in #{retry_delay.total_seconds} seconds..."
    sleep retry_delay
    retry_delay = [retry_delay * 2, MAX_RETRY_DELAY].min
  end
end
