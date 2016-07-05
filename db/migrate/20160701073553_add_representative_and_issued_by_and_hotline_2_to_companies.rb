class AddRepresentativeAndIssuedByAndHotline2ToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :representative, :string
    add_column :companies, :issued_by, :string
    add_column :companies, :hotline_2, :string
  end
end
