class AddAvatarToUniverses < ActiveRecord::Migration[5.1]
  def change
    add_column :universes, :avatar, :string
  end
end
