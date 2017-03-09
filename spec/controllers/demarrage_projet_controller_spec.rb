require 'rails_helper'
require 'support/mpal_helper'
require 'support/api_ban_helper'

describe DemarrageProjetController do
  let(:projet) { create :projet, :prospect }

  before(:each) do
    authenticate_as_particulier(projet.numero_fiscal)
  end

  describe "#etape1_recuperation_infos" do
    let(:projet_params) do {} end
    let(:params) do
      default_params = { adresse_postale: projet.adresse_postale.description }
      {
        projet_id: projet.id,
        projet:    default_params.merge(projet_params)
      }
    end

    before(:each) do
      post :etape1_recuperation_infos, params
      projet.reload
    end

    context "lorsque les informations changent" do
      let(:projet_params) do {
        tel:   '01 02 03 04 05',
        email: 'particulier@exemple.fr'
      }
      end

      it "enregistre les informations modifiées" do
        expect(response).to redirect_to projet_path(projet)
        expect(projet.tel).to eq   '01 02 03 04 05'
        expect(projet.email).to eq 'particulier@exemple.fr'
      end
    end

    context "lorsque la personne de confiance change" do
      let(:projet_params) do {
        personne_de_confiance_attributes: {
          civilite:            'mr',
          prenom:              'Tyrone',
          nom:                 'Meehan',
          tel:                 '01 02 03 04 05',
          lien_avec_demandeur: 'ami'
        }
      }
      end

      it "enregistre la personne de confiance" do
        expect(response).to redirect_to projet_path(projet)
        expect(projet.personne_de_confiance.civilite).to            eq 'mr'
        expect(projet.personne_de_confiance.prenom).to              eq 'Tyrone'
        expect(projet.personne_de_confiance.nom).to                 eq 'Meehan'
        expect(projet.personne_de_confiance.tel).to                 eq '01 02 03 04 05'
        expect(projet.personne_de_confiance.lien_avec_demandeur).to eq 'ami'
      end
    end

    context "lorsque l'adresse est vide" do
      let(:projet_params) do { adresse_postale: '' } end

      it "affiche une erreur" do
        expect(response).to render_template(:etape1_recuperation_infos)
        expect(flash[:alert]).to eq I18n.t('demarrage_projet.etape1_demarrage_projet.erreurs.adresse_vide')
      end
    end

    context "lorsque l'adresse est identique" do
      let!(:adresse_initiale) { projet.adresse_postale }
      let(:projet_params) do { adresse_postale: projet.adresse_postale.description } end

      it "conserve l'adresse existante" do
        expect_any_instance_of(ApiBan).not_to receive(:precise)
        expect(projet.adresse_postale).to eq adresse_initiale
      end
    end

    context "lorsque l'adresse change" do
      context "et est disponible dans la BAN" do
        let(:projet_params) do { adresse_postale: Fakeweb::ApiBan::ADDRESS_ROME } end

        it "enregistre l'adresse précisée" do
          expect(projet.adresse_postale).to be_present
          expect(projet.adresse_postale.ligne_1).to     eq "65 rue de Rome"
          expect(projet.adresse_postale.code_insee).to  eq "75008"
          expect(projet.adresse_postale.code_postal).to eq "75008"
          expect(projet.adresse_postale.ville).to       eq "Paris"
          expect(projet.adresse_postale.departement).to eq "75"
          expect(projet.adresse_postale.latitude).to    be_within(0.1).of 57.9
          expect(projet.adresse_postale.longitude).to   be_within(0.1).of 5.8
          expect(projet.adresse_postale.description).to eq Fakeweb::ApiBan::ADDRESS_ROME
        end
      end

      context "et n'est pas disponible dans la BAN" do
        let(:projet_params) do { adresse_postale: Fakeweb::ApiBan::ADDRESS_UNKNOWN } end
        it "affiche une erreur" do
          expect(response).to render_template(:etape1_recuperation_infos)
          expect(flash[:alert]).to eq I18n.t('demarrage_projet.etape1_demarrage_projet.erreurs.adresse_inconnue')
        end
      end
    end
  end
end
