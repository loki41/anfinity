class AddMetaDataToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :meta_title, :string
    add_column :posts, :meta_description, :text
    add_column :posts, :meta_keywords, :string
  end
end
