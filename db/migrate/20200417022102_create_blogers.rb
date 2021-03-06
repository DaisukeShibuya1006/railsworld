# frozen_string_literal: true

class CreateBlogers < ActiveRecord::Migration[5.2]
  def change
    create_table :blogers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
