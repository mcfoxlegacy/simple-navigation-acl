module SimpleNavigationAcl
  module ApplicationHelper

    def navigations_from_context(context)
      SimpleNavigationAcl::Base.navigations(self, context)[context] rescue []
    end

    def show_navigation_tree(navs, rules=[], readonly: false)
      render partial: 'simple_navigation_acl/tree', locals: {navs: navs, rules: rules, readonly: readonly}
    end

    def render_navigation_acl(options = {}, &block)
      # render_navigation(options, &block)
      container = active_navigation_item_container(options, &block)
      acl_id = options.key?(:alc_id) ? options[:alc_id].to_sym : nil
      container && container.apply_acl(acl_id, options[:context]) && container.render(options)
    end

  end
end