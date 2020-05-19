require "pry"
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    counter = 0
    if sender.balance > amount && counter == 0
      receiver.deposit(amount) && sender.deposit(-amount) && self.status = "complete"
      counter += 1
    else
      "Insufficient funds"
    end
  end
end
