class Contact < ActiveRecord::Base
  validates :name, :email, :phone, :message, presence: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
