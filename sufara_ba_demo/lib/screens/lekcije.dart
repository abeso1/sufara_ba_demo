import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/data/dummy_data.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/widgets/harf_for_lekcije.dart';

class Lekcije extends StatelessWidget {
  final List<HarfModel> listHarf = DUMMY_DATA.listHarfDummyData;

  @override
  Widget build(BuildContext context) {
    //this need to be added so i can use size config
    SizeConfig().init(context);
    //return Center(
    ///Pogledaj svg folder koji je odmah ispod lib foldera. U njemu je trenutno dio harfova
    ///a ja sam ubacio samo iz subfoldera '1' slikice u assets pa iz njega citam i prikazujem
    ///na screenu i subfolder '15'. Tako da kada budes radio i prikaivao na screenu neke harfove
    ///probaj i ti ubaciti u pubspect.yaml file te fajlove koje su vec ubaceni u svg fajl (ako do
    ///ovog nisi dosao na kursu, javi. Sekunda je posla pa ti mogu objasniti bez
    ///da gubis vrijeme bezveze guglajuci).
    ///
    ///
    ///Ove cemo slike (svg file) mi povlaciti sa interneta ali to ce biti jedan od narednih koraka
    ///
    ///
    ///Zasad, prvi korak je da se napravi ovaj listview ili gridview (kako god ti odaberes, mada bih ti preporucio
    ///da pregledas malo po internetu i jedno a i drugo rjesenje i procitas malo dokumentaciju.
    ///
    ///
    ///Kad se uvjeris koje je rjesenje bolje od toga dvoje, onda kreiraj jednu karticu kao sto je
    ///izdizajnirala Zejneba, sa istim sadrzajem kao sto je kod nje na screenu.)
    ///
    ///
    ///Vodi racuna da ne pravis rucno 8 onih kartica, nego jednu ali tu jednu cemo reuse-at, samo sadrzaj mijenjati).
    ///
    ///
    ///Mozes napraviti 4-6 kartica na tabu 'Lekcije' i isto toliko na tabu 'vjezbe', ali vodeci racuna
    ///o razlicitom dizajnu (dakle prati Zejnebin posljednji fajl)
    ///PS.:
    /// Neka harfovi budu zasad ove boje, dakle zelene a poslije cemo raditi gradient
    /// (dok vidimo moze li nam proci ta varijanta zbog toga sto i knjigama koju apliakcija
    /// treba pratiti, zadane su posebne boje (crvena npr) koja je tu s razlogom,
    /// da naznaci npr da je to najbitniji dio u toj lekciji i slicno..
    /// o tome cemo poslije pricati tako da zasad boja harfa moze ostati ista)
    ///
    ///
    ///
    /// BONUS task:
    /// Pokusaj napraviti screen kada se klikne na neku vjezbu (npr elif). Tu ima onako poslica
    /// pa eto pokusaj sto vise ako bar ne budes mogao sve odraditi

    //  child: SvgPicture.asset(
    //    'svg/15/vel-fulku.svg',
    //    width: SizeConfig.blockSizeVertical * 80,
    //    height: SizeConfig.blockSizeVertical * 50,
    //    color: Colors.green,
    //  ),
    //);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'svg/back_img/back_img.jpg',
          ),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.dstATop),
        ),
      ),
      // ovdje ide listview
      child: ListView.builder(
        padding: const EdgeInsets.all(25),
        itemCount: listHarf.length,
        itemBuilder: (context, index) {
          return HarfWidgetForLekcije(listHarf[index]);
        },
      ),
    );
  }
}
