class Customer < ActiveRecord::Base
  has_many :credit_cards
end
