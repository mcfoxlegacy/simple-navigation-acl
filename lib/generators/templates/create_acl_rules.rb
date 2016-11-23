class CreateAclRules < ActiveRecord::Migration

  def up
    unless table_exists?(:acl_rules)
      create_table :acl_rules, id: false do |t|
        t.string :id, null: false, index: true
        t.string :context, null: false, default: 'default', index: true
        t.string :key, null: false, index: true
      end
    end
    add_index :acl_rules, [:id, :context, :key] unless index_exists?(:acl_rules, [:id, :context, :key])
  end

  def down
    drop_table :acl_rules if table_exists? :acl_rules
  end

end
