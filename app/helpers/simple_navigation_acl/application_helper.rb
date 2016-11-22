module SimpleNavigationAcl
  module ApplicationHelper

    def show_tree_menu(navigation_context=:default)
      # raise SimpleNavigationAcl::Base.contexts.inspect


      # SimpleNavigation.load_config navigation_context
      # debug SimpleNavigation.config_files.keys

      # SimpleNavigation.load_config navigation_context
      # debug SimpleNavigation.primary_navigation

      # context = SimpleNavigation.config_files[navigation_context]
      # x = SimpleNavigation.context_for_eval.instance_eval(context)

      # menus = {}
      # SimpleNavigationAcl::Base.contexts.each do |context|
      #   SimpleNavigation::Helpers.load_config({context: context}, self)
      #   menus[context] = get_nav_items(SimpleNavigation.config.primary_navigation)
      # end
      # raise self.send(SimpleNavigationAcl::Base.current_user_method).inspect
      # debug(menus)

      # debug()
      menus = SimpleNavigationAcl::Base.navigations(self)


      menus.each do |key, menu|
        concat(content_tag(:field_set) do
          concat content_tag(:legend, key.to_s.humanize)
          concat content_tag(:table)


        end)
      end

    end

  end
end


