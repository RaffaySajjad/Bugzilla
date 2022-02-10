class Project < ApplicationRecord
  has_and_belongs_to_many :user, foreign_key: true
  has_many :bug
end
