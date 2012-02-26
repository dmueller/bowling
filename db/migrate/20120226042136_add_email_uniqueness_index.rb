class AddEmailUniquenessIndex < ActiveRecord::Migration
  def up
    # enforce email uniqueness in the database - note that this is case sensitive
    # (which differs from our model's checks)
    add_index :users, :email, :unique => true
  end

  def down
    remove_index :users, :email
  end
end
