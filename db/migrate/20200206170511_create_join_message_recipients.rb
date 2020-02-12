class CreateJoinMessageRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :join_message_recipients do |t|
      t.references :recipient, index: true
      t.belongs_to :private_message

      t.timestamps
    end
  end
end
