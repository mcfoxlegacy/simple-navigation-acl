module SimpleNavigationAcl
  module ApplicationHelper

    def navigations_from_context(context)
      SimpleNavigationAcl::Base.navigations(self, context)[context] rescue []
    end

    def show_navigation_tree(navs)
      render partial: 'simple_navigation_acl/permissions/tree', locals: {navs: navs}
    end

  end
end


