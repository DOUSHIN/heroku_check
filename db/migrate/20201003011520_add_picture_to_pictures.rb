class AddPictureToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :content, :text
    add_column :pictures, :image, :text
  end
end
