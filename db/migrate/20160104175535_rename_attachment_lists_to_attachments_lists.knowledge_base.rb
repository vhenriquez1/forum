# This migration comes from knowledge_base (originally 20140410203342)
class RenameAttachmentListsToAttachmentsLists < ActiveRecord::Migration
  def change
    rename_table :knowledge_base_sectionables_attachment_lists, :knowledge_base_sectionables_attachments_lists
  end
end
