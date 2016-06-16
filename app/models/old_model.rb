class OldModel < ActiveRecord::Base
  after_create :create_new_model
  after_update :update_new_model
  after_destroy :destroy_new_model

  def create_new_model
    NewModel.create do |m|
      copy_data(m)
    end
  end

  def update_new_model
    new_model = NewModel.find_by(id: self.id)

    if new_model
      copy_data(new_model)
      new_model.save!
    else
      create_new_model
    end
  end

  def destroy_new_model
    NewModel.destroy(self.id)
  end

  def copy_data(new_model)
    new_model.id = self.id
    new_model.bar = self.foo
    new_model.created_at = self.created_at
    new_model.updated_at = self.updated_at
  end
end
