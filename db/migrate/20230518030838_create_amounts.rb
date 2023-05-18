class CreateAmounts < ActiveRecord::Migration[6.0]
  def change
    create_table :amounts do |t|
      t.integer :amount, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
