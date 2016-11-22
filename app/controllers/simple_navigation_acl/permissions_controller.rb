module SimpleNavigationAcl
  class PermissionsController < ApplicationController

    def index
      @permissions = SimpleNavigationAcl::Base.navigations(self, inline: true)
    end

  end
end