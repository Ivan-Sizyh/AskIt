# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.0] # rubocop:disable Style/Documentation
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
