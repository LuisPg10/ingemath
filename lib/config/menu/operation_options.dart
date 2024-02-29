
class Option {
  final String name;
  final String icon;
  final String link;
  
  const Option({
    required this.name,
    required this.icon,
    required this.link,
  });
}

const appMenuOptions = <Option>[
  Option(
    name: "Interés simple",
    icon: "assets/images/interes-simple.png",
    link: "simple_interest"
  ),
  Option(
    name: "Interés compuesto",
    icon: "assets/images/interes-compuesto.png",
    link: "compound_interest"
  ),
  Option(
    name: "Anualidades",
    icon: "assets/images/anualidades.png",
    link: "annuities"
  ),
];
