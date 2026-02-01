class RemoveImageFromFurimas < ActiveRecord::Migration[7.1]
  def change
    remove_column :furimas, :image, :string
  end
end
