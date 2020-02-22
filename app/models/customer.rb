class Customer < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :sent_transactions, foreign_key: :to_customer_id, class_name: :Transaction, dependent: :destroy
  has_many :received_transactions, foreign_key: :from_customer_id, class_name: :Transaction, dependent: :destroy

  validates :name, :address, :phone, :email, :status, presence: true
  validates :email, :phone, uniqueness: true

  enum status: {
    active: 'active',
    archived: 'archived',
    draft: 'draft',
    suspended: 'suspended'
  }
end
