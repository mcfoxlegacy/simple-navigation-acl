module SimpleNavigationAcl
  class AclRule < ActiveRecord::Base
    self.table_name = :acl_rules
    validates :id, :context, :key, presence: true
  end
end