class Maker < ApplicationRecord
    has_many :products, dependent: :destroy
end
