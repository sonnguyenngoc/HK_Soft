class AddPhoneAndSubjectToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :phone, :string
    add_column :contacts, :subject, :string
  end
end
