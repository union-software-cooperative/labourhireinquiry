class AddUnionToPerson < ActiveRecord::Migration
  def change
    add_reference :people, :union, index: true
  	add_foreign_key :people, :supergroups, column: :union_id
  end
end
