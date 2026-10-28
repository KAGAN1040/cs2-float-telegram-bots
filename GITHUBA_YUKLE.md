# GitHub'a yükleme (proje sahibi için)

**Önemli:** ZIP dosyasını GitHub'a tek parça olarak koyma; ZIP'i bilgisayarına çıkar ve **içindeki proje dosyalarını** depoya yükle. `.env.example` bulunmalı ama kendi `.env` dosyan GitHub'da görünmemeli.

## Git komutları ile

1. GitHub'da **New repository** seç. Örn. adı `cs2-float-telegram-bots` olsun. Public seç; başlangıçta README, .gitignore veya license oluşturma (bunlar zaten var).
2. ZIP'i çıkar ve **`cs2-float-telegram-bots` klasöründe** terminal/CMD aç.
3. Aşağıdaki komutlarda GitHub kullanıcı adını kendininkiyle değiştir:

```bash
git init
git add .
git status
git commit -m "Initial public release"
git branch -M main
git remote add origin https://github.com/KULLANICI_ADIN/cs2-float-telegram-bots.git
git push -u origin main
```

`git status` çıktılarını kontrol et; `.env`, `sent_ids.json`, eski `bot(2).py` gibi kişisel dosyalar listede olmamalı. `git` komutu bulunamıyorsa önce Git for Windows kur veya GitHub Desktop kullan.

## GitHub Desktop ile

GitHub Desktop'ta projeyi yerel depo olarak ekle veya **Create a New Repository from an Existing Folder** yoluyla yeni depo oluştur; ardından **Publish repository** seç ve **Public** yap. Yayınlamadan önce Changes alanını kontrol ederek kişisel `.env` dosyasının listede olmadığını doğrula.

## Yayınlamadan önce kontrol listesi

- [ ] Gerçek API key ve Telegram tokenleri eski veya yeni hiçbir dosyada bulunmuyor.
- [ ] `.env.example` boş örnek değerlerle duruyor.
- [ ] `.env` ve bildirim kayıtları Git'e eklenmemiş.
- [ ] README talimatları okunabiliyor.
- [ ] Başkalarının kullanımı için sadece kendi API/tokenlerini girmeleri yeterli.

**Önceden açığa çıkmış anahtarları mutlaka iptal edip yeniden oluştur.** Sadece GitHub'dan silmek yeterli değildir.
