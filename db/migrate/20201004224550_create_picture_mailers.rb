class CreatePictureMailers < ActiveRecord::Migration[5.2]
  def change
    create_table :picture_mailers do |t|

      t.timestamps
    end
  end
end
