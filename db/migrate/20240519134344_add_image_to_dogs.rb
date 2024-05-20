class AddImageToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :image, :string
  end
end
