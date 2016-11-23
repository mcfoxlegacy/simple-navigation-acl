require 'rails/generators/base'

module SimpleNavigationAcl
  module Generators

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      include Rails::Generators::Migration
      class_option :orm

      desc 'Migrations'
      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def create_migration_file
        migration_template 'create_acl_rules.rb', 'db/migrate/create_acl_rules.rb'
      end

      def copy_initializer
        copy_file 'initializer.rb', 'config/initializers/simple_navigation_acl.rb'
      end

      def copy_locales
        directory File.expand_path("../../../../config/locales", __FILE__), 'config/locales'
      end

      def copy_views
        directory File.expand_path("../../../../app/views/simple_navigation_acl/rules", __FILE__), 'app/views/simple_navigation_acl/rules'
      end

    end

  end
end