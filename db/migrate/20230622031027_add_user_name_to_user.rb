class AddUserNameToUser < ActiveRecord::Migration[7.0]
    def up
      unless column_exists?(:users, :username)
        add_column :users, :username, :string, unique: true
      end
    end

    def down
      if column_exists?(:users, :username)
        remove_column :users, :username, :string, unique: true
      end
    end
  end