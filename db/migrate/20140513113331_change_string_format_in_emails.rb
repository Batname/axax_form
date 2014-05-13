class ChangeStringFormatInEmails < ActiveRecord::Migration
  def change
    change_column :emails, :frequency, :string
  end
end
