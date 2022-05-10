class CreateSubs < ActiveRecord::Migration[7.0]
  def change
    create_table :subs do |t|
      t.string :name, null: false
      t.text :detail, null: false

      t.timestamps
    end
  end
end
