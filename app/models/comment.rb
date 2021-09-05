class Comment < ApplicationRecord
belongs_to :user
belongs_to :movie

with_options presence: true do
  validates :comment_title, :comment_text
end

end
