import 'dart:io';

// Kullanıcı sınıfı oluşturuluyor
class Kullanici {
  String kullaniciAdi;
  String parola;

  Kullanici(this.kullaniciAdi, this.parola);
}

// Müşteri sınıfı, Kullanici sınıfından türetiliyor
class Musteri extends Kullanici {
  Musteri(String kullaniciAdi, String parola) : super(kullaniciAdi, parola);
}

// Yönetici sınıfı, Kullanici sınıfından türetiliyor
class Yonetici extends Kullanici {
  Yonetici(String kullaniciAdi, String parola) : super(kullaniciAdi, parola);
}

class SeyahatPaketi {
  int id;
  String nereden;
  String nereye;
  double ucret;
  bool rezervasyonDurumu;

  SeyahatPaketi(
      this.id, this.nereden, this.nereye, this.ucret, this.rezervasyonDurumu);
}

void main() {
  List<Musteri> musteriler = [];
  List<Yonetici> yoneticiler = [];
  List<SeyahatPaketi> seyahatPaketleri = [
    SeyahatPaketi(1, "İstanbul", "Antalya", 500.0, false),
    SeyahatPaketi(2, "Ankara", "İzmir", 400.0, true), // false yap3
    SeyahatPaketi(3, "Bodrum", "Marmaris", 300.0, false),
  ];
  List<String> yorumlar = [];

  // Örnek kullanici ve yonetici hesaplari oluşturuluyor
  musteriler.add(Musteri("musteri1", "123456"));
  yoneticiler.add(Yonetici("yonetici1", "yonetici123"));

  bool kontrol = true;

  print("-------------------");
  print("Seyahat Acentası Uygulaması");
  print("-------------------");

  // Giriş paneli giriş seçenekleri
  while (kontrol) {
    print("1 - Müşteri Girişi");
    print("2 - Yönetici Girişi");
    print("3 - Çıkış");
    print("-------------------");

    stdout.write("Lütfen Yapmak İstediğiniz İşlemi Seçin: ");

    try {
      int secim = int.parse(stdin.readLineSync()!);

      if (secim == 1) {
        // Müşteri Giriş İşlemleri
        print("-------------------");
        stdout.write("Üyeliğiniz var mı? (e/h): ");
        String secim = stdin.readLineSync()!.toLowerCase();

        if (secim == "e") {
          // Müşteri girişi işlemleri
          stdout.write("Kullanıcı Adı : ");
          String kullaniciAdi = stdin.readLineSync()!;
          stdout.write("Parola: ");
          String parola = stdin.readLineSync()!;

          bool dogrulandi = false;
          for (var musteri in musteriler) {
            if (musteri.kullaniciAdi == kullaniciAdi &&
                musteri.parola == parola) {
              dogrulandi = true;
              print("Müşteri Girişi Başarılı!");
              // Müşteri işlemleri devam edebilir

              bool musteriGirisKontrol = true;

              while (musteriGirisKontrol) {
                try {
                  print("-------------------");
                  print("1 - Seyahat Paketlerini Listele");
                  print("2 - Seyahat Paketi Rezervasyonu Yap");
                  print("3 - Müşteri Yorumları");
                  print("4 - Çıkış");
                  print("-------------------");

                  stdout.write("Lütfen Yapmak İstediğiniz İşlemi Seçin: ");
                  int secimMusteri = int.parse(stdin.readLineSync()!);

                  //Paketleri Listeleme
                  if (secimMusteri == 1) {
                    print("-------------------");
                    print("Tüm Seyahat Paketleri:");

                    for (var paket in seyahatPaketleri) {
                      print("ID: ${paket.id}");
                      print("Nereden: ${paket.nereden}");
                      print("Nereye: ${paket.nereye}");
                      print("Ücret: ${paket.ucret}");
                      print(
                          "Rezervasyon Durumu: ${paket.rezervasyonDurumu ? 'Rezerve Edildi' : 'Müsait'}");
                      print("-------------------");
                    }
                  }

                  //Paket Rezarvasyonu Yapma
                  else if (secimMusteri == 2) {
                    print("-------------------");
                    print("Seyahat Paketi Rezervasyonu Yap");
                    stdout.write(
                        "Rezervasyon yapmak istediğiniz paketin ID'sini girin: ");
                    int rezervasyonID = int.parse(stdin.readLineSync()!);
                    SeyahatPaketi? rezervasyonPaketi;

                    for (var paket in seyahatPaketleri) {
                      if (paket.id == rezervasyonID) {
                        rezervasyonPaketi = paket;
                        break;
                      }
                    }

                    if (rezervasyonPaketi != null) {
                      if (rezervasyonPaketi.rezervasyonDurumu) {
                        print("Bu paket zaten rezerve edilmiştir.");
                      } else {
                        rezervasyonPaketi.rezervasyonDurumu = true;
                        print("Seyahat Paketi Rezerve Edildi!");
                      }
                    } else {
                      print("Belirtilen ID ile bir seyahat paketi bulunamadı.");
                    }
                  }

                  //Müşteri Yorumları
                  else if (secimMusteri == 3) {
                    print("-------------------");
                    print("Müşteri Yorumları");

                    // Örnek bir yorum listesi oluşturalım
                    List<String> yorumlar = [];

                    while (true) {
                      print("-------------------");
                      print("1 - Yorum Ekle");
                      print("2 - Yorumları Görüntüle");
                      print("3 - Ana Menüye Dön");
                      print("-------------------");

                      stdout.write("Lütfen yapmak istediğiniz işlemi seçin: ");

                      try {
                        int secimYorum = int.parse(stdin.readLineSync()!);

                        //Yorum Ekleme
                        if (secimYorum == 1) {
                          print("-------------------");
                          stdout.write("Yorumunuzu girin: ");
                          String yorum = stdin.readLineSync()!;
                          yorumlar.add(yorum);
                          print("Yorumunuz eklendi!");
                        }

                        //Yorumları Görüntüleme
                        else if (secimYorum == 2) {
                          if (yorumlar.isEmpty) {
                            print("Henüz yorum bulunmamaktadır.");
                          } else {
                            print("-------------------");
                            print("Müşteri Yorumları:");
                            for (var i = 0; i < yorumlar.length; i++) {
                              print("${i + 1}. ${yorumlar[i]}");
                            }
                          }
                        }

                        // Ana Menüye Dön
                        else if (secimYorum == 3) {
                          print("-------------------");
                          print("Ana menüye dönülüyor...");
                          break;
                        } else {
                          print("Geçersiz seçim.");
                        }
                      } //try bitiş

                      catch (e) {
                        print("-------------------");
                        print(
                            "Hatalı giriş yaptınız. Lütfen geçerli bir seçim yapın.");
                      }
                    } //While bitiş
                  }

                  //Çıkış İşlemleri
                  else if (secimMusteri == 4) {
                    print("-------------------");
                    print("Çıkış Yapılıyor...");
                    musteriGirisKontrol = false;
                    break;
                  } else {
                    print("Geçersiz İşlem!");
                  }
                } //try bitiş
                catch (e) {
                  print("-------------------");
                  print(
                      "Hatalı giriş yaptınız. Lütfen geçerli bir seçim yapın.");
                }
              } //while bitiş

              kontrol = false;
              break;
            }
          }

          if (!dogrulandi) {
            print("Hatalı kullanıcı adı veya parola.");
          }
        } else if (secim == "h") {
          // Üye olma işlemleri
          stdout.write("Kullanıcı Adı : ");
          String kullaniciAdi = stdin.readLineSync()!;
          stdout.write("Parola: ");
          String parola = stdin.readLineSync()!;

          bool dogrulandi = false;
          for (var musteri in musteriler) {
            if (musteri.kullaniciAdi == kullaniciAdi &&
                musteri.parola == parola) {
              dogrulandi = true;
              // Kullanıcı sistemde kayıtlı mı kontrol yapılmıştır.
              print("Kullanıcı Sistemde Kayıtlı Bulunmaktadır.");
              break;
            } else {
              musteriler.add(Musteri(kullaniciAdi, parola));
              print("Kullanıcı Sisteme Kayıt Edilmiştir!");
              kontrol = false;
              break;
              // Müşteri işlemleri devam edebilir.

              bool musteriGirisKontrol = true;

              while (musteriGirisKontrol) {
                try {
                  print("-------------------");
                  print("1 - Seyahat Paketlerini Listele");
                  print("2 - Seyahat Paketi Rezervasyonu Yap");
                  print("3 - Müşteri Yorumları");
                  print("4 - Çıkış");
                  print("-------------------");

                  stdout.write("Lütfen Yapmak İstediğiniz İşlemi Seçin: ");
                  int secimMusteri = int.parse(stdin.readLineSync()!);

                  //Paketleri Listeleme
                  if (secimMusteri == 1) {
                    print("-------------------");
                    print("Tüm Seyahat Paketleri:");

                    for (var paket in seyahatPaketleri) {
                      print("ID: ${paket.id}");
                      print("Nereden: ${paket.nereden}");
                      print("Nereye: ${paket.nereye}");
                      print("Ücret: ${paket.ucret}");
                      print(
                          "Rezervasyon Durumu: ${paket.rezervasyonDurumu ? 'Rezerve Edildi' : 'Müsait'}");
                      print("-------------------");
                    }
                  }

                  //Paket Rezarvasyonu Yapma
                  else if (secimMusteri == 2) {
                    print("-------------------");
                    print("Seyahat Paketi Rezervasyonu Yap");
                    stdout.write(
                        "Rezervasyon yapmak istediğiniz paketin ID'sini girin: ");
                    int rezervasyonID = int.parse(stdin.readLineSync()!);
                    SeyahatPaketi? rezervasyonPaketi;

                    for (var paket in seyahatPaketleri) {
                      if (paket.id == rezervasyonID) {
                        rezervasyonPaketi = paket;
                        break;
                      }
                    }

                    if (rezervasyonPaketi != null) {
                      if (rezervasyonPaketi.rezervasyonDurumu) {
                        print("Bu paket zaten rezerve edilmiştir.");
                      } else {
                        rezervasyonPaketi.rezervasyonDurumu = true;
                        print("Seyahat Paketi Rezerve Edildi!");
                      }
                    } else {
                      print("Belirtilen ID ile bir seyahat paketi bulunamadı.");
                    }
                  }

                  //Müşteri Yorumları
                  else if (secimMusteri == 3) {
                    print("-------------------");
                    print("Müşteri Yorumları");

                    // Örnek bir yorum listesi oluşturalım
                    List<String> yorumlar = [];

                    while (true) {
                      print("-------------------");
                      print("1 - Yorum Ekle");
                      print("2 - Yorumları Görüntüle");
                      print("3 - Ana Menüye Dön");
                      print("-------------------");

                      stdout.write("Lütfen yapmak istediğiniz işlemi seçin: ");

                      try {
                        int secimYorum = int.parse(stdin.readLineSync()!);

                        //Yorum Ekleme
                        if (secimYorum == 1) {
                          print("-------------------");
                          stdout.write("Yorumunuzu girin: ");
                          String yorum = stdin.readLineSync()!;
                          yorumlar.add(yorum);
                          print("Yorumunuz eklendi!");
                        }

                        //Yorumları Görüntüleme
                        else if (secimYorum == 2) {
                          if (yorumlar.isEmpty) {
                            print("Henüz yorum bulunmamaktadır.");
                          } else {
                            print("-------------------");
                            print("Müşteri Yorumları:");
                            for (var i = 0; i < yorumlar.length; i++) {
                              print("${i + 1}. ${yorumlar[i]}");
                            }
                          }
                        }

                        // Ana Menüye Dön
                        else if (secimYorum == 3) {
                          print("-------------------");
                          print("Ana menüye dönülüyor...");
                          break;
                        } else {
                          print("Geçersiz seçim.");
                        }
                      } //try bitiş

                      catch (e) {
                        print("-------------------");
                        print(
                            "Hatalı giriş yaptınız. Lütfen geçerli bir seçim yapın.");
                      }
                    } //While bitiş
                  }

                  //Çıkış İşlemleri
                  else if (secimMusteri == 4) {
                    print("-------------------");
                    print("Çıkış Yapılıyor...");
                    musteriGirisKontrol = false;
                    break;
                  } else {
                    print("Geçersiz İşlem!");
                  }
                } //try bitiş
                catch (e) {
                  print("-------------------");
                  print(
                      "Hatalı giriş yaptınız. Lütfen geçerli bir seçim yapın.");
                }
              }
            }
          }
        } else {
          print("Geçersiz seçim.");
        }
      } else if (secim == 2) {
        // Yönetici Giriş İşlemleri
        print("-------------------");
        stdout.write("Kullanıcı adı: ");
        String kullaniciAdi = stdin.readLineSync()!;
        stdout.write("Parola: ");
        String parola = stdin.readLineSync()!;

        bool dogrulandi = false;
        for (var yonetici in yoneticiler) {
          if (yonetici.kullaniciAdi == kullaniciAdi &&
              yonetici.parola == parola) {
            dogrulandi = true;
            print("Yönetici girişi başarılı!");
            // Yönetici işlemleri devam edebilir

            bool devam = true;
            while (devam) {
              try {
                print("-------------------");
                print("1 - Seyahat Paketi Oluştur");
                print("2 - Seyahat Paketi Düzenle");
                print("3 - Seyahat Paketi Sil");
                print("4 - Tüm Seyahat Paketlerini Görüntüle");
                print("5 - Çıkış");
                print("-------------------");
                stdout.write("Lütfen Yapmak İstediğiniz İşlemi Seçin : ");

                int secimYonetici = int.parse(stdin.readLineSync()!);

                //Seyahat Paketi Oluşturma
                if (secimYonetici == 1) {
                  print("-------------------");
                  print("Yeni Seyahat Paketi Oluştur");
                  stdout.write("Paket ID: ");
                  int paketID = int.parse(stdin.readLineSync()!);
                  stdout.write("Nereden: ");
                  String nereden = stdin.readLineSync()!;
                  stdout.write("Nereye: ");
                  String nereye = stdin.readLineSync()!;
                  stdout.write("Ücret: ");
                  double ucret = double.parse(stdin.readLineSync()!);
                  stdout.write("Rezervasyon Durumu (true/false): ");
                  bool rezervasyonDurumu =
                      stdin.readLineSync()!.toLowerCase() == 'true';

                  seyahatPaketleri.add(SeyahatPaketi(
                      paketID, nereden, nereye, ucret, rezervasyonDurumu));
                  print("Yeni Seyahat Paketi Oluşturuldu!");
                  print("-------------------");
                }

                //Seyahat paketi Düzenleme
                else if (secimYonetici == 2) {
                  print("-------------------");
                  print("Seyahat Paketi Düzenle");
                  stdout.write("Düzenlemek istediğiniz paket ID'sini girin: ");
                  int duzenlenecekID = int.parse(stdin.readLineSync()!);

                  SeyahatPaketi? duzenlenecekPaket;

                  for (var paket in seyahatPaketleri) {
                    if (paket.id == duzenlenecekID) {
                      duzenlenecekPaket = paket;
                      break;
                    }
                  }

                  if (duzenlenecekPaket != null) {
                    stdout.write("Yeni Nereden: ");
                    String yeniNereden = stdin.readLineSync()!;
                    stdout.write("Yeni Nereye: ");
                    String yeniNereye = stdin.readLineSync()!;
                    stdout.write("Yeni Ücret: ");
                    double yeniUcret = double.parse(stdin.readLineSync()!);
                    stdout.write("Yeni Rezervasyon Durumu (true/false): ");
                    bool yeniRezervasyonDurumu =
                        stdin.readLineSync()!.toLowerCase() == 'true';

                    duzenlenecekPaket.nereden = yeniNereden;
                    duzenlenecekPaket.nereye = yeniNereye;
                    duzenlenecekPaket.ucret = yeniUcret;
                    duzenlenecekPaket.rezervasyonDurumu = yeniRezervasyonDurumu;
                    print("Seyahat Paketi Düzenlendi!");
                  } else {
                    print("Belirtilen ID ile bir seyahat paketi bulunamadı.");
                  }
                }

                //Seyahat Paketi Silme
                else if (secimYonetici == 3) {
                  print("-------------------");
                  print("Seyahat Paketi Silme");
                  stdout.write("Silmek istediğiniz paket ID'sini girin: ");
                  int silinecekID = int.parse(stdin.readLineSync()!);

                  bool silindi = false;
                  for (var paket in seyahatPaketleri) {
                    if (paket.id == silinecekID) {
                      seyahatPaketleri.remove(paket);
                      silindi = true;
                      print("Seyahat Paketi Silindi!");
                      break;
                    }
                  }

                  if (!silindi) {
                    print("Belirtilen ID ile bir seyahat paketi bulunamadı.");
                  }
                }

                //Seyahat Paketlerini Görüntüle
                else if (secimYonetici == 4) {
                  print("-------------------");
                  print("Tüm Seyahat Paketleri:");
                  for (var paket in seyahatPaketleri) {
                    print("ID: ${paket.id}");
                    print("Nereden: ${paket.nereden}");
                    print("Nereye: ${paket.nereye}");
                    print("Ücret: ${paket.ucret}");
                    print(
                        "Rezervasyon Durumu: ${paket.rezervasyonDurumu ? 'Rezerve Edildi' : 'Müsait'}");
                    print("-------------------");
                  }
                } else if (secimYonetici == 5) {
                  print("-------------------");
                  print("Çıkış Yapılıyor...");
                  devam =
                      false; // Kullanıcı çıkış yapmak istediğinde döngü sonlandırılır
                  break;
                } else {
                  print("Geçersiz İşlem!");
                }
              } catch (e) {
                print("-------------------");
                print("Hatalı giriş yaptınız. Lütfen geçerli bir seçim yapın.");
              }
            }

            kontrol = false;
            break;
          }
        }

        if (!dogrulandi) {
          print("Hatalı kullanıcı adı veya parola.");
        }
      } else if (secim == 3) {
        // Çıkış İşlemi
        print("-------------------");
        print("Çıkış yapılıyor...");
        break;
      } else {
        print("Geçersiz seçim.");
      }
    } catch (e) {
      print("-------------------");
      print("Hatalı giriş yaptınız. Lütfen geçerli bir seçim yapın.");
    }
  }
}
