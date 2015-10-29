class AddSocialMediaToSupergroup < ActiveRecord::Migration
  def change
    add_column :supergroups, :hashtags, :string
    add_column :supergroups, :tweet, :string
    add_column :supergroups, :facebook_image, :string
  end
end
