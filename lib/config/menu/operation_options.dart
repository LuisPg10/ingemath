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
    icon: "assets/images/simple-interest.png",
    link: "simple_interest",
  ),

  Option(
    name: "Interé compuesto",
    icon: "assets/images/compound-interest.png",
    link: "compound_interest",
  ),

  // Option(
  //  name: "Anualidades",
  //  icon: "assets/images/annuities.png",
  //  link: "annuities",
  // ),
  
  Option(
    name: "Tasa de interés",
    icon: "assets/images/interest_rate.png",
    link: "interest_rate",
  ),
];
