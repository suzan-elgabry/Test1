class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :date_of_birth

      t.timestamps
    end
  end
end
