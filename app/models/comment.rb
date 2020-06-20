class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :microposts, optional: true
end
