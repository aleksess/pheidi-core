class CreatePheidiTables < ActiveRecord::Migration[8.1]
  def change
    # conversations
    create_table :pheidi_conversations, id: :uuid do |t|
      t.string :slug, index: { unique: true }
      t.json :metadata, default: {}
      t.timestamps
    end

    # conversation memberships
    create_table :pheidi_memberships, id: :uuid do |t|
      t.references :conversation, type: :uuid, null: false
      t.string :participant_type, null: false
      t.string :participant_id,   null: false
      t.string :role, default: "member"
      t.timestamps
    end

    # messages
    create_table :pheidi_messages, id: :uuid do |t|
      t.references :conversation, type: :uuid, null: false
      t.string :sender_type, null: false
      t.string :sender_id,   null: false
      t.text :body, null: false
      t.timestamps
    end

    add_index :pheidi_messages, :created_at
  end
end
