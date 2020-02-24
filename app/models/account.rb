class Account < ApplicationRecord
  belongs_to :customer
  has_one :currency
  has_many :sent_transactions, foreign_key: :to_customer_id, class_name: :Transaction, dependent: :destroy
  has_many :received_transactions, foreign_key: :from_customer_id, class_name: :Transaction, dependent: :destroy

  validates :account_type, :balance, :number, :status, presence: true
  validates :number, uniqueness: true
  validates :balance, numericality: { greater_than_or_equal_to: 0, message: "is NOT sufficient" }

  enum status: { 
    active: 'active',
    deleted: 'deleted',
    draft: 'draft',
    suspended: 'suspended'
  }

  enum account_type: { 
    basic: 'Basic Checking Account',
    savings: 'Savings Account',
    interest_bearing_checking: 'Interest Bearing Checking Account',
    money_market: 'Money Market Account',
    cds: 'CD’s Account',
    ira: 'IRA (investment retirement account)',
    brokerage: 'Brokerage Account'
  }

end
