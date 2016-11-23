module SimpleNavigationAcl
  module ApplicationHelper

    def navigations_from_context(context)
      SimpleNavigationAcl::Base.navigations(self, context)[context] rescue []
    end

    def show_navigation_tree(navs, rules=[], readonly: false)
      render partial: 'simple_navigation_acl/tree', locals: {navs: navs, rules: rules, readonly: readonly}
    end

  end
end