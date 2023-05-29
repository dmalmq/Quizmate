class Option < ApplicationRecord
  belongs_to :question, dependent: :destroy
end
