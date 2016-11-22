module SimpleNavigationAcl
  class Base

    @contexts = [:default]
    @current_user_method = :current_user

    class << self

      attr_accessor :current_user_method

      attr_reader :contexts
      def contexts=(contexts)
        contexts = [contexts] unless contexts.is_a?(Array)
        @contexts = contexts.map(&:to_sym)
        @contexts.uniq!
      end

      def navigations(obj_caller=nil, inline: false)
        navigations = {}
        SimpleNavigationAcl::Base.contexts.each do |context|
          SimpleNavigation::Helpers.load_config({context: context}, obj_caller)
          primary_navigation = SimpleNavigation.config.primary_navigation
          navigations[context] = inline==true ? get_nav_items_inline(primary_navigation) : get_nav_items(primary_navigation)
        end
        navigations
      end

      private
      def get_nav_items(nav)
        nav.items.map do |item|
          items = {key: item.key, name: item.name, url: item.url, level: nav.level}
          items[:items] = get_nav_items(item.sub_navigation) if item.sub_navigation.present?
          items
        end
      end

      def get_nav_items_inline(nav, parent_key=nil)
        items = []
        nav.items.each do |item|
          h_item = {key: item.key, name: item.name, url: item.url, level: nav.level}
          h_item[:parent_key] = parent_key unless parent_key.nil?
          items << h_item
          items = items + get_nav_items_inline(item.sub_navigation, item.key) if item.sub_navigation.present?
        end
        items
      end

    end

  end
end
