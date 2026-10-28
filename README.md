# 🎯 CS2 Float Takip Botları — CSGOEmpire + BynoGame

[🇬🇧 English README](README_EN.md)

CS2 skin ilanlarını izleyip seçtiğin **float / skin adı / fiyat** filtrelerine uyan ilanları **Telegram'a bildiren** iki bağımsız, açık kaynak Python botu.

> **Bilgilendirme:** Botlar **yalnızca bildirim** gönderir. Otomatik satın alma, teklif verme, hesap girişi, Steam şifresi isteme gibi işlemler yapmaz. İlgili sitelerle resmi bir ortaklığı yoktur. Pazar yeri API'leri değişirse kodun güncellenmesi gerekebilir.

## ✨ Özellikler

| | CSGOEmpire | BynoGame |
|---|---|---|
| Yöntem | WebSocket / yeni ilan olayları | HTTP ile periyodik sorgu |
| Bildirim | Telegram | Telegram |
| Float filtresi | ✅ | ✅ |
| Minimum anlamlı ondalık | ✅ | ✅ |
| Skin adına göre filtre | ✅ | ✅ |
| Fiyat sınırı | Empire Coin | TL |
| Aynı ilanı yeniden göndermeme | ✅ | ✅ |
| Gerekli kimlik bilgisi | Empire API key + Telegram bilgileri | Sadece Telegram bilgileri |

## 📥 Windows'ta kurulum

1. Bu sayfadan **Code → Download ZIP** ile projeyi indir veya `git clone` ile klonla.
2. **Python 3.10 veya üzeri** kur. Kurarken Windows'ta **Add Python to PATH** seçeneğini işaretle.
3. Proje klasöründeki **`KUR.bat`** dosyasına çift tıkla. Bu dosya kütüphaneleri kurar ve yoksa `.env` dosyasını oluşturur.
4. `.env` dosyasını Not Defteri ile aç ve aşağıdaki bilgileri **kendininkilerle** doldur.
5. Telegram'da **kendi botuna `/start` gönder**.
6. Çalıştırmak istediğin dosyaya çift tıkla:
   - **`BASLAT_EMPIRE.bat`** — sadece CSGOEmpire
   - **`BASLAT_BYNOGAME.bat`** — sadece BynoGame
   - **`BASLAT_IKISI.bat`** — ikisini de ayrı pencerelerde çalıştırır

**Çalışan botu durdurmak:** Pencerede `Ctrl+C`. Bilgisayarın, internet bağlantısının ve bot işleminin açık kalması gerekir.

## 🔐 Kendi bilgilerini nasıl alırsın?

**1. Telegram bot token:** Telegram uygulamasında **@BotFather** ile sohbet başlat, `/newbot` komutunu kullan. Sana verdiği tokeni `.env` içindeki `TELEGRAM_BOT_TOKEN=` satırına yaz.

**2. Telegram Chat ID:** Telegram'da **@userinfobot** ile kendi sayısal sohbet/kullanıcı ID'ni öğren. `.env` içinde `TELEGRAM_CHAT_ID=` karşısına yaz. Bildirim gönderecek botuna Telegram'dan **`/start`** gönder. Gruplar için grup chat ID'si farklı olabilir; botun gruba ekli ve mesaj gönderme yetkili olması gerekir.

**3. CSGOEmpire API key (yalnızca Empire botu):** Kendi hesabında `https://csgoempire.com/trading/apikey` adresinden API anahtarı oluştur; site gerekli görürse 2FA'yı etkinleştir. Bunu `EMPIRE_API_KEY=` satırına yaz. Bazı ağlarda/hesaplarda CSGOEmpire erişimi bölgesel olarak sınırlı olabilir.

**Örnek (`.env` içerisindeki boş değerleri doldur):**

```dotenv
TELEGRAM_BOT_TOKEN=BURAYA_KENDI_BOT_TOKENIN
TELEGRAM_CHAT_ID=BURAYA_KENDI_CHAT_IDN
EMPIRE_API_KEY=BURAYA_KENDI_EMPIRE_API_KEYIN
```

> **Asla** kişisel `.env` dosyanı, gerçek tokenlerini veya API anahtarını GitHub'a yükleme. Depodaki `.env.example` sadece boş bir şablondur.

## ⚙️ Filtre ayarları

Ayarlar proje kökündeki **`.env`** dosyasından değiştirilir.

| Değişken | Varsayılan | Açıklama |
|---|---|---|
| `EMPIRE_API_DOMAIN` | `csgoempire.com` | API alan adı; erişimin varsa `.gg` veya `.tv` denenebilir, çalışacağı garanti değil |
| `MAX_FLOAT` | `0.05` | Empire: `0 < float <= 0.05` |
| `MIN_DECIMALS` | `3` | Empire: sondaki sıfırlar hariç en az 3 basamak |
| `MAX_PRICE_COINS` | `0` | Empire: Coin olarak fiyat üst sınırı (`0` = sınırsız) |
| `SKIN_KEYWORDS` | boş | Empire: virgülle ayrılan arama kelimeleri; boş = tümü |
| `BYNO_CHECK_INTERVAL` | `20` | BynoGame: sorgular arası saniye (en az 5) |
| `BYNO_MIN_DECIMALS` | `3` | BynoGame: anlamlı ondalık sayısı |
| `BYNO_MAX_FLOAT` | `1` | BynoGame: en yüksek float; `1` = ek limit yok |
| `BYNO_MAX_PRICE_TL` | `0` | BynoGame: TL fiyat üst sınırı (`0` = sınırsız) |
| `BYNO_SKIN_KEYWORDS` | boş | BynoGame: ör. `AK-47,AWP`; boş = tümü |
| `BYNO_PAGE_SIZE` | `20` | Her kontrolde bakılan son ilan sayısı (1–100) |

**Float örneği:** `MIN_DECIMALS=3` ise `0.003000` geçer; `0.030000` geçmez. Buradaki hesap sondaki gereksiz sıfırları saymaz. `MAX_FLOAT=0.05` seçildiyse `0.061000` elenir.

**İki botu farklı Telegram hesaplarına yönlendirmek:** Ortak `TELEGRAM_BOT_TOKEN` ve `TELEGRAM_CHAT_ID` yerine veya bunlara ek olarak `EMPIRE_TELEGRAM_BOT_TOKEN`, `EMPIRE_TELEGRAM_CHAT_ID`, `BYNO_TELEGRAM_BOT_TOKEN`, `BYNO_TELEGRAM_CHAT_ID` değerleri tanımlanabilir. Her botun kendine özel değeri varsa ortak değerin önüne geçer.

## 💻 macOS / Linux / terminalden çalıştırma

```bash
cp .env.example .env
python3 -m pip install -r requirements.txt
# .env dosyasini duzenle
python3 empire/bot.py
# veya baska terminalde:
python3 bynogame/bot.py
```

Windows terminalinden de `py -3 empire/bot.py` ve `py -3 bynogame/bot.py` komutları kullanılabilir.

## 📁 Klasör yapısı

```text
cs2-float-telegram-bots/
├── .env.example              # Herkesin kendisi dolduracagi sablon
├── .gitignore                # Gizli ve yerel dosyalar Git'e girmez
├── README.md
├── SECURITY.md
├── GITHUBA_YUKLE.md          # Repo sahibi icin yukleme adimlari
├── LICENSE
├── requirements.txt
├── KUR.bat
├── BASLAT_EMPIRE.bat
├── BASLAT_BYNOGAME.bat
├── BASLAT_IKISI.bat
├── empire/
│   └── bot.py               # CSGOEmpire WebSocket izleyici
├── bynogame/
│   └── bot.py               # BynoGame yeni ilan izleyici
└── tests/
    └── test_filters.py
```

`empire/sent_ids.json` ve `bynogame/sent_ids.json` çalışırken otomatik oluşur. Her bot kendi ilan geçmişini tutar; **GitHub'a yüklenmez**. Bu dosyaları silersen geçmişte bildirilen ilanlar tekrar gelebilir.

## ❓ Sık sorulanlar

**Telegram'a mesaj gelmiyor:** `.env` değerlerini kontrol et, `/start` gönderdiğine emin ol. Grup kullanıyorsan ID ve bot yetkilerini kontrol et. Terminaldeki hata mesajını incele.

**Empire `401` veya `403` dönüyor:** Kendi API key'ini ve erişim durumunu kontrol et. Site güvenlik/kullanım kuralları ve bölgesel kısıtlar nedeniyle bağlantıyı reddedebilir; bu kod erişim engelini aşmaz.

**BynoGame ilan atlıyor mu?** Evet, ilanlar sorgular arasında çok hızlı değişirse, bot yalnızca API'nin döndürdüğü son `BYNO_PAGE_SIZE` kaydı gördüğü için bazı ilanlar kaçabilir. Ayrıca API geçici olarak erişilemezse bildirim gelmez.

**Botlar çalışırken satın alma yapılır mı?** Hayır. Mesajlar bilgi ve bağlantı içerir; tüm alışveriş işlemlerini kullanıcı manuel yapar.

**Önceden gönderilen bir ilanın tekrar gelmesi?** `sent_ids.json` silinmiş olabilir ya da ilgili ilan yeni bir ID ile listelenmiş olabilir.

**Botun 7/24 çalışması:** Her iki bot da kendi cihazında açık kalan bir Python süreci gerektirir. Bu repo sunucu/hosting hizmeti sunmaz.

## 🧪 Test

Bağımlılıklar kurulduktan sonra:

```bash
python -m unittest discover -s tests -v
```

Bu testler örnek ilanlar üzerinden filtre mantığını kontrol eder; canlı pazar yeri/Telegram entegrasyonu için otomatik test yapmaz.

## ⚠️ Sorumluluk ve güvenlik

- API erişimi ve kullanım koşulları kullandığın platformların güncel kurallarına tabidir.
- BynoGame sorgu yapısı ve Empire WebSocket olayları platform tarafından değiştirilebilir; bu nedenle **kesintisiz çalışacağı garanti edilmez**.
- GitHub'a yanlışlıkla anahtar yüklediysen Git geçmişinden silmeye çalışmak **tek başına yeterli değildir**; ilgili anahtarı hemen iptal edip yenisini oluştur.
- Bu proje yatırım tavsiyesi veya pazar yeri hizmeti değildir.

## 🚀 Bu projeyi GitHub’a koymak isteyenler

Kodları yayınlamak için [`GITHUBA_YUKLE.md`](GITHUBA_YUKLE.md) dosyasındaki yönergeyi kullanabilirsiniz.

## 📄 Lisans

MIT — ayrıntılar için [`LICENSE`](LICENSE) dosyasına bak.
