class Sale < ApplicationRecord
  belongs_to :shoe
  belongs_to :buyer,
    class_name: 'User',
    foreign_key: 'buyer_id'
  belongs_to :seller,
    class_name: 'User',
    foreign_key: 'seller_id'
end
