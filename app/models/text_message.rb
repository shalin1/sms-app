class TextMessage < ApplicationRecord
   validates :to, :body, presence: true
#    TODO: validate phone number for phone numberyness
end
