class Project < ApplicationRecord
  belongs_to :manager, class_name: :User, foreign_key: :manager_id
  # has_many :bugs, inverse_of: :project
end
