import 'package:flutter/material.dart';

class Opis {
  List<Widget> listOfOpis = [
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                'Arapsko pismo čine harfovi ( konsonanti ili suglasnici ) i znakovi ( kratki vokali ili samoglasnici ) koji dolaze iznad ili ispod harfova/konsonanata. U prvoj lekciji naučit ćemo znakove ili kratke vokale tj. samoglasnike. Postoje tri kratka vokala/samoglasnika i to ',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'E',
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ', ',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'I',
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ', ',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'U',
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                '. i oni uvijek dolaze na nekom od hafova i tada se prvo čita harf pa kratki vokal/samoglasnik, izuzetak je Elif koji se ne čita nego se samo izgovara kratki vokal koji je došao na njemu. Ovi vokali/samoglasnici  imaju i svoja imena pa ih tako nazivamo: ( ',
            style: TextStyle(
              fontSize: 15,
              //color: Colors.red,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'E',
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' - fetha ), ( ',
            style: TextStyle(
              fontSize: 15,
              //color: Colors.red,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'I',
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' - kesra), ( ',
            style: TextStyle(
              fontSize: 15,
              //color: Colors.red,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'U',
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                ' - damma). U flash animaciji prve lekcije mozemo vidjeti kako izgledaju ( fetha, kesra i damma ) te kako se izgovaraju, vodoravna linija u primjerima predstavlja bilo koji harf.',
            style: TextStyle(
              fontSize: 15,
              //color: Colors.red,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text:
                '\n\nZAPAMTI: Kratki vokali ili samoglasnici se uvijek izgovaraju kratko!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),
    //2
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "Kao što smo i rekli  Elif izgleda kao vertikalna crta na koju i ispod koje dolaze vokali te se tada izgovara samo vokal koji je na Elifu. U određenim slučajevima izgovara se i Elif ( na početku pojedinih sura koje počinju sa kraticama, pojedinačnim harfovima ) o čemu ćemo govoriti u nekoj od sljedećih lekcija.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text:
                "\n\nHarf  Vav svojim izgledom podsjeća na naš broj 9, izgovara se tako da se namjeste usne za izgovor slova \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "O",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" pa se izgovori \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "V",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" tako da usne pritom formiraju kružni oblik. Ovaj harf se također veže samo sa svoje desne strane, kada na njemu dođe neki od vokala prvo izgovorimo \"V\" pa onda vokal a kada je na njemu Sukun tada se izgovara samo \"V\"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),
    //3
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "Harf Dal izgleda kao jedna savijena linija u obliku luka čiji je donji dio više vodoravan, izgovara se kao naše slovo \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "D",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\". Veže se samo sa svoje desne strane. Pri izgovoru koristi se gornji dio jezika koji je prislonjen uz korijen sjekutića.\n\nHarf  Zal  izgleda isto kao i harf  Dal  samo što se iznad njega nalazi jedna tačka po kojoj ga razlikujemo od harfa  Dal. Izgovara se tako da vrhom jezika dodirnemo gornje prednje zube ( sjekutiće ) i izgovorimo \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "Z",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\".  Tačka iznad ovog harfa je sastavni dio harfa kao i kod mnogih drugih harfova koji ih imaju na sebi. Za ovaj harf kažemo da je to mehko \"Z\". Veže se samo sa svoje desne strane i ne postoji u našem jeziku.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),
    //4
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "Harf  Ra  izgleda kao jedna polusavijena linija u obliku luka čiji je donji dio više opružen prema dole u odnosu na harf  Dal i Zal. Izgovara se kao naše slovo \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "R",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" stim da kada je na njemu fetha ili damma izgovara se krupnije a kada je sa kesrom izgovara se tanko, pri izgovoru se koristi vrh jezika i nepce. Veže se samo sa svoje desne strane.\n\nHarf  Za ima isti izgled kao i harf  Ra stim što se iznad ovog harfa nalazi jedna tačka koja je sastavni dio harfa. Izgovara se kao naše slovo \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "Z",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\". tj. sastavljenih zuba. I ovaj harf također spada u grupu harfova koji se vežu samo sa svoje desne strane. Za njega kažemo da je to oštro \"Z\".",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

//5
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "Kratki vokali E, I, U tj. Fetha, Kesra i Damma mogu biti udvostručeni te se to udvostručenje vokala naziva TENVIN. Tenvin se pojavljuje samo na kraju riječi, odnosno na neodređenim imenicama. Udvostručeni vokal se piše na način da se doda još jedan isti znak pored postojećeg a izgovara se tako što tom vokalu koji je dvostruk dodamo \"N\" u izgovoru. Pa je tako tenvin Fethe (E) – En, tenvin Kesre (I) – In, a tenvin Damme (U) – Un.\n\nKao što kratki vokali mogu biti udvostručeni isto tako i slova tj. harfovi mogu također biti udvostručeni stim da se ne pišu dvostruko nego se iznad harfa koji je udvostručen nalazi mali znak u obliku engleskog slova (w). Taj znak se naziva TEŠDID i kada se nalazi iznad nekog harfa taj harf u izgovoru treba udvostručiti odnosno pojačati (pritisnuti) ili malo se zadržati na njemu prilikom izgovora.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

    //6
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "Osim kratkih vokala: Fethe, Kesre i Damme koji se uvijek izgovaraju kratko u arapskom jeziku postoje i dugi vokali od kojih ćemo u ovoj lekciji učiti dva i to dugi vokal \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "A",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" i dugi vokal \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "U",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\". Dugo A se dobije tako što se harfu koji već ima na sebi Fethu (E) doda sam elif bez ikakvog znaka, stim da taj Elif može doći i u skraćenom obliku koji izgleda poput apostrofa u našem pismu. Dugo A u arapskom jeziku traje koliko izgovor dva puta A u našem jeziku.\n\nKada je u pitanju dugi vokal \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "U",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" on se dobija tako što se harfu sa Dammom doda Vav bez ikakvog znaka. Tako nastalo dugo U traje koliko dva puta kratki vokal \"U\".",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

//7
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "Prvi od harfova koji se vežu sa obje svoje strane koje učimo u ovoj lekciji su harfovi BA i NUN. Dakle kada su u sredini riječi mogu biti vezani/spojeni sa drugim harfovima i sa desne i sa lijeve strane.\n\nHarf  \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "BA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" izgleda kao mali čamac/kajak ispod kojeg se nalazi jedna tačka koja je sastavni dio harfa, izgovara se kao naše slovo \"B\". Pri izgovoru ovog harfa koristimo obje usne koje sastavimo a zatim naglo otpustimo izgovarajući \"B\".\n\nHarf  \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "NUN",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" ima izgled posude u kojoj se na vrhu nalazi jedna tačka koja je sastavni dio harfa i koja kao da se kuha u loncu. Kao što smo kazali vezuje se sa obje svoje strane kao i harf BA. Pri izgovoru ovog harfa koristimo gornji dio jezika koji je priljubljen uz nepce i izgovara se kao naše \"N\".",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

//8
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "U ovoj lekciji također učimo dva harfa koji se vežu sa svoje obje strane a to su harfovi \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "TA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" i \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "SA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" koji su po svom izgledu slični harfu \"BA\". Harf  \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "TA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                " izgleda kao mali čamac/kajak poput harfa BA samo što se kod ovog harfa iznad njega nlaze dvije tačke. Pri izgovoru ovog harfa koristi se gornji dio jezika koji je prislonjen uz korijen gornjih sjekutića, izgovara se kao naše slovo \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "T",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\".\n\nHarf  \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "SA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" izgleda kao harf  \"TA\" samo što umjesto dvije ima tri tačke iznad, ovaj harf  ne postoji u našem jeziku. Izgovara se tako što se vrh jezika stavi među prednje zube i lagano pusti da prostruji vazduh izgovarajući mehko \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "S",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\".",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

//9
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "Jedan od harfova koji se spajaju sa obje svoje strane je i harf  \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "JA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\". Ovaj harf se piše na dva naćina a izgovara se kao naše \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "J",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\". Kada ovaj harf dolazi sam ili na kraju riječi izgledom podsjeća na naše slovo \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "S",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\". A kada je na početku ili u sredini riječi tada svojim izgledom podsjeća na harf  \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "TA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" samo što u ovom slučaju dvije tačke dolaze ispod harfa \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "JA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\".\n\nU ovoj lekciji naučit ćemo i dva duga vokala tj. dva duga samoglasnika i to: \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "I",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" i \n",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "A",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\". Dugi samoglasnik \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "I",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" nastaje tako što se bilo kojem harfu sa \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "kesrom",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" doda harf \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "JA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" bez ikakvog znaka na sebi. A budući da smo još u šestoj lekciji naučili da se dugi samoglasnik ili dugi vokal \"A\" pravi tako što harfu sa \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "fethom",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" dodamo \"Elif\" bez ikakvog znaka na sebi i tako dobijemo dugo \"A\". U ovoj lekciji naučit ćemo još jedan način nastanka dugog samoglasnika \"A\" i to ovoga put uz pomoć harfa \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "JA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\". Tako dugo \"A\" može nstati i na naćin da se harfu s fethom u ovom slučaju doda harf \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "JA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" bez ikakvog znaka na sebi.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

//10
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "Hemze",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                " je harf koji ne postoji u našem jeziku i to je zapravo drugi oblik \"Elifa\". Ne spaja se sa drugim harfovima, može stajati samo a može imati i nosioca jednog od tri harfa: ",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "Elif",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ", ",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "Vav",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: " ili ",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "JA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                ", to su harfovi na kojima može doći hemze ali se oni u tom slučaju ne čitaju. Kada se na hemzetu nalaze Fetha, Kesra ili Damma tada se Hemze ponaša poput Elifa tj. samo se izgovori znak koji je došao na njemu. A kada Hemze dođe sa sukunom tada se u izgovoru glasnice čvrso pripoje, a disanje na trenutak prekine. Zrak koji nailazi iz pluća naglo otvara formiranu prepreku i na taj način proizvodi eksplozivan šum. Tom prilikom treba paziti da Hemze sa sukunom prilikom izgovora ne odskače.\n\n",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "Medd",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                " (dužina) je znak koji dolazi samo iznad dugih vokala A, I ili U, koji onačava da se taj dugi vokal ili samoglasnik treba ",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "dva puta duže",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              //fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: " učiti.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

//11
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "U ovoj lekciji naučit ćemo dva nova harfa koji se spajaju sa obje svoje strane. Oba ova harfa odgovaraju glasovima koji postoje i u našem jeziku a to su slova: \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "L",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" i \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "K",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ". Harf \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "LAM",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" svojim izgledom podsjeća na udicu za pecanje ribe. U toku izgovora ovog harfa vrh jezika se pripoji na osnovu gornjih sjekutića, a rubovi prednjeg dijela jezika prislone se uz korijen gornjih zuba i prednji dio tvrdog nepca. Izgovara se kao naše \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "L",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" stim što se izgovara malo tanje.\n\nHarf \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "KAF",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" se piše na dva naćina kada je napisan odvojeno tj. sam ili na kraju riječi tada izgleda poput harfa \"LAM\" stim što se iznad njega nalazi mali znak sličan našem slovu \"S\". A kada je na početku ili u sredini riječi piše se drugačije i to također na dva načina (pogledaj tabelu animirane lekcije). U toku izgovora ovog harfa, zadnji dio jezika se uzdigne prema mehkom nepcu. Nakon što vazdušna struja iz pluća otvori, već formiranu pregradu, čuje se karakterističan zvuk, približno isti kao u našim riječima: kiša, kiselina. Izgovara se kao naše \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "K",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" samo malo mekše.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

//12
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "U dvanaestoj lekciji naučit ćemo dva nova harfa i to harf \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "SIN",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" i harf \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "ŠIN",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\". Oba ova harfa postoje u našem jeziku i oni spadaju u grupu harfova koji se vežu sa obje svoje strane. Harf \".",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "SIN",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" se izgovara kao naše slovo \"S\". U toku izgovora ovog harfa, vrh jezika se prisloni uz desni iza donjih sjekutića, a gornji i donji zubi se međusobno približe. Prilikom izgovora čuje se praskav šum.\n\nHarf \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "ŠIN",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" izgleda kao harf SIN stim što se iznad ovog harfa nalaze tri tačke. Izgovara se kao naše \"Š\". U toku izgovora ovog harfa, vrhom jezika se pritisne na korijen donjih zuba, prednjim dijelom jezika se dodiruje prednji dio tvrdog nepca, a donji i gornji zubi se međusobno približe.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

//13
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "I ova dva harfa se vežu sa obje svoje strane. Također postoje u našem jeziku. Prvi je Harf  \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "MIM",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" koji se izgovara kao naše slovo \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "M",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\". Prilikom izgovora ovog harfa usne se spoje i na taj način prave pregradu, a zadnje nepce je opušteno. Vazdušna struja iz pluća slobodno prolazi kroz nosnu šupljinu, savladavajući prepreku na usnama. Treba voditi računa o tome da ovaj harf ne odskaće kada je sa skunom.\n\nHarf  \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "HA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" se izgovara slično kao naše \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "H",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\". U toku izgovora ovog harfa glasnice se umjereno približe. Kada se vazduh iz pluća potisne, čuje se prirodno strujanje zraka, koje se inače osjeti u toku disanja zdrave osobe.\n\nKada se harf  \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "HA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" nalazi na kraju riječi i ima iznad sebe dvije tačke tada on postaje harf  \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "TA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\". Također, vokali na harfu \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "HA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\" (koji je na kraju neke riječi), uvijek su suprotne dužine u odnosu na vokal koji je ispred njih.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

//14
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "Među harfovima koji se vežu sa obje svoje strane su i sljedeća dva harfa koja ćemo ako Bog da naučiti u ovoj lekciji. I ova dva harfa kao i predhodna postoje u našem jeziku i njihov izgovor ne predstavlja poseban problem. Harf  \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "FA",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" se izgovara kao naše \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "F",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\". U toku izgovora ovog harfa, gornji sjekutići se prislone na unutarnju stranu donje usne. Ivice zuba vrše blagi pritisak na usnu, i na taj način se proizvodi ribajući šum.\n\nHarf  \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "DŽIM",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" se izgovara poput našeg slova \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "DŽ",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "\" ali ipak malo mekše, stim da ne bi smio preći u mehko \"",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "Đ",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                "\". U toku izgovora ovog harfa, vrh jezika se prisloni uz korjen donjih zuba. U tom trenutku se na tvrdom nepcu, formira neka vrsta polu-pregrade. Zrak iz pluća polahko savladava tu pregradu, izazivajući trenje  na korijenu donjih zuba.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

    //19
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "Arapsko pismo jedno je od svjetskih pisama. Njime se služe mnogi islamski narodi. Kako je to pismo kojim je napisan Kur'ani Kerim, svaki musliman treba da ga nauči. Arapsko pismo ima ",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "28",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                " slova (harfova). Piše se i čita s desna na lijevo. Nema malih, velikih, štampanih i pisanih slova. Razlike u pisanju postoje samo zavisno od položaja slova u riječi: da li je slovo samo, na početku, u sredini ili na kraju riječi i da li se može spajati sa svoje obje ili samo sa svoje desne strane. Slova se obično spajaju vodoravnom linijom. Sva arapska slova su suglasnici - konsonanti, za samoglasnike – vokale postoje posebni znaci koji nisu slova. Posebnu pažnju treba obratiti na izgled i izgovor svakog slova jer se neka lično pišu ili izgovaraju. Nekih glasova nema u našem jeziku pa je za njihov izgovor potrebna stručna pomoć muallima. U animiranoj lekciji ispod možete vidjeti kompletnu arapsku abecedu svih 28 harfova i među njima hemze kao drugi oblikk elifa, klikom na neki od harfova čut ćete njihovo ime.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

    //20
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "Dvadeset i devet sura u Kur'anu počinje skračenicama ili pojedinačnim harfovima. Ne računajući one koje se ponavljaju više puta u Kur'anu se nalazi četrnaest skračenica, a u njima je zastpljeno četrnaest konsonanata: (n, s, h, k, y, m, l, h, s,r, k, elif, t.). U jednoj skračenici može biti od jedan do pet glasova. Kod svih skračenica izgovara se samo ime tih slova, kao što možete vidjeti u animiranoj lekciji ispod.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),

    //21
    RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text:
                "Budući da je broj stranica, ajeta, džuzova i hizbova u Kur'ani Kerimu pisan arapskim brojevima potrebno je da naučimo i arapske brojeve kada smo već savladali arapska slova ili harfove. U ovoj lekciji mi nećemo učiti kako se brojevi izgovaraju u arapskom jeziku nego ćemo naučiti prepoznavati arapske brojeve kako bismo znali pronaći željenu stranicu ili broj ajeta u Kur'anu. Arapski brojevi se pišu i čitaju slijeva na desno kao i naši brojevi. U animiranoj lekciji ispod možete vidjeti upoređene nađe i arapske brojeve.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    ),
  ];

  Widget getOpis(int i) {
    return listOfOpis[i];
  }
}
