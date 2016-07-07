class AddEmail2AndEmail3ToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :email_2, :string
    add_column :companies, :email_3, :string
  end
end
