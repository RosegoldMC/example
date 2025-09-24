# Rosegold Bot Example

A template repository for creating Minecraft bots using [Rosegold.cr](https://github.com/RosegoldMC/rosegold.cr).

This example demonstrates a simple attack bot that connects to a Minecraft server and performs basic combat actions.

## Quick Start

### Option 1: Download Pre-built Binary
1. **Download the latest build** from the [Actions tab](https://github.com/RosegoldMC/example/actions) - look for the latest "Build" workflow
2. **Extract the archive** and run: `./bin/attack` (Linux) or `bin/attack.exe` (Windows)

### Option 2: Build from Source
1. **Use this template** by clicking the "Use this template" button on GitHub
2. **Clone your new repository**:
   ```bash
   git clone https://github.com/yourusername/your-bot-name.git
   cd your-bot-name
   ```

3. **Install dependencies**:
   ```bash
   shards install
   ```

4. **Configure your bot** by editing `src/attack.cr`:
   - Change `"play.civmc.net"` to your server address
   - Customize the weapon selection (currently uses `"diamond_sword"`)

5. **Build and run**:
   ```bash
   shards build
   ./bin/attack
   ```

## What This Bot Does

The example bot:
- Connects to your specified Minecraft server
- Automatically eats food when hungry
- Selects a diamond sword from inventory
- Attacks every 5 game ticks (4 attacks per second)
- Displays current position and tool durability

## Development

### Building
```bash
shards build
```

### Testing
```bash
crystal spec
```

### Formatting
```bash
crystal tool format
```

## Creating Your Own Bot

This template provides a foundation for building Minecraft bots with Rosegold.cr. You can:

1. **Modify the existing attack bot** for different combat strategies
2. **Create new bot types** by adding additional target files in `shard.yml`
3. **Add more complex behaviors** using Rosegold's API

See the [Rosegold.cr documentation](https://github.com/RosegoldMC/rosegold.cr) for available features and APIs.

## License

MIT License - see [LICENSE](LICENSE) for details.

## Disclaimer

This software is for educational purposes. Ensure you comply with your server's rules and Minecraft's Terms of Service when using bots.
