class Seeder
  PRESTATION_NAMES = [
    "Isolation murs par l’extérieur",
    "Isolation murs par l’extérieur partielle",
    "Isolation murs par l’intérieur",
    "Isolation murs par l’intérieur partielle",
    "Isolation des rampants de toiture",
    "Isolation du plancher des combles perdus",
    "Isolation plancher sur local non chauffé",
    "Menuiseries bois double ou triple vitrage",
    "Menuiseries PVC double ou triple vitrage",
    "Menuiseries alu double ou triple vitrage",
    "Portes d’entrée bois isolante",
    "Portes d’entrée PVC isolante",
    "Portes d’entrée alu isolante",
    "Volets",
    "Volets isolants",
    "Isolation : autres choix",
    "Chaudière gaz simple",
    "Chaudière gaz à condensation",
    "Chaudière gaz basse température",
    "Radiateurs gaz",
    "Chaudière fuel simple",
    "Chaudière fuel à condensation",
    "Chaudière fuel basse température",
    "Radiateurs fuel",
    "Chaudière à pellets (granulés de bois)",
    "Poële à pellets (granulés de bois)",
    "Poële à pellets (granulés de bois) avec récupérateur de chaleur",
    "Chaudière bois buches",
    "Poële à bois",
    "Poële à bois avec récupérateur de chaleur",
    "Insert",
    "Pompe à chaleur air/air",
    "Pompe à chaleur air/eau",
    "Pompe à chaleur eau/air",
    "Pompe à chaleur eau/eau",
    "Géothermie",
    "Chauffage électrique",
    "Radiateurs haute température",
    "Radiateurs basse température",
    "Plancher chauffant",
    "Autres choix",
    "Thermostat d’ambiance",
    "Programmation",
    "Régulation",
    "Robinets (vannes) thermostatiques",
    "Chauffage régulation : autres choix",
    "ECS couplé avec chaudière production instantanée",
    "ECS couplé avec chaudière production avec accumulation",
    "Chauffe eau (ballon) électrique",
    "Chauffe eau (ballon) thermodynamique",
    "Chauffe eau (ballon) solaire",
    "Chauffe bain gaz",
    "Production d’Eau Chaude Sanitaire (ECS) : autres choix",
    "VMC autoréglable ",
    "VMC Hygroréglable de type A",
    "VMC Hygroréglable de type B",
    "VMC double flux avec échangeur",
    "VMC double flux sans échangeur",
    "Extracteur autoréglagle",
    "Extracteur hygroréglable",
    "Ventilation naturelle (entrées et sorties d’air)",
    "Ventilation : autres choix",
    "Adaptation de la salle d’eau",
    "Installation d’une douche à l’italienne en remplacement d’une baignoire ou d’une douche non adaptée",
    "Réhausse des toilettes",
    "Pose de carrelage ou revêtement antidérapant",
    "Mise en place d’un lavabo adapté",
    "Pose de barres d’appui et mains courantes",
    "Création d’une rampe d’accès",
    "Installation d’un monte escalier",
    "Installation d’un ascenseur  ",
    "Installation d’un monte personne ou plate-forme élévatrice",
    "Amélioration de la circulation intérieure - Elargissement de passages",
    "Aménagement d’une pièce",
    "Création d’une pièce supplémentaire",
    "Création d’une unité de vie",
    "Installation de meubles pour Personnes à Mobilité Réduite",
    "Elargissement ou aménagement de parking",
    "Aménagement du cheminement extérieur",
    "Installation de volets roulants électriques",
    "Motorisation de volets roulants",
    "Autonomie/Adaptation : autres choix",
    "Reprise des fondations",
    "Reprise des structures porteuses",
    "Remaniement partiel des planchers",
    "Réfection complète des planchers",
    "Remaniement partiel de la charpente",
    "Réfection complète de la charpente",
    "Mise en sécurité de l’escalier",
    "Remplacement de l’escalier",
    "Installation ou mise en sécurité des gardes corps",
    "Réfection des rampes d’accès",
    "Remaniement partiel de la toiture",
    "Réfection complète de la toiture",
    "Ravalement de la façade",
    "Reprise des modénatures",
    "Percement des façades avec consolidation de la structure",
    "Devanture commerciale",
    "Gros œuvre : autres choix",
    "Remplacement du réseau d’eaux pluviales",
    "Reprise du réseau d’eaux pluviales",
    "Mise en place de compteurs individuels eau",
    "Réfection complète de l’installation électrique",
    "Mise en sécurité de l’installation électrique",
    "Intervention ponctuelle sur l’installation électrique",
    "Mise en place de compteurs individuels électriques",
    "Sécurisation de l’accès à l’immeuble",
    "Fumisterie",
    "Raccordement au réseau gaz",
    "Mise en sécurité du réseau gaz",
    "Mise en place de compteurs individuels gaz",
    "Raccordement à l’eau potable",
    "Réfection du réseau d’eau potable",
    "Raccordement au réseau collectif",
    "Installation ou mise aux normes d’un assainissement individuel",
    "Réseaux : autres choix",
    "Menuiseries intérieures",
    "Escalier",
    "Platrerie",
    "Mise en peinture des murs et/ou plafonds",
    "Pose d’un revêtement aux murs",
    "Carrelage",
    "Revêtement souple",
    "Revêtements interieurs : autres choix",
    "Réfection complète de la salle d’eau",
    "Réfection complète des sanitaires",
    "Réfection complète de la cuisine",
    "Plomberie sanitaire : autres choix",
    "Traitement contre l’humidité",
    "Traitement conte les nuisibles",
    "Désinfection du logement",
    "Amiante",
    "Saturnisme non hydrique",
    "Traitement de pathologies spécifiques : autres choix",
    "Aménagement des combles",
    "Aménagement d’une annexe",
    "Extension du logement par construction",
    "Réaménagement intérieur du logement",
    "Mise en place d’une installation de sécurité incendie",
    "Création d’un local poubelle",
    "Création d’un local vélos/poussettes",
    "Réfection de la cour intérieure",
    "Aménagement : autres choix",
    "Réfection clôtures",
    "Réfection des annexes",
    "Annexes : autres choix",
    "Prévention des inondations",
  ]

  def seed_prestations
    table_name = 'prestations'
    seeding table_name
    progress do
      PRESTATION_NAMES.each do |libelle_prestation|
        Prestation.find_or_create_by!(libelle: libelle_prestation)
        ahead!
      end
    end
  end
end
