class SuperHero {
  final int id;
  final String name;
  final String slug;
  final PowerStats powerstats;
  final Appearance appearance;
  final Biography biography;
  final Work work;
  final Connections connections;
  final Images images;

  SuperHero({
    required this.id,
    required this.name,
    required this.slug,
    required this.powerstats,
    required this.appearance,
    required this.biography,
    required this.work,
    required this.connections,
    required this.images,
  });

  factory SuperHero.fromJson(Map<String, dynamic> json) {
    return SuperHero(
      id: json['id'] ?? 0, // Default to 0 if id is missing
      name: json['name'] ?? 'Unknown Hero', // Default to 'Unknown Hero'
      slug: json['slug'] ?? '',
      powerstats: PowerStats.fromJson(json['powerstats'] ?? {}),
      appearance: Appearance.fromJson(json['appearance'] ?? {}),
      biography: Biography.fromJson(json['biography'] ?? {}),
      work: Work.fromJson(json['work'] ?? {}),
      connections: Connections.fromJson(json['connections'] ?? {}),
      images: Images.fromJson(json['images'] ?? {}),
    );
  }
}

class PowerStats {
  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;

  PowerStats({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  factory PowerStats.fromJson(Map<String, dynamic> json) {
    return PowerStats(
      intelligence: json['intelligence'] ?? 0,
      strength: json['strength'] ?? 0,
      speed: json['speed'] ?? 0,
      durability: json['durability'] ?? 0,
      power: json['power'] ?? 0,
      combat: json['combat'] ?? 0,
    );
  }
}

class Appearance {
  final String gender;
  final String race; // Nullable
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;

  Appearance({
    required this.gender,
    this.race = "Unknown", // Default value
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
  });

  factory Appearance.fromJson(Map<String, dynamic> json) {
    return Appearance(
      gender: json['gender'] ?? 'Unknown', // Ensure gender is not null
      race: json['race'] ?? 'Unknown', // Handle race being null
      height: List<String>.from(json['height']),
      weight: List<String>.from(json['weight']),
      eyeColor: json['eyeColor'] ?? 'Unknown', // Provide default
      hairColor: json['hairColor'] ?? 'Unknown', // Provide default
    );
  }
}

class Biography {
  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher; // This can be null
  final String alignment;

  Biography({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });

  factory Biography.fromJson(Map<String, dynamic> json) {
    return Biography(
      fullName: json['fullName'] ?? "Unknown", // Default value if null
      alterEgos: json['alterEgos'] ?? "No alter egos found.",
      aliases: List<String>.from(
          json['aliases'] ?? []), // Default to an empty list if null
      placeOfBirth: json['placeOfBirth'] ?? "Unknown", // Handle null value
      firstAppearance:
          json['firstAppearance'] ?? "Unknown", // Handle null value
      publisher: json['publisher'] ?? "Unknown", // Default value if null
      alignment: json['alignment'] ?? "Unknown", // Handle null value
    );
  }
}

class Work {
  final String occupation;
  final String base;

  Work({
    required this.occupation,
    required this.base,
  });

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
      occupation: json['occupation'],
      base: json['base'],
    );
  }
}

class Connections {
  final String groupAffiliation;
  final String relatives;

  Connections({
    required this.groupAffiliation,
    required this.relatives,
  });

  factory Connections.fromJson(Map<String, dynamic> json) {
    return Connections(
      groupAffiliation: json['groupAffiliation'],
      relatives: json['relatives'],
    );
  }
}

class Images {
  final String xs;
  final String sm;
  final String md; // Expecting this may be nullable
  final String lg;

  Images({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      xs: json['xs'] ?? '', // Use empty string if null
      sm: json['sm'] ?? '',
      md: json['md'] ?? '',
      lg: json['lg'] ?? '',
    );
  }
}
