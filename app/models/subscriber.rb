class Subscriber < ApplicationRecord
    before_save :default_values
    def default_values
      self.subscribed = true if self.subscribed.nil?
    end
end
