# frozen_string_literal: true

class Answer < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :question

  validates :body, presence: true

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
