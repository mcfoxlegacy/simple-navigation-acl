module SimpleNavigationAcl
  class RulesController < ApplicationController

    after_filter :save_acl_previous_url, only: [:edit, :show]

    def edit
      @resource_id = params[:id]
      @rules = SimpleNavigationAcl::AclRule.where(id: @resource_id).pluck(:context, :key)
    end

    def show
      @resource_id = params[:id]
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
          format.html { redirect_to session[:acl_previous_url] }
          format.json { render json: acl_item, status: :ok, location: simple_navigation_acl_show_path(id: resource_id) }
        else
          flash[:error] = errors.join(', ')
          format.html { render :edit }
          format.json { render json: errors, status: :unprocessable_entity }
        end
      end
    end

    private
    def save_acl_previous_url
      # session[:previous_url] is a Rails built-in variable to save last url.
      session[:acl_previous_url] = URI(request.referer || '').path
    end

  end
end