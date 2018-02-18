# m0rkcoin

## Roadmap/Plans

- Build and publish daemon and wallet [(download)](https://github.com/MarcDufresne/m0rkcoin/releases)
  - [X] Windows
  - [ ] macOS
  - [X] Linux
- Build pool website
  - [X] https://mine.m0rk.space
  - [ ] Add link to daemon/wallet/landing page
- Windows Easy Miner [(download)](https://github.com/m0rkcoin/cryptonote-easy-miner/releases)
- GUI Wallet [(download)](https://github.com/m0rkcoin/m0rkcoin-wallet-gui/releases)
- Landing Page
- Tip Bot
  - [X] Discord [Repo](https://github.com/MarcDufresne/m0rkcoin-tip-bot)
- Logo
- Blockchain Explorer
- Transaction Explorer

## Running the daemon

```bash
./m0rkcoind
```

## Generating a Wallet

### Using the GUI Wallet

See [the GUI wallet's repo](https://github.com/m0rkcoin/m0rkcoin-wallet-gui)

### Using simplewallet

```bash
./simplewallet --wallet-file <file-path> -g
```

You will have to input a password in the prompt, don't forget it!

### Using walletd

*Soon:tm:*


## Using your wallet

### With the GUI Wallet

See [the GUI wallet's repo](https://github.com/m0rkcoin/m0rkcoin-wallet-gui)

### With simplewallet

```bash
./simplewallet --wallet-file <file-path> [--password <password>]
```

### With walletd

*Soon:tm:*

## Mining locally

With the daemon running:
```bash
./miner --address <wallet-address>
```

## Mining with a pool

Official Pool: https://mine.m0rk.space

### Windows

**CPU**: Windows Easy Miner [(download)](https://github.com/MarcDufresne/cryptonote-easy-miner/releases)


**NVIDIA**: 
- Download [ccminer](https://github.com/tpruvot/ccminer/releases)
- Extract and open a command line from the extracted directory
- Run
```bash
./ccminer-x64.exe -a cryptonight -o stratum+tcp://mine.m0rk.space:5555 -u <wallet_address> -p x
```

**AMD**: 

### macOS

**CPU**: 
- Using Docker
```bash
docker run -d --name some-wolf-cpuminer-multi minecoins/wolf-cpuminer-multi -a cryptonight -o stratum+tcp://mine.m0rk.space:3333 -u <wallet_address> -p x
```

### Linux

**CPU**: [CPUMiner-Multi](https://github.com/tpruvot/cpuminer-multi)

## Compiling m0rkcoin

On Windows, see [these instructions](https://github.com/m0rkcoin/m0rkcoin/blob/master/docs/windows-build.md)
