class Account < ApplicationRecord
  belongs_to :customer
  has_one :currency

  validates :account_type, :balance, :number, :status, presence: true

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
