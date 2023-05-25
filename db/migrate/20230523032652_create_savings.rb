class CreateSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :savings do |t|
      t.integer :save_amount, null:false
      t.references :user, null:false, foreign_key: true
      # t.boolean :checked, null:false
      t.timestamps
    end
  end
end
