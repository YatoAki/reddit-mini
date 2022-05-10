class CreateSubs < ActiveRecord::Migration[7.0]
  def change
    create_table :subs do |t|
      t.string :name
      t.text :detail

      t.timestamps
    end
  end
end
