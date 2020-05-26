# frozen_string_literal: true

class CreateHumen < ActiveRecord::Migration[5.2]
  def change
    create_table :humen do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
