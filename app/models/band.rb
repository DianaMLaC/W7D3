class Band < ApplicationRecord
    validates :name, presence: true

    attr_reader :name
end
