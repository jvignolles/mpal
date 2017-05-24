class RemoveUnusedColumnsFromPrestations < ActiveRecord::Migration
  def change
    remove_column :prestations, :entreprise
    remove_column :prestations, :recevable
    remove_column :prestations, :scenario
    remove_column :prestations, :souhaite
    remove_column :prestations, :preconise
    remove_column :prestations, :retenu
  end
end
