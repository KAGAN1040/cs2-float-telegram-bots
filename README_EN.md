# CS2 Float Trackers — CSGOEmpire + BynoGame

[🇹🇷 Türkçe README](README.md)

Two Python notification-only bots that watch CS2 skin listings and send matches to **your own Telegram chat**. They never place orders or buy items.

| | CSGOEmpire | BynoGame |
|---|---|---|
| Tracking | WebSocket new-item events | Polling listing API |
| Telegram alerts | Yes | Yes |
| Float decimal filter | Yes | Yes |
| Skin keyword filter | Yes | Yes |
| Price cap | Empire Coins | TRY |
| API credentials required | Personal Empire API key | None (Telegram details only) |

## Windows quick start

1. Download the repository ZIP and extract it. Install **Python 3.10+** (enable *Add Python to PATH* on Windows).
2. Double-click `KUR.bat` to install Python dependencies and copy `.env.example` to `.env`.
3. Edit `.env` to enter **your own** Telegram bot token and chat ID; add your CSGOEmpire API key if you use that bot.
4. Open your Telegram bot chat and send `/start`.
5. Double-click `BASLAT_EMPIRE.bat`, `BASLAT_BYNOGAME.bat`, or `BASLAT_IKISI.bat`.

**Telegram bot token:** create a bot using `@BotFather` (`/newbot`). **Chat ID:** find yours via `@userinfobot`. **Empire API key:** create your own at <https://csgoempire.com/trading/apikey> (2FA may be required). No Empire key is needed for the BynoGame tracker.

## macOS / Linux

```bash
cp .env.example .env
python3 -m pip install -r requirements.txt
# edit .env with your own credentials
python3 empire/bot.py
# or, in another terminal:
python3 bynogame/bot.py
```

## Configuration

All settings are in the root `.env` file (use `.env.example` as a reference):

- Shared Telegram details: `TELEGRAM_BOT_TOKEN`, `TELEGRAM_CHAT_ID`. Optional per-bot overrides: `EMPIRE_TELEGRAM_BOT_TOKEN`, `EMPIRE_TELEGRAM_CHAT_ID`, `BYNO_TELEGRAM_BOT_TOKEN`, `BYNO_TELEGRAM_CHAT_ID`.
- CSGOEmpire: `EMPIRE_API_KEY`, `EMPIRE_API_DOMAIN`, `MAX_FLOAT`, `MIN_DECIMALS`, `MAX_PRICE_COINS`, `SKIN_KEYWORDS`.
- BynoGame: `BYNO_CHECK_INTERVAL`, `BYNO_MAX_FLOAT`, `BYNO_MIN_DECIMALS`, `BYNO_MAX_PRICE_TL`, `BYNO_SKIN_KEYWORDS`, `BYNO_PAGE_SIZE`.

`MIN_DECIMALS=3` matches `0.003000` but not `0.030000` because trailing zeros are not significant. On the Empire bot, `MAX_FLOAT=0.05` filters out floats above `0.05`.

Each bot keeps its own `sent_ids.json` file. It is **ignored by Git**, along with `.env`. Deleting state may cause old listings to be reported again.

**Caveats:** These tools rely on third-party endpoints that can change or become unavailable, and BynoGame polling may miss short-lived listings between checks. They need an active internet connection and a running process. Use the services in accordance with their terms and rate limits. API keys and bot tokens must never be committed or shared. If leaked, revoke and regenerate them immediately. See [SECURITY.md](SECURITY.md).

## Tests

```bash
python -m unittest discover -s tests -v
```

MIT license. See [LICENSE](LICENSE).
