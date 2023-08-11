# Seyahat_Acentasi2

Bu Dart uygulaması, bir seyahat acentasının işlevlerini simüle etmek için oluşturulmuştur. Müşteri ve yönetici rolleri aracılığıyla seyahat paketi yönetimi, rezervasyonlar ve müşteri yorumları gibi işlemleri gerçekleştirebilirsiniz.


## Sınıf Yapısı

Uygulama, farklı rollerdeki kullanıcıları, seyahat paketlerini ve müşteri yorumlarını yönetmek üzere aşağıdaki sınıf yapısını kullanır:

### `Kullanici` Sınıfı

Bu sınıf, uygulamaya giriş yapacak kullanıcıların temel özelliklerini içerir. Hem müşteriler hem de yöneticiler bu sınıftan türetilir.

**Özellikler:**
- `kullaniciAdi`: Kullanıcının giriş yapmak için kullandığı kullanıcı adı.
- `parola`: Kullanıcının hesabını güvence altına almak için kullandığı parola.

### `Musteri` Sınıfı

Bu sınıf, müşterilerin uygulamada sahip olduğu özellikleri ve davranışları tanımlar.

**Özellikler:**
- `kullaniciAdi`: Müşterinin kullanıcı adı.
- `parola`: Müşterinin hesap parolası.

### `Yonetici` Sınıfı

Bu sınıf, yöneticilerin uygulamada sahip olduğu özellikleri ve davranışları tanımlar.

**Özellikler:**
- `kullaniciAdi`: Yöneticinin kullanıcı adı.
- `parola`: Yöneticinin hesap parolası.

### `SeyahatPaketi` Sınıfı

Bu sınıf, sunulan seyahat paketlerinin özelliklerini içerir.

**Özellikler:**
- `id`: Seyahat paketinin benzersiz tanımlayıcısı.
- `nereden`: Seyahatin başlangıç noktası.
- `nereye`: Seyahatin varış noktası.
- `ucret`: Seyahat paketinin maliyeti.
- `rezervasyonDurumu`: Seyahat paketinin rezervasyon durumu.

### `main` Fonksiyonu

Uygulamanın giriş noktasını temsil eden bu fonksiyon, kullanıcı etkileşimini yönlendirir ve seçilen rol ve işleme göre ilgili sınıf ve metotları çağırır.

---

Bu sınıf yapısı, uygulamanın temel bileşenlerini ve kullanıcıların, seyahat paketlerinin ve diğer varlıkların nasıl temsil edildiğini ayrıntılı bir şekilde açıklar. Bu yapı, uygulamanın tasarımını ve işleyişini anlamak için önemlidir.

  
## Kullanım

Bu bölümde, uygulamanın nasıl kullanılacağı adım adım açıklanmıştır.

1. Uygulama Başlatma:
   - Uygulamayı başlatmak için terminal veya komut istemcisini açın.
   - Uygulama dosyasının bulunduğu dizine gidin.

2. Giriş Seçenekleri:
   - Uygulama başladığında, giriş seçenekleri görüntülenecektir.
   - "1" tuşuna basarak "Müşteri Girişi" yapabilirsiniz.
   - "2" tuşuna basarak "Yönetici Girişi" yapabilirsiniz.
   - "3" tuşuna basarak uygulamadan çıkabilirsiniz.

3. Müşteri Girişi:
   - Müşteri olarak giriş yapmak istediğinizde, mevcut bir hesabınız varsa "e", yeni bir hesap oluşturmak isterseniz "h" tuşuna basın.
   - Varolan bir hesapla giriş yapacaksanız, kullanıcı adı ve parolanızı girin.
   - Giriş doğrulandığında, müşteriye özgü işlem seçenekleri görüntülenecektir.

4. Müşteri İşlem Seçenekleri:
   - "1" tuşuna basarak tüm seyahat paketlerini görüntüleyebilirsiniz.
   - "2" tuşuna basarak bir seyahat paketini rezerve edebilirsiniz.
   - "3" tuşuna basarak müşteri yorumlarını görüntüleyebilirsiniz.
   - "4" tuşuna basarak giriş ekranına dönebilirsiniz.

5. Yönetici Girişi:
   - Yönetici olarak giriş yapmak istediğinizde, kullanıcı adı ve parolanızı girin.
   - Giriş doğrulandığında, yöneticiye özgü işlem seçenekleri görüntülenecektir.

6. Yönetici İşlem Seçenekleri:
   - "1" tuşuna basarak yeni bir seyahat paketi oluşturabilirsiniz.
   - "2" tuşuna basarak varolan bir seyahat paketini düzenleyebilirsiniz.
   - "3" tuşuna basarak bir seyahat paketini silebilirsiniz.
   - "4" tuşuna basarak tüm seyahat paketlerini görüntüleyebilirsiniz.
   - "5" tuşuna basarak giriş ekranına dönebilirsiniz.

7. Uygulamadan Çıkış:
   - İstediğiniz zaman uygulamadan çıkmak için "3" tuşuna basabilirsiniz.

Not: Uygulama, hatalı girişlerde ve geçersiz seçimlerde kullanıcıya bilgi verir ve doğru bir giriş yapana kadar devam eder.

Uygulama içindeki işlem adımlarını bu kılavuzdaki açıklamaları takip ederek gerçekleştirebilirsiniz. Daha fazla yardım veya destek için uygulamanın kullanıcı kılavuzunu her zaman başvurabileceğiniz bir kaynak olarak kullanabilirsiniz.



## Özellikler

### Müşteri Girişi:

1. **Seyahat Paketlerini Listeleme:** Tüm mevcut seyahat paketlerini listeleyebilirsiniz. Her paketin ID'si, nereden ve nereye bilgileri, ücreti ve rezervasyon durumu görüntülenir.

2. **Seyahat Paketi Rezervasyonu Yapma:** Müsait olan seyahat paketlerinden birine rezervasyon yapabilirsiniz. Rezervasyon yapıldığında ilgili paketin rezervasyon durumu güncellenir.

3. **Müşteri Yorumları Görüntüleme:** Diğer müşterilerin yaptığı yorumları görüntüleyebilirsiniz. Var olan yorumlar sıralı bir şekilde listelenir.

### Yönetici Girişi:

1. **Seyahat Paketi Oluşturma:** Yönetici olarak yeni seyahat paketleri oluşturabilirsiniz. Her paket için ID, nereden ve nereye bilgileri, ücreti ve rezervasyon durumu belirtmeniz gerekmektedir.

2. **Seyahat Paketi Düzenleme:** Varolan seyahat paketlerini düzenleyebilirsiniz. ID aracılığıyla paket seçilir ve nereden, nereye, ücret ve rezervasyon durumu gibi özellikleri güncelleyebilirsiniz.

3. **Seyahat Paketi Silme:** Varolan seyahat paketlerini ID aracılığıyla silebilirsiniz.

4. **Tüm Seyahat Paketlerini Görüntüleme:** Mevcut tüm seyahat paketlerini listeleyebilirsiniz. Paketlerin bilgileri, rezervasyon durumu ve diğer detaylar görüntülenir.


## Gereksinimler

- Bu uygulama, temel girdi/çıktı işlemleri için `dart:io` kütüphanesini kullanmaktadır.
- Dart SDK'nın en güncel sürümü bilgisayarınıza yüklü olmalıdır.


## Notlar

- Bu uygulama, gerçek bir seyahat acentası sistemi oluşturmak amacıyla değil, Dart programlama dilini ve temel kavramları öğrenmek için oluşturulmuştur.

---

Uygulama, seyahat acentası senaryosunu simüle etmek ve Dart dilini öğrenmek amacıyla oluşturulmuştur. Uygulama üzerinde değişiklikler yaparak veya yeni özellikler ekleyerek deneyim kazanabilirsiniz. Herhangi bir sorunuz veya öneriniz varsa, lütfen iletişime geçmekten çekinmeyin.

## Lisans

Bu proje MIT Lisansı altında lisanslanmıştır. Daha fazla bilgi için [LİSANS](LICENSE) dosyasına göz atabilirsiniz.
