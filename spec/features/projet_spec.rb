require 'rails_helper'

describe "Projet", type: :feature do
  let(:projet) { FactoryGirl.create(:projet) }
  scenario "initialisation du projet" do
    visit new_projet_path
    fill_in :projet_numero_fiscal, with: '12'
    fill_in :projet_reference_avis, with: '15'
    fill_in :projet_description, with: "Je veux changer ma chaudière"
    click_button "Démarrez votre projet"
    expect(page).to have_content("Martin")
  end

  scenario "ajout d'un acteur non référencé" do
    visit projet_path(projet)
    fill_in :nouveau_contact_name, with: 'Syndic de la Mare'
    fill_in :nouveau_contact_email, with: 'syndic@lamare.com'
    choose 'operator'
    fill_in :nouveau_contact_message, with: "J'attends de vous ..."
    click_button "J'invite ce nouveau contact"
    expect(page).to have_content('Syndic de la Mare')
    expect(page).to have_content('syndic')
    expect(page).to have_content("J'attends une réponse")
  end
end
