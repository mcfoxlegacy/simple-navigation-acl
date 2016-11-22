module SimpleNavigationAcl
  class User < ActiveRecord::Base

    self.table_name = :simple_navigation_acl_users

    belongs_to :user

    validates :widget, :action, presence: true
  end
end