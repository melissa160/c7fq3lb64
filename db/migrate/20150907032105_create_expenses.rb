class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :category, index: true
      t.date :date
      t.string :concept
      t.decimal :amount
      t.integer :user_id

      t.timestamps null: false
    end
    add_foreign_key :expenses, :categories
  end
end
