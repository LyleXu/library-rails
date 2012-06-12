class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn
      t.string :publisher
      t.string :author
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
