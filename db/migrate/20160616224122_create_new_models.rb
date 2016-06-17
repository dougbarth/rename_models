class CreateNewModels < ActiveRecord::Migration
  def change
    create_table :new_models, id: false do |t|
      t.integer :id
      t.string :bar

      t.timestamps null: false
    end
    execute <<-SQL
      ALTER TABLE new_models ALTER COLUMN id SET DEFAULT nextval('old_models_id_seq'::regclass);
      ALTER TABLE new_models ALTER COLUMN id SET NOT NULL;
      ALTER TABLE new_models ADD PRIMARY KEY (id);
    SQL
  end
end
