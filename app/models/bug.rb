class Bug < ApplicationRecord
  belongs_to :project, class_name: :Project, foreign_key: :project_id, optional: true
  belongs_to :assignee, class_name: :User, foreign_key: :assignee_id, optional: true
  # belongs_to :project, foreign_key: true
  # belongs_to :user, foreign_key: true
  has_many_attached :screenshots
  enum bug_type: { Bug: 0, Feature: 1 }
  enum status: { New: 0, Started: 1, Completed: 2, Resolved: 3 }

  validates :screenshots, presence: false, blob: { content_type: :image } # supported options: :image, :audio, :video, :text

end
