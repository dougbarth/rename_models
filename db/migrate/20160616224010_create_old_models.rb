class CreateOldModels < ActiveRecord::Migration
  def change
    create_table :old_models do |t|
      t.string :foo

      t.timestamps null: false
    end
  end
end
