class CreateNewModels < ActiveRecord::Migration
  def change
    create_table :new_models, id: false do |t|
      t.integer :id
      t.string :bar

      t.timestamps null: false
    end
  end
end
