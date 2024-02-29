
class Option {
  final String name;
  final String icon;
  
  const Option({
    required this.name,
    required this.icon,
  });
}

const appMenuOptions = <Option>[
  Option(
    name: "Tasa de interés",
    icon: "assets/images/tasa-interes.png",
  ),
  Option(
    name: "Interés simple",
    icon: "assets/images/interes-simple.png",
  ),
  Option(
    name: "Interés compuesto",
    icon: "assets/images/interes-compuesto.png",
  ),
  Option(
    name: "Anualidades",
    icon: "assets/images/anualidades.png",
  ),
];
