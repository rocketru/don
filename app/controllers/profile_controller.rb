class ProfileController < ApplicationController
  def index
    breadcrumbs.add "profile", profile_path
  end
end
