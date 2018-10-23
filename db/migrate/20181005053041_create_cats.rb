class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string  :name
      t.integer :age
      t.string  :text
      t.string  :url
      t.timestamps
    end
  end
end
