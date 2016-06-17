class MoveSequence < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER SEQUENCE old_models_id_seq RENAME TO new_models_id_seq;
      ALTER SEQUENCE new_models_id_seq OWNED BY new_models.id;
    SQL
  end
end
