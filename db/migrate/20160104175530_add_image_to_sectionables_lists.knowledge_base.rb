# This migration comes from knowledge_base (originally 20140325083548)
class AddImageToSectionablesLists < ActiveRecord::Migration
  def change
    add_column :knowledge_base_sectionables_lists, :image, :string
  end
end
