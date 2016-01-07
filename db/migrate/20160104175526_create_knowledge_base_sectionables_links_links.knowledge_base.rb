# This migration comes from knowledge_base (originally 20140307092719)
class CreateKnowledgeBaseSectionablesLinksLinks < ActiveRecord::Migration
  def change
    create_table :knowledge_base_sectionables_links_links do |t|
      t.string :title
      t.string :url
      t.integer :position
      t.references :links

      t.timestamps
    end
  end
end
