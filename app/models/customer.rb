class Customer < ApplicationRecord
  has_many :accounts, dependent: :destroy

  validates :name, :address, :phone, :email, :status, presence: true
  validates :email, :phone, uniqueness: true

  enum status: {
    active: 'active',
    archived: 'archived',
    draft: 'draft',
    suspended: 'suspended'
  }
end
