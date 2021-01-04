import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

class Opis {
  String dir;
  List<Widget> listOfOpis;
  Opis(this.dir) {
    listOfOpis = [
      Column(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '\nKRATKI VOKALI',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      '\n\nNalaze se iznad ili ispod harfa. Arapski naziv je ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'hareketun ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'što znači ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      '“pokret”, dakle tek kada se nađe jedan od hareketa na harfu onda se harf izgovara. \nIzgovaraju se kratko!\n',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
          Table(
            border: TableBorder.all(
                color: Colors.black, width: 1, style: BorderStyle.solid),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Crtica iznad harfa (fetha)',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.file(
                        File('$dir/svg/1/fetha_.svg'),
                        //width: SizeConfig.blockSizeHorizontal * 34,
                        height: 40,
                        //color: Colors.green,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'čita se kratko E (a ne EEE)',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Crtica ispod harfa (kesra)',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.file(
                      File('$dir/svg/1/kesra_.svg'),
                      //width: SizeConfig.blockSizeHorizontal * 34,
                      height: 40,
                      //color: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'čita se kratko I',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Zarez iznad harfa (damma)',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.file(
                      File('$dir/svg/1/damma_.svg'),
                      //width: SizeConfig.blockSizeHorizontal * 34,
                      height: 40,
                      //color: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'čita se kratko U',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Kružić iznad harfa (sukun)',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.file(
                      File('$dir/svg/1/sukun.svg'),
                      //width: SizeConfig.blockSizeHorizontal * 34,
                      height: 40,
                      //color: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'čita se samo harf (više u 2. lekciji) ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      '\nKada dođe jedan od ovih znakova na harfu, prvo se čita harf pa vokal. ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '\n\nDa bi vježbali kratke vokale ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'upotrijebit ćemo prvo slovo/harf arapske abecede a to je Elif/Hemze.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '\n\nELIF / HEMZE ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      '\n\nVeže se samo sa svoje desne strane. Piše se na dva načina kao ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'uspravna crta – elif ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'ili kao',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'uvijeni oblik – hemze o kojem će biti više riječi u lekciji broj 10.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      '\n\nIzgovor ovog glasa kada je sam tj. ( sa sukunom ) sličan je poluglasu koji se čuje prije naše riječi ‘rt pa bi se moglo reči da se',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      ' elif/hemze sa sukunom uopšte ne čita.\n\nKada na elifu/hemzetu ili ispod njega dođe neki od znakova za kratke vokale izgovara se samo taj vokal.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      //2
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text:
                  '\nHarf WAW svojim izgledom podsjeca na naš broj 9, izgovara se tako da se',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  ' namjeste usne za izgovor slova “O” pa se izgovori “W” tako da usne pritom formiraju kružni oblik. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '\n\nIzgovara se ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ' kao W u engleskoj riječi World ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'te zato koristimo englesku transkripciju ovog harfa, a nikako kao bosansko “V”.\n\nOvaj harf se takoder ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ' veže samo sa svoje desne strane, ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'kada na njemu dođe neki od vokala, prvo izgovorimo “W” pa onda vokal (npr. we, wi, wu), a',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ' kada je na njemu sukun tada se izgovara samo “W”. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
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
              text: '\nHarf DAL ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'izgleda kao jedna savijena linija u obliku luka čiji je donji dio više vodoravan, izgovara se kao naše slovo “D“. Veže se samo sa svoje desne strane. Pri izgovoru koristi se gornji dio jezika koji je prislonjen uz korijen sjekutića.\n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Harf ZAL ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ' izgleda isto kao i harf Dal samo što se ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'iznad njega nalazi jedna tačka. \n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Izgovara se tako da ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'vrhom jezika dodirnemo gornje prednje zube (sjekutiće ) i izgovorimo “Z”. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  ' Tačka iznad ovog harfa je sastavni dio harfa kao i kod mnogih drugih harfova koji ih imaju na sebi.\n\n Za ovaj harf kažemo da je to ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'mehko “Z”. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Veže se samo sa svoje desne strane i ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'ne postoji u našem jeziku.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
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
              text: '\nHarf RA ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'izgleda kao jedna polusavijena linija u obliku luka ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'čiji je donji dio više opružen prema dole u odnosu na harf  Dal i Zal.\n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Izgovara se kao naše slovo “R” sa tim da se sa ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'fethom ili dammom izgovara krupnije, a kada je sa kesrom izgovara se tanko, ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'pri izgovoru se koristi vrh jezika i nepce.\n\nVeže se samo sa svoje desne strane. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Harf ZA ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '  ima isti izgled kao i harf Ra sa tim što se ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'iznad ovog harfa nalazi jedna tačka ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'koja je sastavni dio harfa.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'Harf Z bilo to mehka, oštra ili kasnije krupna verzija uvijek na sebi ima jednu tačku.\n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'Izgovara se kao naše slovo “Z“. tj. sastavljenih zuba. I ovaj harf takoder spada u grupu harfova koji se vežu samo sa svoje desne strane. Za njega kažemo da je to oštro “Z”.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.justify,
      ),

//5
      Column(
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '\nTENVIN ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      '- Kratki vokali E, I, U tj. Fetha, Kesra i Damma mogu biti udvostručeni te se to udvostručenje vokala naziva TENVIN. \n\n',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Tenvin se pojavljuje samo na kraju riječi, ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'odnosno na neodređenim imenicama. Udvostručeni vokal se piše na način da se doda još jedan isti znak pored postojećeg, a izgovara se tako što tom vokalu koji je dvostruk ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'dodamo “N” u izgovoru. \n\n',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Pa je tako ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'tenvin Fethe (E) – En, tenvin Kesre (I) – In, a tenvin Damme (U) – Un.\n\nU slučaju Tenvina EN, on uvijek dolazi sa zaštitnim elifom na kojem nema drugog znaka.\n\nTEŠDID',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      ' - Kao što kratki vokali mogu biti udvostručeni isto tako i slova tj. harfovi mogu također biti udvostručeni i tada iznad harfa ima ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'znak u obliku engleskog slova (w) ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'koji se naziva tešdid. \n\nU suštini, tešdid označava da se tu radi o dva ista spojena harfa od kojih je prvi bio sa sukunom, a drugi sa hareketom.\n\nKada imamo tešdid iznad nekog harfa, ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'taj harf u izgovoru treba udvostručiti odnosno pojačati (pritisnuti) ili malo se zadržati na njemu prilikom izgovora.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
          Table(
            border: TableBorder.all(
                color: Colors.black, width: 1, style: BorderStyle.solid),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Fetha',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.file(
                        File('$dir/svg/5/e.svg'),
                        //width: SizeConfig.blockSizeHorizontal * 34,
                        height: 40,
                        //color: Colors.green,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'tenvin',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.file(
                        File('$dir/svg/5/en.svg'),
                        //width: SizeConfig.blockSizeHorizontal * 34,
                        height: 40,
                        //color: Colors.green,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'čita se ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'EN',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'npr. ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          SvgPicture.file(
                            File('$dir/svg/5/den.svg'),
                            //width: SizeConfig.blockSizeHorizontal * 34,
                            height: 40,
                            //color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Kesra',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.file(
                        File('$dir/svg/5/i.svg'),
                        //width: SizeConfig.blockSizeHorizontal * 34,
                        height: 40,
                        //color: Colors.green,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'tenvin',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.file(
                        File('$dir/svg/5/in.svg'),
                        //width: SizeConfig.blockSizeHorizontal * 34,
                        height: 40,
                        //color: Colors.green,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'čita se ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'IN',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'npr. ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          SvgPicture.file(
                            File('$dir/svg/5/din.svg'),
                            //width: SizeConfig.blockSizeHorizontal * 34,
                            height: 40,
                            //color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Damma',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.file(
                        File('$dir/svg/5/u.svg'),
                        //width: SizeConfig.blockSizeHorizontal * 34,
                        height: 40,
                        //color: Colors.green,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'tenvin',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.file(
                        File('$dir/svg/5/un.svg'),
                        //width: SizeConfig.blockSizeHorizontal * 34,
                        height: 40,
                        //color: Colors.green,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'čita se ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'UN',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'npr. ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          SvgPicture.file(
                            File('$dir/svg/5/dun.svg'),
                            //width: SizeConfig.blockSizeHorizontal * 34,
                            height: 40,
                            //color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      //6
      Column(
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '\nDUGI VOKALI Ā/Ū',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      '\n\nU ovoj lekciji ćemo uvesti mjernu dužinu za vokale. Dužina kratkih vokala/hereketa iz prve lekcije traje praktično koliko treba da se u mirnom stanju ruke podigne i spusti kažiprst i to trajanje se se zove JEDNO HAREKE (“pokret”,”sekundu”). Dakle izgovori e,i,u,we,du,zi,ru,re, iz prethodnih lekcija traju jedno hareke.\n\n',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'DUGI VOKAL A – nastaje kada se harfu koji ima na sebi fethu (kratko e) doda Elif bez ikakvog znaka na njemu. Dakle na elifu ne smije biti nikakav znak-hareke.\n\nDugi vokal A se također označava i malim elifom iznad harfa i u tom slučaju nemamo dugi elif pored.\n\nDugi vokal A se izgovara u trajanju od DVA HAREKETA!\n\n',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),

//7
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text:
                  'Svi preostali harfovi, osim hemzeta (10. lekcija) koji je drugi oblik Elifa, spajaju se sa obje svoje strane, a ne samo sa jedne strane kao u slučaju sa harfovima iz predhodnih lekcija. Tako da će sada biti potrebno da dobro zapamtimo njihov izgled na početku, u sredini, i na kraju riječi.\n\nHARF BA (B)\n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'Harf “BA” izgleda kao mali čamac/kajak ispod kojeg se nalazi jedna tačka koja je sastavni dio harfa, izgovara se kao naše slovo “B“. \n\nPri izgovoru ovog harfa koristimo obje usne koje sastavimo, a zatim naglo otpustimo izgovarajući “B”. Veže se sa obje strane, dakle kada je u sredini riječi može biti vezan/spojen sa drugim harfovima i sa desne i sa lijeve strane.\n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'HARF NUN (N)\n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'Harf  “NUN” ima izgled posude u kojoj se na vrhu nalazi jedna tačka koja je sastavni dio harfa.\n\nKao što smo kazali vezuje se sa obje strane kao i harf BA. Pri izgovoru ovog harfa koristimo gornji dio jezika koji je priljubljen uz nepce i izgovara se kao naše “N“. \n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'Harf NUN je nazalni/nosni harf i tešdid na njemu se izgovara 2 hareketa.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
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
              text: 'HARF TA (T) \n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'Harf “TA” izgleda kao mali čamac/kajak poput harfa BA samo što se kod ovog harfa iznad njega nalaze dvije tačke. Pri izgovoru ovog harfa koristi se gornji dio jezika koji je prislonjen uz korijen gornjih sjekutica, izgovara se kao naše slovo “T“.\n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'HARF SA (mehko -S-)\n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'Harf “SA” izgleda kao harf  “TA” samo što umjesto dvije ima tri tačke iznad, ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'ovaj harf ne postoji u našem jeziku. \n\nIzgovara se tako što se vrh jezika stavi među prednje zube i lagano pusti da prostruji zrak izgovarajući mehko “S“.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
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
                  'HARF JA (J)\n\nHarf “JA” se piše na dva načina, a izgovara se kao naše “J“. Kada ovaj harf dolazi sam ili na kraju riječi izgledom podsjeća na naše slovo “S”. A kada je na početku ili u sredini riječi tada svojim izgledom podsjeća na harf “TA” samo što u ovom slučaju dvije tačke dolaze ispod harfa “JA”. \n\nDUGI VOKAL Ī (ii)\n\nDugi vokal “I” nastaje tako što se bilo kojem harfu sa “kesrom” doda harf “JA” bez ikakvog znaka na sebi. \n\nDugi vokal “I” se izgovara u trajanju od DVA HAREKETA!\n\nDUGI VOKAL Ā (sa harfom JA na kraju riječi)',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'U šestoj lekciji vidjeli smo da se dugi vokal “A” pravi tako što harfu sa “fethom” dodamo “Elif” bez ikakvog znaka na sebi i tako dobijemo dugo “A”. \n\nU ovoj lekciji naučit ćemo još jedan način nastanka dugog samoglasnika “A” i to ovog puta uz pomoć harfa “JA“.\n\nTako dugo “A” može nastati i na način ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'da se harfu s “fethom” u ovom slučaju doda harf “JA” bez ikakvog znaka na sebi i dolazi na kraju riječi.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
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
              text: 'HEMZE',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'Hemze je harf koji ne postoji u našem jeziku i to je zapravo',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'drugi oblik “Elifa”. \n\nNe spaja se sa drugim harfovima, može stajati SAM, a može imati i nosioca jednog od tri harfa: Elif, Vav ili Ja, ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  ', to su harfovi na kojima može doći hemze, ali se oni u tom slučaju ne čitaju. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'Kada se na hemzetu nalaze Fetha, Kesra ili Damma tada se Hemze ponaša poput Elifa tj. samo se izgovori znak koji je došao na njemu.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  '. A kada Hemze dođe sa sukunom tada se u izgovoru glasnice čvrsto pripoje, a disanje na trenutak prekine. Zrak koji nailazi iz pluća naglo otvara formiranu prepreku i na taj način proizvodi eksplozivan šum. Tom prilikom treba paziti da Hemze sa sukunom prilikom izgovora ne odskaće.\n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'MEDD (〜)\n\nMedd (dužina) je znak koji dolazi samo iznad dugih vokala A, I ili U, koji označava da se taj dugi vokal treba dva puta duže učiti, to jest 4 hareketa.\n\nInače postoji više različitih dužina o kojima će se govoriti u lekcijama Tedžvida (tedžvid.ba) nakon što se završe sve lekcije sufare.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
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
                  'HARF LAM (L) \n\nHarf “LAM” svojim izgledom podsjeća na udicu za pecanje ribe. U toku izgovora ovog harfa vrh jezika se pripoji na osnovu gornjih sjekutića, a rubovi prednjeg dijela jezika prislone se uz korijen gornjih zuba i prednji dio tvrdog nepca. \n\nIzgovara se kao naše “L” sa tim što se izgovara malo tanje.\n\nPoseban oblik predstavlja LAMELIF tj. kada poslije LAM dođe ELIF. Prvi harf je uvijek LAM a drugi ELIF.\n\nHARF KAF (K)\n\nHarf  “KAF” se piše na dva načina kada je napisan odvojeno tj. sam ili na kraju riječi tada izgleda poput harfa “LAM” stim što se iznad njega nalazi mali znak slican našem slovu “S“. \n\nKada je na početku ili u sredini riječi piše se drugačije i to također na dva načina. U toku izgovora ovog harfa, zadnji dio jezika se uzdigne prema mehkom nepcu. Nakon što vazdušna struja iz pluća otvori, već formiranu pregradu, čuje se karakterističan zvuk, približno isti kao u našim riječima: kiša, kiselina. \n\nIzgovara se kao naše “K” samo malo mekše',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
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
              text: 'HARF SIN (S)\n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'U toku izgovora ovog harfa, vrh jezika se prisloni uz desni iza donjih sjekutića, a gornji i donji zubi se međusobno približe. Veže se sa obje strane. Prilikom izgovora čuje se praskav šum.\n\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'HARF ŠIN (Š)\n\nIzgleda kao harf SIN stim što se iznad ovog harfa nalaze tri tacke. Izgovara se kao naše “Š“. U toku izgovora ovog harfa, vrhom jezika se pritisne na korijen donjih zuba, prednjim dijelom jezika se dodiruje prednji dio tvrdog nepca, a donji i gornji zubi se medusobno približe.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
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
              text:
                  "\" ali ipak malo mekše, stim da ne bi smio preći u mehko \"",
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

//15 odredeni clan
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text:
                  "Učeći Kur'an često ćemo naići na riječi koje počinju određenim članom (EL), tj. Elifom i Lamom. Ovaj određeni član se nekada čita a nekada ne, zavisno od toga koja vrsta harfova je poslije njega (harfovi: kamerije ili šemsije). Međutim mi ćemo ovdje pojednostaviti i kazati da ukoliko ova dva harfa tj. određeni član nema nikakav znak iznad sebe tada se uopšte i ",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "ne čita",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ", npr: (",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "eddaru",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "). A ako iznad određenog člana stoji neki znak tada ćemo ga i pročitati, npr: (",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "el",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "kitabu",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  ").\n\nAko prije riječi kod koje se na početku ne čita elif ili elif i lam (određeni član) ima neka druga riječ, one se moraju u izgovoru spojiti, npr: (",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "zali",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "kel",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "kitabu",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ") ili u primjeru (",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "ve mi",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "nenn",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "asi",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  ")\n\nUkoliko spajamo dvije riječi, od kojih se prva završava dugim samoglasnikom ",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "A",
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
              text: "U",
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
              text: "I",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ", ovi samoglasnici se u izgovoru gube tj, ",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "skraćuju",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ". Kao u primjerima (",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "ejjuh",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "e",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "llezine",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "), (",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "inn",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "i",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "ljevme",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ") ili (",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "z",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "u",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "levtadi",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "), (pogledati primjere u animaciji).",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.justify,
      ),

//16
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text:
                  "Šesnaesta lekcija donosi nam tri nova harfa, prva tri od devet harfova iznad kojih se \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "fetha",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\" čita kao kratko \"A\". I ovi harfovi se vežu sa obje svoje strane. Prvi od njih Harf \"",
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
              text: "\" izgledom podsjeća na harf \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "FA",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\" samo što se iznad njega nalaze dvije tačke, ne postoji u našem jeziku. Prilikom izgovora ovog harfa, jezik se pomjeri nazad, a njegov zadnji dio se uzdigne prema zadnjem nepcu u predjelu resice. Zrak koji naiđe iz pluća savladava već formiranu prepreku, a jezik se naglo spušta. U tom trenutku se čuje eksplozivan šum. Kada je sa sukunom odskaće. Za ovaj harf kažemo da je to tvrdo \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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
              text: "\".\n\nHarf \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "SAD",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\" ne postoji u našem jeziku, rekli bismo da je to treći oblik slova \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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
              text: "\" ili krupno \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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
                  "\". Prilikom izgovora ovog harfa prednji dio jezika se prisloniuz iicu donjih sjekutića, zadnji dio jezika se uzdigne prema zadnjem nepcu, a srednji dio jezika je izdubljen. Usne su umjereno ispupčene i zaokrugljene a usneni mišići su olabavljeni. Izgovor mu je prilično sličan našem \"",
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
              text: "\" s tim što se harf \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "SAD",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\" izgovara krupnije.\n\nHarf \"",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "DAD",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\" također ne postoji u našem jeziku, to je krupno \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "D",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.justify,
      ),

//17
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text:
                  "I u ovoj lekciji imamo tri nova harfa, tri krupna harfa iznad kojih se kratki vokal \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "E",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\" ili (fetha) čita kao kratko \n",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "A",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\" a ukoliko su sa sukunom a prije njih fetha i ta fetha se čita kao \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "A",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\". Vežu se sa obje svoje strane. Prvi od ova tri harfa je:\n\nHarf \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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
                  "\" ne postoji u našem jeziku, rekli bismo da je to krupno \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "T",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\". U toku izgovora ovog harfa, vrh jezika se prisloni na osnovu gornjih sjekutića, prednji dio jezika se pripoji uz korjen gornjih zuba, zadnji dio jezika se podigne unazad prema zadnjem nepcu, a usne su umjereno ispupčene i zaokrugljene. Usneni mišići se olabave. Samo donekle odgovara našem slovu \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "T",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\". Kada je sa sukunom ovaj harf u izgovoru odskače.\"\n\nHarf \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "ZA",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\" također ne postoji u našem jeziku, za njega bismo rekli da je to tvrdi oblik harfa \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "ZAL",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\". Izgleda poput harfa \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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
                  "\" s tim što iznad ima jednu tačku. U toku izgovora ovog harfa,vrh jezika se stavi između  gornjih i donjih zuba. Njegov zadnji dio se podigne prema mehkom nepcu, pri čemu, zadnji dio jezika postaje udubljen, a usne su zaokrugljene i ispupčene. Izgovor ovog hrfa donekle odgovara harfu \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "ZAL",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\"A izgovara se krupno i tupo, pokupljenih usni i povučenog jezika.\n\nHarf \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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
                  "\" kao i predhodna dva harfa ne postoji u našem jeziku, to je drugi oblik slova \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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
              text: "\". Rekli bismo da je to krupno i hrapavo \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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
              text: "\". Izgleda poput harfa \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "DŽIM",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\" ali razlika je u tome što je kod njega tačka iznad. U toku izgovora ovog harfa, zadnji dio jezika se podigne prema mehkom nepcu. Trenjem zraka iz pluća kroz suženi prostor u ždrijelu, proizvodi se hrapav šum sličan hrkanju. Izgovor ovog harfa odgovara njemačkom izgovoru slova \"CH\" u rijeći: \"ACHTUNG\" - pažnja.\"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.justify,
      ),

//18
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text:
                  "U osamnaestoj lekciji naučit ćemo preostala tri harfa, tri krupna harfa iznad kojih se kratki vokal \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "E",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\" tj. (fetha) čita kao \n",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "A",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\". Kada su sa sukunom a prije njih fetha i ta fetha se čita kao \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "A",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\". Vežu se sa obje svoje strane. Prvi od ova tri harfa je:\n\nHarf \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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
              text: "\" ne postoji u našem jeziku i to je treći oblik slova \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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
              text: "\". Izgleda poput harfova  \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "DŽIM",
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
                //fontWeight: FontWeight.bold,
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
                  "\" samo što ovaj harf nema tačku ni ispod ni iznad sebe. Za njega kažemo da je to oštro \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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
                  "\".  Toku izgovora ovog harfa ždrijelni kanal se suzi. Zrak koji se potisne iz pluća, nailazi na tjesan prolaz, pri čemu nastaje oštar šum. Prilikom samog izgovora jezik se mora ukrutiti i povući nazad. Izgovor ovog harfa je približno sličan našem \"H\", s tim što se izgovara stisnutog grla.\"\n\nHarf \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "AJN",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\" također ne postoji u našem jeziku i jedan je od najtežih harfova za izgovor. U toku izgovora ovog harfa, korjen i zadnji dio jezika se povuku nazad. Nakon što se potisne zrak iz pluća i pregrada se u ždriječnom kanalu otvori, jezik se mora naglo pomjeriti naprijed, a usneni mišići su zategnuti. Izgovor ovog glasa odgovara izgovoru polovie glasa \"A\". Izgovara se otvorenih usta tako da se zrak propusti kroz stisnuto grlo.\n\nHarf \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "GAJN",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\" izgleda slično kao harf \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "AJN",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\" samo što ima tačku iznad sebe. Prilikom izgovora ovog harfa, zadnji dio jezika se mora pomjeriti prema mehkom nepcu. Kada naiđe zrak iz pluća, čuje se hrapav, zvučan šum koji je sličan gugutanju bebe ili goluba. Izgovor ovog harfa donekle odgovara našem slovu \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "G",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\" a izgovara se duboko jakim grlenim glasom. Kada je sa sukunom treba paziti da ne odskače.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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

      //22
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text:
                  "Učeći Kur'an naići ćemo na sitno napisane harfove iznad riječi u ajetima, to su znaci za stajanje. Oni imaju za cilj da pomognu i olakšaju učenje Kur'ana. Pored okruglog i često ukrašenog znaka koji stoji na kraju ajeta – rečenica i označava tačku, ostale znakove koji su iznad riječi svrstavamo u četiri kategorije:",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "\n\t ●	Znakove na kojima se ",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "mora",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: " stati,",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\n\t ●	Znakove na kojima ",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "treba",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "stati (bolje je stati),",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\n\t ●	Znakove na kojima je ",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "bolje preći",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ", nastaviti učenje,",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\n\t ●	Znakove da ",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "ne treba ",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: " stati, ako se stane ponoviti riječ ili dvije,",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\n\nKada riječ na kojoj se zastaje ima na zadnjem harfu znak \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "Fethe",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\", \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "Kesre",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\", \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "Damme",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\" ili tenvin \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "In",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\" ili \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "Un",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\" , tada će se taj harf učiti kao da je na njemu ",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "sukun",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\", npr: (selamun-selam), ili (kitabun-kitab). Međutim, ako se riječ završava tenvinom \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "En",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\", tada se staje kao da je na kraju \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "dugo A",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  "\", npr: (tevvaben-tevvabaa). U slučajevima kada se riječ na kojoj želimo stati završava sa kruglim \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "T",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\" sa bilo kojim znakovima na njemu tada će se to \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "T",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "\" čitati kao  \"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
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
                  "\" sa sukunom, npr: (ihvetun-ihveh) ili (tevbetun-tevbeh). U animmiranoj lekciji ispod možete vidjeti ove znakove u primjeni.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.justify,
      ),
    ];
  }
  Widget getOpis(int i) {
    return listOfOpis[i];
  }
}
