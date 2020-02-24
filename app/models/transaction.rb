class Transaction < ApplicationRecord
  belongs_to :to_account, class_name: :Account, optional: -> { atm? || charge? || withdrawal? }
  belongs_to :from_account, class_name: :Account, optional: -> { deposit? }

  validates :amount, :transaction_type, presence: true

  enum transaction_type: { 
    atm: 'ATM', # Deposit or withdraw funds using an ATM.
    charge: 'Charge', # Record a purchase on a credit card or withdraw funds using a debit card.
    check: 'Check', # Withdraw funds by writing a paper check. Choosing this type will automatically insert a number in the '#' field (the next number in sequence from the last check recorded).
    deposit: 'Deposit', # Add funds to an account by any method.
    online: 'Online', # Withdraw funds through a web-based store or online banking service.
    pos: 'POS', # Withdraw funds through a point-of-sale transaction (typically a cash or debit card purchase).
    transfer: 'Transfer', # Move funds from one account to another.
    withdrawal: 'Withdrawal' # Deduct funds from an account by any method.
  }

  # after_commit :process_transaction, on: :create
  before_commit :process_transaction, on: :create, if: :transfer?

  def process_transaction
    Transaction.transaction do
      to_account.with_lock do
        to_account.balance -= amount
        to_account.save!
      end
      from_account..with_lock do
        from_account.balance += amount
        from_account.save!
      end
      self
    end
  end

end
