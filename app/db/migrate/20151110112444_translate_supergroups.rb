class TranslateSupergroups < ActiveRecord::Migration
  def self.up
    Supergroup.create_translation_table!({
      :name => :string,
      :call_to_action => :string,
      :action1 => :string,
      :explanation => :text,
      :submissions_heading => :text,
      :union_rep_quote => :text,
      :union_rep_cite => :string,
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Supergroup.drop_translation_table! :migrate_data => true
  end
end