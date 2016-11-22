module SimpleNavigationAcl
  class PermissionsController < ApplicationController

    def edit

    end

    def show

    end

    def update
      id = params[:id]
      acl_item = params[:acl_item]
      acl_item.each do |context, menus|

      end
      flash[:notice] = "Salvo com sucesso #{id}"
      redirect_to simple_navigation_acl_edit_path(id: id)
    end

  end
end