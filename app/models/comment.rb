class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :content
  # Websocket broadcast
  broadcasts_to :post
end
