module SimpleNavigationAcl
  module ApplicationHelper

    def navigations_from_context(context)
      SimpleNavigationAcl::Base.navigations(self, context)[context] rescue []
    end

    def show_navigation_tree(navs, rules)
      render partial: 'simple_navigation_acl/rules/tree', locals: {navs: navs, rules: rules}
    end

    def acl_previous_url
      # session[:previous_url] is a Rails built-in variable to save last url.
      session[:acl_previous_url] || session[:previous_url]
    end

  end
end


