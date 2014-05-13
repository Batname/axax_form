class AddDecompToForms < ActiveRecord::Migration
  def change
    add_column :forms, :decomp, :string
  end
end
