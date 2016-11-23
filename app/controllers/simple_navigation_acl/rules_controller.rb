module SimpleNavigationAcl
  class RulesController < ApplicationController

    before_action :set_rule, only: [:edit, :show]

    def edit
    end

    def show
    end

    def update
      errors = []

      resource_id = params[:id]
      acl_item = params[:acl_item]

      SimpleNavigationAcl::AclRule.where(id: resource_id).delete_all

      acl_item.each do |context, menus|
        menus.each do |menu|
          rule = SimpleNavigationAcl::AclRule.find_or_create_by(id: resource_id, context: context, key: menu)
          if rule.errors.present?
            errors = errors + rule.errors.full_messages
          end
        end
      end

      respond_to do |format|
        if errors.blank?
          flash[:notice] = I18n.t(:save, scope: [:simple_navigation_acl, :messages])
          format.html { redirect_to simple_navigation_acl_show_path(id: resource_id) }
          format.json { render json: acl_item, status: :ok, location: simple_navigation_acl_show_path(id: resource_id) }
        else
          flash[:error] = errors.join(', ')
          format.html { render :edit }
          format.json { render json: errors, status: :unprocessable_entity }
        end
      end
    end

    private
    def set_rule
      @id = params[:id]
      @rules = SimpleNavigationAcl::AclRule.where(id: @id).pluck(:context, :key)
    end

  end
end