# This migration comes from knowledge_base (originally 20140404234850)
class CreateKnowledgeBaseSectionablesAttachments < ActiveRecord::Migration
  def change
    create_table :knowledge_base_sectionables_attachments do |t|
      t.string :title
      t.string :file
    end
  end
end
