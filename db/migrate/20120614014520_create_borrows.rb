class CreateBorrows < ActiveRecord::Migration
  def change
    create_table :borrows do |t|
      t.references :book
      t.references :user
      t.datetime :borrowed_date
      t.datetime :returned_date
      t.datetime :scheduled_return_date

      t.timestamps
    end
    add_index :borrows, :book_id
    add_index :borrows, :user_id
  end
end
