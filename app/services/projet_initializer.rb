class ProjetInitializer
  def initialize(service_particulier = nil, service_adresse = nil)
    @service_particulier = service_particulier || ApiParticulier.new
    @service_adresse = service_adresse || ApiBan.new
  end

  def initialize_projet(numero_fiscal, reference_avis)
    projet = Projet.new

    contribuable = @service_particulier.retrouve_contribuable(numero_fiscal, reference_avis)

    projet.reference_avis = reference_avis
    projet.numero_fiscal = numero_fiscal

    projet.nb_occupants_a_charge = contribuable.nombre_personnes_charge

    precise_adresse_postale(projet, contribuable.adresse)

    contribuable.declarants.each do |declarant|
      projet.occupants.build(
        nom: declarant[:nom], prenom: declarant[:prenom],
        date_de_naissance: "#{declarant[:date_de_naissance]}",
        demandeur: true)
    end

    avis_imposition = projet.avis_impositions.build
    avis_imposition.reference_avis = reference_avis
    avis_imposition.numero_fiscal = numero_fiscal
    avis_imposition.annee = contribuable.annee_impots
    avis_imposition.declarant_1 = "#{contribuable.declarants[0][:prenom]} #{contribuable.declarants[0][:nom]}"
    avis_imposition.declarant_2 = "#{contribuable.declarants[1][:prenom]} #{contribuable.declarants[1][:nom]}" if contribuable.declarants[1].present?
    avis_imposition.nombre_personnes_charge = contribuable.nombre_personnes_charge

    projet
  end

  def precise_adresse_postale(projet, adresse)
    adresse_localisee = @service_adresse.precise(adresse)
    if adresse_localisee.present?
      projet.adresse_postale = adresse_localisee
    end
    adresse_localisee
  end
end
