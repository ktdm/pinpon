class ChangeExplanations < ActiveRecord::Migration
  def change
    change_column :explanations, :example, :text, :null => true
  end
end
