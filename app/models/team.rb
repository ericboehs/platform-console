class Team < ApplicationRecord
  belongs_to :owner, polymorphic: true
end