class AddDecompToComments < ActiveRecord::Migration
  def change
    add_column :comments, :decomp, :string
  end
end
