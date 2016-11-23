module SimpleNavigation
  class Configuration
    def apply_acl(id, context=:default)
      SimpleNavigationAcl::Base.apply_acl(self, id, context)
    end
  end
  class ItemContainer
    def apply_acl(id, context=:default)
      SimpleNavigationAcl::Base.apply_acl(self, id, context)
    end
  end
end