class ChoixOperateurController < ApplicationController
  layout 'inscription'

  before_action :assert_projet_courant
  before_action :init_view

  def new
    @suggested_operateurs = @projet_courant.pris_suggested_operateurs.shuffle
    @other_operateurs = fetch_operateurs.shuffle - @suggested_operateurs
    @operateur = @projet_courant.contacted_operateur

    if @operateur.present?
      @action_label = I18n.t("choix_operateur.actions.changer")
    else
      @action_label = I18n.t("choix_operateur.actions.contacter")
    end
  end

  def choose
    begin
      @projet_courant.update_attribute(:disponibilite, params[:projet][:disponibilite])
      operateur = Intervenant.find_by_id(params[:operateur_id])
      unless @projet_courant.contacted_operateur == operateur
        @projet_courant.contact_operateur!(operateur)
        flash[:notice_titre] = t('invitations.messages.succes_titre')
        flash[:notice] = t('invitations.messages.succes', intervenant: operateur.raison_sociale)
      end
      redirect_to projet_path(@projet_courant)
    rescue => e
      logger.error e.message
      redirect_to projet_choix_operateur_path(@projet_courant), alert: "Une erreur s’est produite lors du choix de l’opérateur."
    end
  end

private
  def fetch_operateurs
    if ENV['ROD_ENABLED'] == 'true'
      rod_response = Rod.new(RodClient).query_for(@projet_courant)
      rod_response.operateurs
    else
      @projet_courant.intervenants_disponibles(role: :operateur)
    end
  end

  def init_view
    @page_heading = I18n.t("choix_operateur.title")
  end
end

