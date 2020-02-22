class Customer < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :transactions, dependent: :destroy

  validates :name, :address, :phone, :email, :status, presence: true
  
  enum status: {
    active: 'active',
    archived: 'archived',
    draft: 'draft',
    suspended: 'suspended'
  }
end
